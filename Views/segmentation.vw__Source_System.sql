SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE VIEW  [segmentation].[vw__Source_System] AS (

SELECT  dc.SSB_CRMSYSTEM_CONTACT_ID
		, dc.SourceSystem CustomerSourceSystem
		--, dimcustomer.SSID AS CustomerSourceSystemID
		--, dimcustomer.customer_matchkey AS Customer_MatchKey
		--, ssbid.SSB_CRMSYSTEM_PRIMARY_FLAG

FROM     [dbo].[vwDimCustomer_ModAcctId] dc

WHERE dc.SourceSystem NOT IN ('Paciolan', 'Adobe') --excluding SourceSystems that they would not use for SourceSystem use cases to reduce count AMEITIN




) 































GO
