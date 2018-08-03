CREATE TABLE [etl].[Task]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[BatchID] [int] NOT NULL CONSTRAINT [DF__Task__BatchID__4D545222] DEFAULT ((0)),
[ExecutionOrder] [int] NOT NULL CONSTRAINT [DF__Task__ExecutionO__4E48765B] DEFAULT ((1)),
[TaskName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__TaskName__4F3C9A94] DEFAULT ('Not Specified'),
[TaskType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__TaskType__5030BECD] DEFAULT ('Not Specified'),
[SQL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__SQL__5124E306] DEFAULT (NULL),
[Target] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__Target__5219073F] DEFAULT (NULL),
[Source] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__Source__530D2B78] DEFAULT (NULL),
[CustomMatchOn] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__CustomMatc__54014FB1] DEFAULT (NULL),
[ExcludeColumns] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__ExcludeCol__54F573EA] DEFAULT (NULL),
[Execute] [bit] NULL CONSTRAINT [DF__Task__Execute__55E99823] DEFAULT ((0)),
[FailBatchOnFailure] [bit] NULL CONSTRAINT [DF__Task__FailBatchO__56DDBC5C] DEFAULT ((1)),
[SuppressResults] [bit] NULL CONSTRAINT [DF__Task__SuppressRe__57D1E095] DEFAULT ((0)),
[RunSQL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [bit] NULL CONSTRAINT [DF__Task__Active__58C604CE] DEFAULT ((1)),
[CREATED_DATE] [datetime] NOT NULL CONSTRAINT [DF__Task__CREATED_DA__59BA2907] DEFAULT ([etl].[ConvertToLocalTime](getdate())),
[LUPDATED_DATE] [datetime] NOT NULL CONSTRAINT [DF__Task__LUPDATED_D__5AAE4D40] DEFAULT ([etl].[ConvertToLocalTime](getdate()))
)
GO
ALTER TABLE [etl].[Task] ADD CONSTRAINT [PK__Task__3214EC27355B67CD] PRIMARY KEY CLUSTERED  ([ID])
GO
