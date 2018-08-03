CREATE TABLE [stg].[Adobe_Subscriptions]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Adobe_Sub__ETL_C__6B0B457A] DEFAULT (getdate()),
[ETL_FileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountPrimaryKey] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreationDate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ServiceID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ServiceInternalName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ServiceLabel] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
