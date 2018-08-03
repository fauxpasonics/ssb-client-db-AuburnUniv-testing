CREATE TABLE [segmentation].[SegmentationFlatData78643cec-2f74-4b5b-903f-e341be5b3246]
(
[id] [uniqueidentifier] NOT NULL,
[DocumentType] [varchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[F17_IMARK] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[F17_PercentAttended] [decimal] (18, 1) NULL
)
GO
ALTER TABLE [segmentation].[SegmentationFlatData78643cec-2f74-4b5b-903f-e341be5b3246] ADD CONSTRAINT [pk_SegmentationFlatData78643cec-2f74-4b5b-903f-e341be5b3246] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData78643cec-2f74-4b5b-903f-e341be5b3246] ON [segmentation].[SegmentationFlatData78643cec-2f74-4b5b-903f-e341be5b3246] ([_rn])
GO
