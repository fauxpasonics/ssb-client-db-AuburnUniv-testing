CREATE TABLE [email].[DimChannel]
(
[DimChannelId] [int] NOT NULL IDENTITY(-2, 1),
[Channel] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimChanne__Creat__3C93DA74] DEFAULT (user_name()),
[CreatedDate] [datetime] NULL CONSTRAINT [DF__DimChanne__Creat__3D87FEAD] DEFAULT (getdate()),
[UpdatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimChanne__Updat__3E7C22E6] DEFAULT (user_name()),
[UpdatedDate] [datetime] NULL CONSTRAINT [DF__DimChanne__Updat__3F70471F] DEFAULT (getdate())
)
GO
ALTER TABLE [email].[DimChannel] ADD CONSTRAINT [PK__DimChann__37F5D04D76B2C303] PRIMARY KEY CLUSTERED  ([DimChannelId])
GO
