SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [ro].[vw_Adobe_TrackingLog]
AS
    ( SELECT   dc.SSB_CRMSYSTEM_CONTACT_ID, r.*
      FROM      ods.Adobe_TrackingLog (NOLOCK) r
	  INNER JOIN [dbo].[vwDimCustomer_ModAcctId] dc
		ON dc.SourceSystem = 'Adobe' AND r.AccountFK = dc.SSID 
    )
GO
