CREATE TABLE [etl].[Configuration]
(
[ConfigurationID] [int] NOT NULL,
[Name] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [bit] NULL,
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Configura__Creat__3670ECCA] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Configura__Creat__37651103] DEFAULT (suser_sname()),
[LastUpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Configura__LastU__3859353C] DEFAULT (getdate()),
[LastUpdatedBy] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Configura__LastU__394D5975] DEFAULT (suser_sname())
)
GO
ALTER TABLE [etl].[Configuration] ADD CONSTRAINT [PK__Configur__95AA539BC0048971] PRIMARY KEY CLUSTERED  ([ConfigurationID])
GO
