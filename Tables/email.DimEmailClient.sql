CREATE TABLE [email].[DimEmailClient]
(
[DimEmailClientId] [int] NOT NULL IDENTITY(-2, 1),
[EmailClient] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimEmailC__Creat__48058D20] DEFAULT (user_name()),
[CreatedDate] [datetime] NULL CONSTRAINT [DF__DimEmailC__Creat__48F9B159] DEFAULT (getdate()),
[UpdatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimEmailC__Updat__49EDD592] DEFAULT (user_name()),
[UpdatedDate] [datetime] NULL CONSTRAINT [DF__DimEmailC__Updat__4AE1F9CB] DEFAULT (getdate())
)
GO
ALTER TABLE [email].[DimEmailClient] ADD CONSTRAINT [PK__DimEmail__92D90F9114355B90] PRIMARY KEY CLUSTERED  ([DimEmailClientId])
GO
