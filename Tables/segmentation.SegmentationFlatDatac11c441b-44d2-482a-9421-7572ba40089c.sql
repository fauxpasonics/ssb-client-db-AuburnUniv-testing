CREATE TABLE [segmentation].[SegmentationFlatDatac11c441b-44d2-482a-9421-7572ba40089c]
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
ALTER TABLE [segmentation].[SegmentationFlatDatac11c441b-44d2-482a-9421-7572ba40089c] ADD CONSTRAINT [pk_SegmentationFlatDatac11c441b-44d2-482a-9421-7572ba40089c] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatDatac11c441b-44d2-482a-9421-7572ba40089c] ON [segmentation].[SegmentationFlatDatac11c441b-44d2-482a-9421-7572ba40089c] ([_rn])
GO
