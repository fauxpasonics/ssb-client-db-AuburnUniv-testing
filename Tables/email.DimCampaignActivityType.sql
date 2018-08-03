CREATE TABLE [email].[DimCampaignActivityType]
(
[DimCampaignActivityTypeId] [int] NOT NULL IDENTITY(-2, 1),
[ActivityType] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimCampai__Creat__312227C8] DEFAULT (user_name()),
[CreatedDate] [datetime] NULL CONSTRAINT [DF__DimCampai__Creat__32164C01] DEFAULT (getdate()),
[UpdatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimCampai__Updat__330A703A] DEFAULT (user_name()),
[UpdatedDate] [datetime] NULL CONSTRAINT [DF__DimCampai__Updat__33FE9473] DEFAULT (getdate())
)
GO
ALTER TABLE [email].[DimCampaignActivityType] ADD CONSTRAINT [PK__DimCampa__9DB9554E408996BC] PRIMARY KEY CLUSTERED  ([DimCampaignActivityTypeId])
GO
