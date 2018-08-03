CREATE TABLE [segmentation].[SegmentationFlatData4868d1b5-7500-4553-8793-a86bb13dea68]
(
[id] [uniqueidentifier] NOT NULL,
[DocumentType] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TransDate] [date] NULL,
[DriveCode] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[DriveFullName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UsageCode] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[UsageFullName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Entity1] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Entity2] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Entity2Name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MotiveCode] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[PLG_AMT] [numeric] (38, 2) NULL,
[DON_AMT] [numeric] (38, 2) NULL
)
GO
ALTER TABLE [segmentation].[SegmentationFlatData4868d1b5-7500-4553-8793-a86bb13dea68] ADD CONSTRAINT [pk_SegmentationFlatData4868d1b5-7500-4553-8793-a86bb13dea68] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData4868d1b5-7500-4553-8793-a86bb13dea68] ON [segmentation].[SegmentationFlatData4868d1b5-7500-4553-8793-a86bb13dea68] ([_rn])
GO
