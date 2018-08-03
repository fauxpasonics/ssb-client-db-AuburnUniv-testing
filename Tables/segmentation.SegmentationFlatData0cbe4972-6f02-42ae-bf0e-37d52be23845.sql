CREATE TABLE [segmentation].[SegmentationFlatData0cbe4972-6f02-42ae-bf0e-37d52be23845]
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
ALTER TABLE [segmentation].[SegmentationFlatData0cbe4972-6f02-42ae-bf0e-37d52be23845] ADD CONSTRAINT [pk_SegmentationFlatData0cbe4972-6f02-42ae-bf0e-37d52be23845] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData0cbe4972-6f02-42ae-bf0e-37d52be23845] ON [segmentation].[SegmentationFlatData0cbe4972-6f02-42ae-bf0e-37d52be23845] ([_rn])
GO
