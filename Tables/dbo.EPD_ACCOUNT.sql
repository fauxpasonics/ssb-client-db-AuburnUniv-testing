CREATE TABLE [dbo].[EPD_ACCOUNT]
(
[ETLSID] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[CUSTOMER] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PIN] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMAIL_PREF] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST_USER] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[LAST_DATETIME] [datetime] NULL,
[ZID] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SOURCE_ID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EXPORT_DATETIME] [datetime] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
ALTER TABLE [dbo].[EPD_ACCOUNT] ADD CONSTRAINT [PK_EPD_ACCOUNT] PRIMARY KEY CLUSTERED  ([ETLSID], [CUSTOMER])
GO
