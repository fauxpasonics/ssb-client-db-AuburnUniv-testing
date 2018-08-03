CREATE TABLE [email].[DimBrowser]
(
[DimBrowserId] [int] NOT NULL IDENTITY(-2, 1),
[Browser] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimBrowse__Creat__2B694E72] DEFAULT (user_name()),
[CreatedDate] [datetime] NULL CONSTRAINT [DF__DimBrowse__Creat__2C5D72AB] DEFAULT (getdate()),
[UpdatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimBrowse__Updat__2D5196E4] DEFAULT (user_name()),
[UpdatedDate] [datetime] NULL CONSTRAINT [DF__DimBrowse__Updat__2E45BB1D] DEFAULT (getdate())
)
GO
ALTER TABLE [email].[DimBrowser] ADD CONSTRAINT [PK__DimBrows__74819988EE8FA0F9] PRIMARY KEY CLUSTERED  ([DimBrowserId])
GO
