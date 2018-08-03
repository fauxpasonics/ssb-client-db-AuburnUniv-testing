CREATE TABLE [email].[FactEmailSource]
(
[FactEmailSourceId] [int] NOT NULL IDENTITY(-2, 1),
[DimEmailId] [int] NULL,
[SourceSystemId] [int] NULL,
[EffectiveBeginDate] [datetime] NULL,
[EffectiveEndDate] [datetime] NULL,
[CreatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__FactEmail__Creat__33C98A49] DEFAULT (user_name()),
[CreatedDate] [datetime] NULL CONSTRAINT [DF__FactEmail__Creat__34BDAE82] DEFAULT (getdate()),
[UpdatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__FactEmail__Updat__35B1D2BB] DEFAULT (user_name()),
[UpdatedDate] [datetime] NULL CONSTRAINT [DF__FactEmail__Updat__36A5F6F4] DEFAULT (getdate())
)
GO
ALTER TABLE [email].[FactEmailSource] ADD CONSTRAINT [PK__FactEmai__11CE794485CBD3CA] PRIMARY KEY CLUSTERED  ([FactEmailSourceId])
GO
CREATE NONCLUSTERED INDEX [idx_FactEmailSource_DimEmailId] ON [email].[FactEmailSource] ([DimEmailId])
GO
ALTER TABLE [email].[FactEmailSource] ADD CONSTRAINT [FK__FactEmail__DimEm__44F4164B] FOREIGN KEY ([DimEmailId]) REFERENCES [email].[DimEmail] ([DimEmailID])
GO
ALTER TABLE [email].[FactEmailSource] ADD CONSTRAINT [FK__FactEmail__Sourc__45E83A84] FOREIGN KEY ([SourceSystemId]) REFERENCES [mdm].[SourceSystems] ([SourceSystemID])
GO
