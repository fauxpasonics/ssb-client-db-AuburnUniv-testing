CREATE TABLE [dbo].[TUFPriority_PriorityTotals]
(
[Donor] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FootballPriority] [decimal] (20, 2) NULL,
[BasketballPriority] [decimal] (20, 2) NULL,
[BaseballPriority] [decimal] (20, 2) NULL,
[LastModified] [datetime] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
