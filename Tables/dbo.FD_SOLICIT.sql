CREATE TABLE [dbo].[FD_SOLICIT]
(
[ETLSID] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[DRIVE] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[DONOR] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TARGET] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[GOAL] [numeric] (18, 2) NULL,
[DATE] [datetime] NULL,
[USAGE] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[PRIMARY_SOLICITOR] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMMENTS] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RATING] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[LAST_USER] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[LAST_DATETIME] [datetime] NULL,
[ZID] [varchar] (53) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[SOURCE_ID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EXPORT_DATETIME] [datetime] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
ALTER TABLE [dbo].[FD_SOLICIT] ADD CONSTRAINT [PK_FD_SOLICIT] PRIMARY KEY CLUSTERED  ([ETLSID], [DRIVE], [DONOR])
GO
