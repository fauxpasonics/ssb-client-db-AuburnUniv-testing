CREATE TABLE [segmentation].[SegmentationFlatData673f4b8d-abef-4b80-a053-ce03496ed83a]
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
ALTER TABLE [segmentation].[SegmentationFlatData673f4b8d-abef-4b80-a053-ce03496ed83a] ADD CONSTRAINT [pk_SegmentationFlatData673f4b8d-abef-4b80-a053-ce03496ed83a] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData673f4b8d-abef-4b80-a053-ce03496ed83a] ON [segmentation].[SegmentationFlatData673f4b8d-abef-4b80-a053-ce03496ed83a] ([_rn])
GO
