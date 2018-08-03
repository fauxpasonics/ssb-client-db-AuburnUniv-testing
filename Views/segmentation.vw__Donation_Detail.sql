SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO










CREATE VIEW  [segmentation].[vw__Donation_Detail]

AS
(
SELECT * FROM (
		SELECT 

		--trans.DonorId
		dc.SSB_CRMSYSTEM_CONTACT_ID
		,trans.TransDate
		,trans.DriveCode
		,trans.DriveFullName
		,trans.UsageCode
		,trans.UsageFullName
		,trans.Entity1
		,trans.Entity2
		,trans.Entity2Name
		,trans.MotiveCode
		, SUM(ISNULL(PLG_AMT,0)) AS  PLG_AMT
		, SUM(ISNULL(DON_AMT,0))  AS DON_AMT

		FROM [ro].[vw_Donation_Transaction] trans
		INNER JOIN [dbo].[vwDimCustomer_ModAcctId] dc
			ON trans.SoftDonorId = dc.SSID AND dc.SourceSystem = 'Paciolan'
		
		WHERE trans.SoftDonorId <> trans.DonorId

		GROUP BY dc.SSB_CRMSYSTEM_CONTACT_ID
		,trans.TransDate
		,trans.DriveCode
		,trans.DriveFullName
		,trans.UsageCode
		,trans.UsageFullName
		,trans.Entity1
		,trans.Entity2
		,trans.Entity2Name
		,trans.MotiveCode

		UNION ALL

		SELECT 

		--trans.SoftDonorId
		trans.SSB_CRMSYSTEM_CONTACT_ID
		,trans.TransDate
		,trans.DriveCode
		,trans.DriveFullName
		,trans.UsageCode
		,trans.UsageFullName
		,trans.Entity1
		,trans.Entity2
		,trans.Entity2Name
		,trans.MotiveCode
		, SUM(ISNULL(PLG_AMT,0)) AS  PLG_AMT
		, SUM(ISNULL(DON_AMT,0))  AS DON_AMT

		FROM [ro].[vw_Donation_Transaction] trans
		WHERE trans.SoftDonorId = trans.DonorId

		GROUP BY trans.SSB_CRMSYSTEM_CONTACT_ID
		,trans.TransDate
		,trans.DriveCode
		,trans.DriveFullName
		,trans.UsageCode
		,trans.UsageFullName
		,trans.Entity1
		,trans.Entity2
		,trans.Entity2Name
		,trans.MotiveCode
) x



)


	


         







GO
