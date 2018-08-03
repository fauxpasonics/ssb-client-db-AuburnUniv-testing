CREATE TABLE [dbo].[PaciolanReporting_MostRecentConfig_PriceTables]
(
[Drive] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Entity2] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PricePerSeat] [decimal] (10, 2) NULL,
[RevenuePerSeat] [decimal] (10, 2) NULL,
[AmenitiesPerSeat] [decimal] (10, 2) NULL,
[TaxPerSeat] [decimal] (10, 2) NULL,
[ReceiptText] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
