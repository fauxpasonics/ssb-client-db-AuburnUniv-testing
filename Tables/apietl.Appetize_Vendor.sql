CREATE TABLE [apietl].[Appetize_Vendor]
(
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__Appetize___ETL____6DF62BDE] DEFAULT (getutcdate()),
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsLoaded] [bit] NOT NULL CONSTRAINT [DF__Appetize___IsLoa__624F6F08] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1)
)
GO
