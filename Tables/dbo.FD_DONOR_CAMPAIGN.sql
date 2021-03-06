CREATE TABLE [dbo].[FD_DONOR_CAMPAIGN]
(
[ETLSID] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[DONOR] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VMC] [bigint] NOT NULL,
[CAMPAIGN] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[CLASS] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[ZID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SOURCE_ID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EXPORT_DATETIME] [datetime] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
ALTER TABLE [dbo].[FD_DONOR_CAMPAIGN] ADD CONSTRAINT [PK_FD_DONOR_CAMPAIGN] PRIMARY KEY CLUSTERED  ([ETLSID], [DONOR], [VMC])
GO
