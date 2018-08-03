CREATE TABLE [dbo].[TK_TRANS_CHG_PAYMODE]
(
[ETLSID] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[SEASON] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[TRANS_NO] [bigint] NOT NULL,
[VMC] [bigint] NOT NULL,
[SVMC] [bigint] NOT NULL,
[CHG_PAY_MODE] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[CHG_PAY_AMT] [numeric] (18, 2) NULL,
[ZID] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[SOURCE_ID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EXPORT_DATETIME] [datetime] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
ALTER TABLE [dbo].[TK_TRANS_CHG_PAYMODE] ADD CONSTRAINT [PK_TK_TRANS_CHG_PAYMODE] PRIMARY KEY CLUSTERED  ([ETLSID], [SEASON], [TRANS_NO], [VMC], [SVMC])
GO
CREATE NONCLUSTERED INDEX [IDX_SEASON] ON [dbo].[TK_TRANS_CHG_PAYMODE] ([SEASON])
GO
CREATE NONCLUSTERED INDEX [IDX_TRANS_NO] ON [dbo].[TK_TRANS_CHG_PAYMODE] ([TRANS_NO])
GO
CREATE NONCLUSTERED INDEX [IDX_VMC] ON [dbo].[TK_TRANS_CHG_PAYMODE] ([VMC])
GO
CREATE NONCLUSTERED INDEX [IDX_ZID] ON [dbo].[TK_TRANS_CHG_PAYMODE] ([ZID])
GO