CREATE TABLE [dbo].[FD_DRIVE]
(
[ETLSID] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[DRIVE] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[NAME] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAMPAIGN] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[STATUS] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[START_DATE] [datetime] NULL,
[END_DATE] [datetime] NULL,
[GOAL] [numeric] (18, 2) NULL,
[SEQ] [bigint] NULL,
[PREV_DRIVE] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[UPDATE_CLASS] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LIFETIME] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST_USER] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[LAST_DATETIME] [datetime] NULL,
[ZID] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[SOURCE_ID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EXPORT_DATETIME] [datetime] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
ALTER TABLE [dbo].[FD_DRIVE] ADD CONSTRAINT [PK_FD_DRIVE] PRIMARY KEY CLUSTERED  ([ETLSID], [DRIVE])
GO
CREATE NONCLUSTERED INDEX [IDX_CAMPAIGN] ON [dbo].[FD_DRIVE] ([CAMPAIGN])
GO
CREATE NONCLUSTERED INDEX [IDX_DRIVE] ON [dbo].[FD_DRIVE] ([DRIVE])
GO
