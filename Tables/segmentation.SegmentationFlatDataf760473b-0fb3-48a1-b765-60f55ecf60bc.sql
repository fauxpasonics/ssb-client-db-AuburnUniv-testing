CREATE TABLE [segmentation].[SegmentationFlatDataf760473b-0fb3-48a1-b765-60f55ecf60bc]
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
ALTER TABLE [segmentation].[SegmentationFlatDataf760473b-0fb3-48a1-b765-60f55ecf60bc] ADD CONSTRAINT [pk_SegmentationFlatDataf760473b-0fb3-48a1-b765-60f55ecf60bc] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatDataf760473b-0fb3-48a1-b765-60f55ecf60bc] ON [segmentation].[SegmentationFlatDataf760473b-0fb3-48a1-b765-60f55ecf60bc] ([_rn])
GO
