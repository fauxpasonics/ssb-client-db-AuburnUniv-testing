CREATE TABLE [dbo].[FD_DONATION_PAYMENT]
(
[ETLSID] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[DRIVE] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[DONOR] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SEQ] [bigint] NOT NULL,
[VMC] [bigint] NOT NULL,
[PMNT_DATE] [datetime] NULL,
[PMNT_AMT] [numeric] (18, 2) NULL,
[PMNT_BATCH] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[PMNT_MODE] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[ZID] [varchar] (58) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[SOURCE_ID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EXPORT_DATETIME] [datetime] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
ALTER TABLE [dbo].[FD_DONATION_PAYMENT] ADD CONSTRAINT [PK_FD_DONATION_PAYMENT] PRIMARY KEY CLUSTERED  ([ETLSID], [DRIVE], [DONOR], [SEQ], [VMC])
GO
