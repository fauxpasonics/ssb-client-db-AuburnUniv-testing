CREATE TABLE [dbo].[PaciolanReporting_MostRecentConfig_Usages]
(
[FundUsage] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SeatQuantity] [int] NULL,
[Entity1] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Entity2] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
