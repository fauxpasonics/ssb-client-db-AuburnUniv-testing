CREATE TABLE [config].[ElementProcessMapping]
(
[ElementProcessId] [int] NOT NULL IDENTITY(1, 1),
[ElementId] [int] NULL,
[ProcessId] [int] NULL,
[DateCreated] [date] NULL CONSTRAINT [DF__ElementPr__DateC__5BD77BA3] DEFAULT (getdate()),
[DateUpdated] [date] NULL CONSTRAINT [DF__ElementPr__DateU__5CCB9FDC] DEFAULT (getdate()),
[CreatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ElementPr__Creat__5DBFC415] DEFAULT (suser_sname()),
[UpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ElementPr__Updat__5EB3E84E] DEFAULT (suser_sname())
)
GO
