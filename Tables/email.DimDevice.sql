CREATE TABLE [email].[DimDevice]
(
[DimDeviceId] [int] NOT NULL IDENTITY(-2, 1),
[Device] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimDevice__Creat__424CB3CA] DEFAULT (user_name()),
[CreatedDate] [datetime] NULL CONSTRAINT [DF__DimDevice__Creat__4340D803] DEFAULT (getdate()),
[UpdatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimDevice__Updat__4434FC3C] DEFAULT (user_name()),
[UpdatedDate] [datetime] NULL CONSTRAINT [DF__DimDevice__Updat__45292075] DEFAULT (getdate())
)
GO
ALTER TABLE [email].[DimDevice] ADD CONSTRAINT [PK__DimDevic__EE18DE216F651A15] PRIMARY KEY CLUSTERED  ([DimDeviceId])
GO
