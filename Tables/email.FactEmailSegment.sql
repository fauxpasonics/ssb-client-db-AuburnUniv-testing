CREATE TABLE [email].[FactEmailSegment]
(
[FactEmailSegmentId] [int] NOT NULL IDENTITY(-2, 1),
[DimEmailId] [int] NULL,
[DimSegmentId] [int] NULL,
[IsOptOut] [bit] NULL,
[EffectiveBeginDate] [datetime] NULL,
[EffectiveEndDate] [datetime] NULL,
[CreatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__FactEmail__Creat__2FF8F965] DEFAULT (user_name()),
[CreatedDate] [datetime] NULL CONSTRAINT [DF__FactEmail__Creat__30ED1D9E] DEFAULT (getdate()),
[UpdatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__FactEmail__Updat__31E141D7] DEFAULT (user_name()),
[UpdatedDate] [datetime] NULL CONSTRAINT [DF__FactEmail__Updat__32D56610] DEFAULT (getdate())
)
GO
ALTER TABLE [email].[FactEmailSegment] ADD CONSTRAINT [PK__FactEmai__024BBBD5651CB9D0] PRIMARY KEY CLUSTERED  ([FactEmailSegmentId])
GO
CREATE NONCLUSTERED INDEX [idx_FactEmailSegment_DimEmailId] ON [email].[FactEmailSegment] ([DimEmailId])
GO
CREATE NONCLUSTERED INDEX [idx_FactEmailSegment_DimSegmentId] ON [email].[FactEmailSegment] ([DimSegmentId])
GO
ALTER TABLE [email].[FactEmailSegment] ADD CONSTRAINT [FK__FactEmail__DimEm__430BCDD9] FOREIGN KEY ([DimEmailId]) REFERENCES [email].[DimEmail] ([DimEmailID])
GO
ALTER TABLE [email].[FactEmailSegment] ADD CONSTRAINT [FK__FactEmail__DimSe__43FFF212] FOREIGN KEY ([DimSegmentId]) REFERENCES [email].[DimSegment] ([DimSegmentId])
GO
