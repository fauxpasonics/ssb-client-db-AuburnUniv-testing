CREATE TABLE [dbo].[FD_DONATION]
(
[ETLSID] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[DRIVE] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[DONOR] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SEQ] [bigint] NOT NULL,
[DATE] [datetime] NULL,
[TYPE] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[SOURCE] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[PLG_AMT] [numeric] (18, 2) NULL,
[OUT_AMT] [numeric] (18, 2) NULL,
[CASH_AMT] [numeric] (18, 2) NULL,
[GIK_AMT] [numeric] (18, 2) NULL,
[WO_AMT] [numeric] (18, 2) NULL,
[BEN_AMT] [numeric] (18, 2) NULL,
[AITEM_AMT] [numeric] (18, 2) NULL,
[APAID_AMT] [numeric] (18, 2) NULL,
[AITEM_WO] [numeric] (18, 2) NULL,
[BILLING_PERIODS] [int] NULL,
[BILLING_PLAN] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[COMMENTS] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TAG_MARKS] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TRIBUTE] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[PUBLISH_NAME] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MOTIVE] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[MSHIP_TYPE] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[MSHIP_EFF_DATE] [datetime] NULL,
[MSHIP_EXP_DATE] [datetime] NULL,
[LAST_USER] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[LAST_DATETIME] [datetime] NULL,
[ZID] [varchar] (58) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[SOURCE_ID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EXPORT_DATETIME] [datetime] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
ALTER TABLE [dbo].[FD_DONATION] ADD CONSTRAINT [PK_FD_DONATION] PRIMARY KEY CLUSTERED  ([ETLSID], [DRIVE], [DONOR], [SEQ])
GO
