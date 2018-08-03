SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW  [ro].[vw_Donation_Transaction]
AS
(

SELECT 

trans.DonorID
,COALESCE([matchee].[Match_DonorId], [trans].[DonorID], 'Unknown') as SoftDonorID
,dc.SSB_CRMSYSTEM_CONTACT_ID
,trans.TransNo
,CAST(trans.Sequence AS int) as Seq
,trans.[Date] as TransDate
,drive.DriveCode
,drive.DriveFullName 
--,ISNULL(DriveSport.Sport,'Unknown') AS Sport
--,ISNULL(DriveSport.Year,0) AS Year
,CONCAT(trans.DriveCode,':' COLLATE SQL_Latin1_General_CP1_CI_AS,trans.DonorID, ':' COLLATE SQL_Latin1_General_CP1_CI_AS,trans.Sequence) AS DDS
,usage.UsageCode
,usage.UsageFullName
,usage.Restricted
,usage.Inactive
,ISNULL(transUsage.Pledge,0) AS  PLG_AMT
,ISNULL(transUsage.Donation,0)  AS DON_AMT
,trans.MotiveCode
,ISNULL(et.SeatQuantity, 0) as UsageSeatQuantity
,ISNULL(et.Entity1,'Unknown') as Entity1
,ISNULL(et.Entity2, 'Unknown') as Entity2
,ISNULL(pt.ReceiptText, 'Unknown') AS Entity2Name
--,ISNULL(b.[Category0],'Unknown') AS Category0
--,ISNULL(b.[Category1],'Unknown') AS Category1
, pt.PricePerSeat
, trans.PayModeCode
FROM [ro].[vFD_Trans] trans 
	JOIN  [ro].[vFD_Drive] drive  
        ON trans.DriveCode = drive.DriveCode   
	JOIN  [ro].[vFD_Campaign] campaign  
        ON drive.CampaignCode = campaign.CampaignCode
	JOIN [ro].[vFD_Trans_Usage] transUsage  
		ON trans.TransNo = transUsage.TransNo
	JOIN [ro].[vFD_Usage] usage  
		ON transUsage.UsageCode = usage.UsageCode
	--LEFT JOIN auburn.Drive_Sport driveSport (NOLOCK)
	--	ON trans.DriveCode = driveSport.Drive COLLATE SQL_Latin1_General_CP1_CS_AS
	LEFT JOIN dbo.dimcustomerssbid dc  (NOLOCK)
		ON trans.DonorId = dc.SSID AND SourceSystem = 'Paciolan'
	LEFT JOIN [dbo].[PaciolanReporting_MostRecentConfig_Usages] et (NOLOCK) 
		ON et.FundUSage COLLATE SQL_Latin1_General_CP1_CS_AS = transUsage.UsageCode COLLATE SQL_Latin1_General_CP1_CS_AS
	LEFT JOIN [dbo].[PaciolanReporting_MostRecentConfig_PriceTables] pt
		ON pt.Drive COLLATE SQL_Latin1_General_CP1_CS_AS  = trans.DriveCode COLLATE SQL_Latin1_General_CP1_CS_AS  
				AND pt.Entity2 = et.Entity2
	--LEFT JOIN [auburn].[rpt_DonationEntity] b (NOLOCK) 
	--	ON et.Entity2 = b.Entity2 AND trans.DriveCode COLLATE SQL_Latin1_General_CP1_CS_AS = b.DriveCode COLLATE SQL_Latin1_General_CP1_CS_AS
	LEFT JOIN [ro].[vFD_Donation_Match]  matchee  (NOLOCK)
		ON matchee.DriveCode = trans.DriveCode AND matchee.DonorID = trans.DonorID and matchee.Sequence = trans.Sequence
			
)
GO
