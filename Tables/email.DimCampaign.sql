CREATE TABLE [email].[DimCampaign]
(
[DimCampaignId] [int] NOT NULL IDENTITY(-2, 1),
[DimCampaignTypeId] [int] NULL,
[DimChannelId] [int] NULL,
[SourceSystemID] [int] NULL,
[Src_CampaignID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Subject] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FromEmail] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FromName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StartDate] [datetime] NULL,
[EndDate] [datetime] NULL,
[GoalDescription] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimCampai__Creat__59301922] DEFAULT (user_name()),
[CreatedDate] [datetime] NULL CONSTRAINT [DF__DimCampai__Creat__5A243D5B] DEFAULT (getdate()),
[UpdatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimCampai__Updat__5B186194] DEFAULT (user_name()),
[UpdatedDate] [datetime] NULL CONSTRAINT [DF__DimCampai__Updat__5C0C85CD] DEFAULT (getdate())
)
GO
ALTER TABLE [email].[DimCampaign] ADD CONSTRAINT [PK__DimCampa__2C52FBAD524B2946] PRIMARY KEY CLUSTERED  ([DimCampaignId])
GO
ALTER TABLE [email].[DimCampaign] ADD CONSTRAINT [FK__DimCampai__DimCa__5DF4CE3F] FOREIGN KEY ([DimCampaignTypeId]) REFERENCES [email].[DimCampaignType] ([DimCampaignTypeId])
GO
ALTER TABLE [email].[DimCampaign] ADD CONSTRAINT [FK__DimCampai__DimCh__5EE8F278] FOREIGN KEY ([DimChannelId]) REFERENCES [email].[DimChannel] ([DimChannelId])
GO
ALTER TABLE [email].[DimCampaign] ADD CONSTRAINT [FK__DimCampai__Sourc__5FDD16B1] FOREIGN KEY ([SourceSystemID]) REFERENCES [mdm].[SourceSystems] ([SourceSystemID])
GO
