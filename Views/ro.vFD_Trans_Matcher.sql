SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [ro].[vFD_Trans_Matcher] as
select 
ETLSID, TRANS_NO, VMC, MATCHER, MATCHER_PLG_AMT, MATCHER_DON_AMT, ZID, SOURCE_ID, EXPORT_DATETIME, ETL_Sync_DeltaHashKey
 from dbo.FD_Trans_Matcher (nolock)			as FT





GO
