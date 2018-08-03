CREATE TABLE [ods].[Adobe_Subscriptions]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Adobe_Sub__ETL_C__6DE7B225] DEFAULT (getdate()),
[ETL_UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__Adobe_Sub__ETL_U__6EDBD65E] DEFAULT (getdate()),
[ETL_IsDeleted] [bit] NOT NULL CONSTRAINT [DF__Adobe_Sub__ETL_I__6FCFFA97] DEFAULT ((0)),
[ETL_DeletedDate] [datetime] NULL,
[ETL_DeltaHashKey] [binary] (32) NULL,
[ETL_FileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountPrimaryKey] [bigint] NOT NULL,
[Email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreationDate] [datetime] NULL,
[ServiceID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ServiceInternalName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ServiceLabel] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [ods].[Adobe_Subscriptions] ADD CONSTRAINT [PK__Adobe_Su__DF2E2C83E96A580F] PRIMARY KEY CLUSTERED  ([AccountPrimaryKey])
GO
