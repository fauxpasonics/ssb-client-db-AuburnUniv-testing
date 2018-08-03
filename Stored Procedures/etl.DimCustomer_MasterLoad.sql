SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Created By: Abbey Meitin
-- Create Date: before we tracked
-- Reviewed By: 
-- Reviewed Date: 
-- Description: DimCustomer Load Sproc
-- =============================================
 
/***** Revision History
 
Abbey Meitin: 2018/7/23 - removed Salesforce delete logic; Scott Sales: 2018/7/23 - approved the removal of SFDC delete logic

*****/

CREATE PROCEDURE [etl].[DimCustomer_MasterLoad]

AS
BEGIN



-- Data Uploader
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'AuburnUniv', @LoadView = 'api.UploadDimCustomerStaging', @LogLevel = '2', @DropTemp = '1', @IsDataUploaderSource = '1'


-- TI
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'AuburnUniv', @LoadView = 'etl.vw_Load_DimCustomer_Paciolan', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'


--Adobe
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'AuburnUniv', @LoadView = '[etl].[vw_Load_DimCustomer_Adobe]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'


-- SFDC
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'AuburnUniv', @LoadView = 'etl.vw_Load_DimCustomer_SFDCAccount', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'


----SFDC deletes
--UPDATE b
--	SET b.IsDeleted = a.IsDeleted
--	,deletedate = GETDATE()
--	--SELECT a.IsDeleted
--	--SELECT COUNT(*) 
--	FROM AuburnUniv_Reporting.ProdCopy.Account a (NOLOCK)
--	INNER JOIN dbo.DimCustomer b (NOLOCK) ON a.id = b.SSID AND b.SourceSystem = 'Auburn PC_SFDC Account'
--	WHERE a.IsDeleted <> b.IsDeleted

--Paciolan deletes (added 12/22/2017 by AMEITIN)
UPDATE dc
	SET IsDeleted = '1'
	, DeleteDate = GETUTCDATE()
	--SELECT * 
	FROM dbo.DimCustomer dc (NOLOCK)
	LEFT JOIN (select DISTINCT PATRON
				FROM dbo.PD_PATRON (NOLOCK)) p on dc.SourceSystem = 'Paciolan' AND dc.SSID = p.PATRON
	WHERE p.PATRON IS NULL
	AND SourceSystem = 'Paciolan'
	AND dc.IsDeleted = '0'

END

GO
