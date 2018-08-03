CREATE TABLE [segmentation].[SegmentationFlatDatae3f2b021-82c8-4090-9b65-34ff1046f1c2]
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
ALTER TABLE [segmentation].[SegmentationFlatDatae3f2b021-82c8-4090-9b65-34ff1046f1c2] ADD CONSTRAINT [pk_SegmentationFlatDatae3f2b021-82c8-4090-9b65-34ff1046f1c2] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatDatae3f2b021-82c8-4090-9b65-34ff1046f1c2] ON [segmentation].[SegmentationFlatDatae3f2b021-82c8-4090-9b65-34ff1046f1c2] ([_rn])
GO
