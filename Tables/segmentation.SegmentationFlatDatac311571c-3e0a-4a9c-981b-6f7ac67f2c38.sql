CREATE TABLE [segmentation].[SegmentationFlatDatac311571c-3e0a-4a9c-981b-6f7ac67f2c38]
(
[id] [uniqueidentifier] NOT NULL,
[DocumentType] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerSourceSystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
ALTER TABLE [segmentation].[SegmentationFlatDatac311571c-3e0a-4a9c-981b-6f7ac67f2c38] ADD CONSTRAINT [pk_SegmentationFlatDatac311571c-3e0a-4a9c-981b-6f7ac67f2c38] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatDatac311571c-3e0a-4a9c-981b-6f7ac67f2c38] ON [segmentation].[SegmentationFlatDatac311571c-3e0a-4a9c-981b-6f7ac67f2c38] ([_rn])
GO
