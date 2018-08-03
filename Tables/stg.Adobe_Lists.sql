CREATE TABLE [stg].[Adobe_Lists]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Adobe_Lis__ETL_C__4A9AE4F8] DEFAULT (getdate()),
[ETL_FileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountPK] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreationDate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InternalName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Label] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
