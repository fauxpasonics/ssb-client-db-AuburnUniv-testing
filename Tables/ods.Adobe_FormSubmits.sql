CREATE TABLE [ods].[Adobe_FormSubmits]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Adobe_For__ETL_C__65526C24] DEFAULT (getdate()),
[ETL_UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__Adobe_For__ETL_U__6646905D] DEFAULT (getdate()),
[ETL_IsDeleted] [bit] NOT NULL CONSTRAINT [DF__Adobe_For__ETL_I__673AB496] DEFAULT ((0)),
[ETL_DeletedDate] [datetime] NULL,
[ETL_DeltaHashKey] [binary] (32) NULL,
[ETL_FileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrimaryKey] [bigint] NOT NULL,
[AccountPrimaryKey] [bigint] NULL,
[PacId] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubmitDate] [datetime] NULL,
[WebAppLabel] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WebAppName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[URL] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendSubmitstoSFDC] [bit] NULL
)
GO
ALTER TABLE [ods].[Adobe_FormSubmits] ADD CONSTRAINT [PK__Adobe_Fo__A2D9E56455904B32] PRIMARY KEY CLUSTERED  ([PrimaryKey])
GO
