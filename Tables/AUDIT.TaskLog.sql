CREATE TABLE [AUDIT].[TaskLog]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[BatchID] [int] NOT NULL,
[Created] [datetime] NULL CONSTRAINT [DF__TaskLog__Created__263A8501] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[User] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TaskName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Target] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SQL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExecuteStart] [datetime] NULL,
[ExecuteEnd] [datetime] NULL,
[ExecutionRuntimeSeconds] AS (CONVERT([float],datediff(second,[ExecuteStart],[ExecuteEnd]),(0))),
[RowCountBefore] [int] NULL CONSTRAINT [DF__TaskLog__RowCoun__272EA93A] DEFAULT ((0)),
[RowCountAfter] [int] NULL CONSTRAINT [DF__TaskLog__RowCoun__2822CD73] DEFAULT ((0)),
[Inserted] [int] NULL CONSTRAINT [DF__TaskLog__Inserte__2916F1AC] DEFAULT ((0)),
[Updated] [int] NULL CONSTRAINT [DF__TaskLog__Updated__2A0B15E5] DEFAULT ((0)),
[Deleted] [int] NULL CONSTRAINT [DF__TaskLog__Deleted__2AFF3A1E] DEFAULT ((0)),
[Truncated] [int] NULL CONSTRAINT [DF__TaskLog__Truncat__2BF35E57] DEFAULT ((0)),
[IsCommitted] [bit] NULL CONSTRAINT [DF__TaskLog__IsCommi__2CE78290] DEFAULT ((0)),
[IsError] [bit] NULL CONSTRAINT [DF__TaskLog__IsError__2DDBA6C9] DEFAULT ((0)),
[ErrorMessage] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErrorSeverity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErrorState] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [AUDIT].[TaskLog] ADD CONSTRAINT [PK__TaskLog__3214EC273D8B96FB] PRIMARY KEY CLUSTERED  ([ID])
GO
