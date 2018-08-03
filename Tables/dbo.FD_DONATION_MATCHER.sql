CREATE TABLE [dbo].[FD_DONATION_MATCHER]
(
[ETLSID] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[DRIVE] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[DONOR] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SEQ] [bigint] NOT NULL,
[VMC] [bigint] NOT NULL,
[MATCHER] [varchar] (58) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[MATCHER_RATIO] [numeric] (18, 2) NULL,
[MATCHER_PLG_AMT] [numeric] (18, 2) NULL,
[MATCHER_DON_AMT] [numeric] (18, 2) NULL,
[ZID] [varchar] (58) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[SOURCE_ID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EXPORT_DATETIME] [datetime] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
ALTER TABLE [dbo].[FD_DONATION_MATCHER] ADD CONSTRAINT [PK_FD_DONATION_MATCHER] PRIMARY KEY CLUSTERED  ([ETLSID], [DRIVE], [DONOR], [SEQ], [VMC])
GO