CREATE TABLE [segmentation].[SegmentationFlatData80d3d47d-c0ca-4e03-8dab-f77df5fb5d51]
(
[id] [uniqueidentifier] NOT NULL,
[DocumentType] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
[DONOR] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TRANS_NO] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DATE] [datetime] NULL,
[DRIVE] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[DRIVE_NAME] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAMPAIGN] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[CAMPAIGN_NAME] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FUND_USAGE] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[FUND_USAGE_NAME] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FUND_USAGE_ENTITY] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[FUND_USAGE_RESTRICTED] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FUND_USAGE_INACTIVTY] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PLG_AMT] [numeric] (38, 2) NULL,
[CASH_AMT] [numeric] (38, 2) NULL,
[BALANCE] [numeric] (38, 2) NULL
)
GO
ALTER TABLE [segmentation].[SegmentationFlatData80d3d47d-c0ca-4e03-8dab-f77df5fb5d51] ADD CONSTRAINT [pk_SegmentationFlatData80d3d47d-c0ca-4e03-8dab-f77df5fb5d51] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData80d3d47d-c0ca-4e03-8dab-f77df5fb5d51] ON [segmentation].[SegmentationFlatData80d3d47d-c0ca-4e03-8dab-f77df5fb5d51] ([_rn])
GO
