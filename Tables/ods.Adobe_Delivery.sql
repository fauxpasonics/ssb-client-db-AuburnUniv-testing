CREATE TABLE [ods].[Adobe_Delivery]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Adobe_Del__ETL_C__39C2CAE2] DEFAULT (getdate()),
[ETL_UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__Adobe_Del__ETL_U__3AB6EF1B] DEFAULT (getdate()),
[ETL_IsDeleted] [bit] NOT NULL CONSTRAINT [DF__Adobe_Del__ETL_I__3BAB1354] DEFAULT ((0)),
[ETL_DeletedDate] [datetime] NULL,
[ETL_DeltaHashKey] [binary] (32) NULL,
[ETL_FileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrimaryKey] [bigint] NOT NULL,
[ContactDate] [datetime] NULL,
[InternalName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Label] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MessagestoSend] [int] NULL,
[Processed] [int] NULL,
[Success] [int] NULL,
[Errors] [int] NULL,
[RecipientsWhoHaveOpened] [int] NULL,
[TotalCountofOpens] [int] NULL,
[PersonsWhoHaveClicked] [int] NULL,
[TotalNumberofClicks] [int] NULL,
[NumberofDistinctClicks] [int] NULL,
[FolderId] [bigint] NULL,
[FolderLabel] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [ods].[Adobe_Delivery] ADD CONSTRAINT [PK__Adobe_De__A2D9E564350B4FE5] PRIMARY KEY CLUSTERED  ([PrimaryKey])
GO
