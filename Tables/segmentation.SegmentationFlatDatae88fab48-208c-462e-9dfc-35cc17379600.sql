CREATE TABLE [segmentation].[SegmentationFlatDatae88fab48-208c-462e-9dfc-35cc17379600]
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
ALTER TABLE [segmentation].[SegmentationFlatDatae88fab48-208c-462e-9dfc-35cc17379600] ADD CONSTRAINT [pk_SegmentationFlatDatae88fab48-208c-462e-9dfc-35cc17379600] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatDatae88fab48-208c-462e-9dfc-35cc17379600] ON [segmentation].[SegmentationFlatDatae88fab48-208c-462e-9dfc-35cc17379600] ([_rn])
GO
