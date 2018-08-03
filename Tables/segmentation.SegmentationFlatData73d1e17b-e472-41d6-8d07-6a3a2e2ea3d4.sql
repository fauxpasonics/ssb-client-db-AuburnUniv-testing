CREATE TABLE [segmentation].[SegmentationFlatData73d1e17b-e472-41d6-8d07-6a3a2e2ea3d4]
(
[id] [uniqueidentifier] NOT NULL,
[DocumentType] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
[SeasonCode] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SeasonFullName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CUSTOMER] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemCode] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemFullName] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceTypeCode] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceTypeFullName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceLevelCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceLevelFullName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Price] [numeric] (18, 2) NULL,
[OrdQty] [bigint] NULL,
[OrdTotal] [numeric] (18, 2) NULL,
[PaidTotal] [numeric] (18, 2) NULL,
[MINPAYMENTDATE] [datetime] NULL,
[TicketTypeClass] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TicketTypeName] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [segmentation].[SegmentationFlatData73d1e17b-e472-41d6-8d07-6a3a2e2ea3d4] ADD CONSTRAINT [pk_SegmentationFlatData73d1e17b-e472-41d6-8d07-6a3a2e2ea3d4] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData73d1e17b-e472-41d6-8d07-6a3a2e2ea3d4] ON [segmentation].[SegmentationFlatData73d1e17b-e472-41d6-8d07-6a3a2e2ea3d4] ([_rn])
GO
