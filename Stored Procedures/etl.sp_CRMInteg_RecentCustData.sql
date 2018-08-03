SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Created By: Abbey Meitin
-- Create Date: before we tracked
-- Reviewed By: before we tracked
-- Reviewed Date: before we tracked
-- Description: CRM Source Loading Criteria
-- =============================================
 
/***** Revision History
 
Abbey Meitin 2018-06-06: Add Deceased Accounts to Salesforce per Jacob Jordan's request, Reviewed By: Payton Soicher 6/8/2018
 
*****/
 







CREATE   PROCEDURE [etl].[sp_CRMInteg_RecentCustData]
AS

TRUNCATE TABLE etl.CRMProcess_RecentCustData

DECLARE @Client VARCHAR(50)
SET @Client = 'AuburnUniv' --updateme


SELECT x.dimcustomerid, MAX(x.maxtransdate) maxtransdate, x.team
INTO #tmpTicketSales
	FROM (
		--Ticketing
		SELECT dc.DimCustomerID, MAX(tk.I_Date) MaxTransDate , @Client Team
		--Select * 
		FROM dbo.TK_ODET tk WITH(NOLOCK)	
		JOIN dbo.DimCustomer dc (NOLOCK) ON tk.Customer = dc.SSID AND Sourcesystem = 'Paciolan'	
		WHERE tk.I_Date >= DATEADD(YEAR, -5, GETDATE())
		GROUP BY dc.[DimCustomerId]

		UNION ALL

		--Donations
		SELECT dc.DimCustomerID, MAX(fd.[Date]) MaxTransDate , @Client Team
		--Select * 
		FROM dbo.FD_DONATION fd WITH(NOLOCK)	
		JOIN dbo.DimCustomer dc (NOLOCK) ON fd.Donor = dc.SSID AND Sourcesystem = 'Paciolan'	
		WHERE fd.[Date] >= DATEADD(YEAR, -5, GETDATE())
		GROUP BY dc.[DimCustomerId]

		UNION ALL

		SELECT dc.DimCustomerID, MAX(CreatedDate) MaxTransDate , @Client Team
		--Select distinct sourcesystem
		FROM  dbo.DimCustomer dc (NOLOCK)
		WHERE (SourceSystem like 'AuburnUpload_%' 
				OR SourceSystem = 'ReplyBuy' 
				OR SourceSystem = 'CBS_Auctions'
				OR SourceSystem = 'AClub_20180402')
		AND (dc.CreatedDate >= GETDATE() -10 OR dc.UpdatedDate >= GETDATE() -10)
		GROUP BY dc.[DimCustomerId]

		UNION ALL 

		----Adobe Form Submits
		SELECT dc.DimCustomerID, MAX(fs.SubmitDate) MaxTransDate, @Client Team
		--Select * 
		FROM [ods].[Adobe_FormSubmits] fs (NOLOCK)	
		JOIN  dbo.DimCustomer dc (NOLOCK)
			on fs.AccountPrimaryKey= dc.SSID and Sourcesystem = 'Adobe'	
		WHERE fs.SubmitDate >= DATEADD(Day, -90, GETDATE())
		GROUP BY dc.[DimCustomerId]

		UNION ALL

	    --Deceased Accounts added 2018-06-06
		SELECT dc.DimCustomerID, GETDATE() AS MaxTransDate , @Client Team
		--Select * 
		FROM dbo.PD_PATRON pd WITH(NOLOCK)	
		JOIN dbo.DimCustomer dc (NOLOCK) ON pd.Patron = dc.SSID AND Sourcesystem = 'Paciolan'	
		WHERE pd.[STATUS] = 'D'
		GROUP BY dc.[DimCustomerId]

		) x
		GROUP BY x.dimcustomerid, x.team


INSERT INTO etl.CRMProcess_RecentCustData (SSID, MaxTransDate, Team)
SELECT SSID, [MaxTransDate], Team FROM [#tmpTicketSales] a 
INNER JOIN dbo.[vwDimCustomer_ModAcctId] b ON [b].[DimCustomerId] = [a].[DimCustomerId]






GO
