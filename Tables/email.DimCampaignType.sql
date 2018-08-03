CREATE TABLE [email].[DimCampaignType]
(
[DimCampaignTypeId] [int] NOT NULL IDENTITY(-2, 1),
[CampaignType] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimCampai__Creat__36DB011E] DEFAULT (user_name()),
[CreatedDate] [datetime] NULL CONSTRAINT [DF__DimCampai__Creat__37CF2557] DEFAULT (getdate()),
[UpdatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimCampai__Updat__38C34990] DEFAULT (user_name()),
[UpdatedDate] [datetime] NULL CONSTRAINT [DF__DimCampai__Updat__39B76DC9] DEFAULT (getdate())
)
GO
ALTER TABLE [email].[DimCampaignType] ADD CONSTRAINT [PK__DimCampa__7EB1CFE5818C2243] PRIMARY KEY CLUSTERED  ([DimCampaignTypeId])
GO
