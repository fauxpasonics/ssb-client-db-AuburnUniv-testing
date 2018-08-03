CREATE TABLE [email].[DimOperatingSystem]
(
[DimOperatingSystemId] [int] NOT NULL IDENTITY(-2, 1),
[OperatingSystem] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimOperat__Creat__4DBE6676] DEFAULT (user_name()),
[CreatedDate] [datetime] NULL CONSTRAINT [DF__DimOperat__Creat__4EB28AAF] DEFAULT (getdate()),
[UpdatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimOperat__Updat__4FA6AEE8] DEFAULT (user_name()),
[UpdatedDate] [datetime] NULL CONSTRAINT [DF__DimOperat__Updat__509AD321] DEFAULT (getdate())
)
GO
ALTER TABLE [email].[DimOperatingSystem] ADD CONSTRAINT [PK__DimOpera__04A7A4C6DDBDFB31] PRIMARY KEY CLUSTERED  ([DimOperatingSystemId])
GO
