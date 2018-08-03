SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO










CREATE VIEW [ro].[vw__Donation_Detail]

AS
(

SELECT 

trans.DONOR
,dc.SSB_CRMSYSTEM_CONTACT_ID
,trans.TRANS_NO
,trans.DATE
,drive.DRIVE
,drive.NAME DRIVE_NAME
,campaign.CAMPAIGN
,campaign.NAME CAMPAIGN_NAME
,usage.FUND_USAGE
,usage.NAME AS FUND_USAGE_NAME
,usage.ENTITY AS FUND_USAGE_ENTITY
,usage.RESTRICTED AS FUND_USAGE_RESTRICTED
,usage.INACTIVITY AS FUND_USAGE_INACTIVTY
, SUM(ISNULL(transUsage.USG_PLG_AMT,0) + ISNULL(transUsage.USG_OUT_AMT,0)) AS  PLG_AMT
, SUM(ISNULL(transUsage.USG_DON_AMT,0))  AS CASH_AMT
, SUM(ISNULL(transUsage.USG_PLG_AMT,0) + ISNULL(transUsage.USG_OUT_AMT,0))  - SUM(ISNULL(transUsage.USG_DON_AMT,0)) AS  BALANCE

FROM dbo.FD_TRANS trans (NOLOCK)
	JOIN dbo.FD_DRIVE drive (NOLOCK)
        ON trans.DRIVE = drive.DRIVE   
	JOIN dbo.FD_CAMPAIGN campaign (NOLOCK)
        ON drive.CAMPAIGN = campaign.CAMPAIGN
	JOIN dbo.FD_TRANS_USAGE transUsage (NOLOCK)
		ON trans.TRANS_NO = transUsage.TRANS_NO
	JOIN dbo.FD_USAGE usage (NOLOCK)
		ON transUsage.usage = usage.FUND_USAGE
INNER JOIN dbo.dimcustomerssbid dc (NOLOCK)
		ON trans.donor = dc.SSID AND dc.SourceSystem = 'Paciolan'

GROUP BY trans.DONOR
,dc.SSB_CRMSYSTEM_CONTACT_ID
,trans.TRANS_NO
,trans.DATE
,drive.DRIVE
,drive.NAME 
,campaign.CAMPAIGN
,campaign.NAME 
,usage.FUND_USAGE
,usage.NAME
,usage.ENTITY 
,usage.RESTRICTED 
,usage.INACTIVITY 

)









GO
