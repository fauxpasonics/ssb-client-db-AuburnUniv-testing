CREATE TABLE [segmentation].[SegmentationFlatData0068432d-4647-4abc-9356-2c0726f55e7e]
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
ALTER TABLE [segmentation].[SegmentationFlatData0068432d-4647-4abc-9356-2c0726f55e7e] ADD CONSTRAINT [pk_SegmentationFlatData0068432d-4647-4abc-9356-2c0726f55e7e] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData0068432d-4647-4abc-9356-2c0726f55e7e] ON [segmentation].[SegmentationFlatData0068432d-4647-4abc-9356-2c0726f55e7e] ([_rn])
GO
