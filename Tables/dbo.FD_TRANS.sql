CREATE TABLE [dbo].[FD_TRANS]
(
[ETLSID] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[TRANS_NO] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BATCH] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REF] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATE] [datetime] NULL,
[DOCUMENT] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DRIVE] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[DONOR] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SEQ] [bigint] NULL,
[PLG_AMT] [numeric] (18, 2) NULL,
[OUT_AMT] [numeric] (18, 2) NULL,
[DON_AMT] [numeric] (18, 2) NULL,
[WO_AMT] [numeric] (18, 2) NULL,
[BEN_AMT] [numeric] (18, 2) NULL,
[AITEM_AMT] [numeric] (18, 2) NULL,
[APAID_AMT] [numeric] (18, 2) NULL,
[PAYMODE] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[BALANCE] [numeric] (18, 2) NULL,
[CASH_AMT] [numeric] (18, 2) NULL,
[GIK_AMT] [numeric] (18, 2) NULL,
[CLASS] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[SOURCE] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCRIPTION] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MOTIVE] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[ENTRY_TIME] [datetime] NULL,
[ENTRY_USER] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[ENTRY_DATETIME] [datetime] NULL,
[ZID] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SOURCE_ID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EXPORT_DATETIME] [datetime] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
ALTER TABLE [dbo].[FD_TRANS] ADD CONSTRAINT [PK_FD_TRANS] PRIMARY KEY CLUSTERED  ([ETLSID], [TRANS_NO])
GO
CREATE NONCLUSTERED INDEX [IDX_CLASS] ON [dbo].[FD_TRANS] ([CLASS])
GO
CREATE NONCLUSTERED INDEX [IDX_DATE] ON [dbo].[FD_TRANS] ([DATE])
GO
CREATE NONCLUSTERED INDEX [IDX_DONOR] ON [dbo].[FD_TRANS] ([DONOR])
GO
CREATE NONCLUSTERED INDEX [IDX_DRIVE] ON [dbo].[FD_TRANS] ([DRIVE])
GO
CREATE NONCLUSTERED INDEX [IDX_SEQ] ON [dbo].[FD_TRANS] ([SEQ])
GO
CREATE NONCLUSTERED INDEX [IDX_TRANS_NO] ON [dbo].[FD_TRANS] ([TRANS_NO])
GO
