CREATE TABLE [ods].[Appetize_Vendor]
(
[Vendor_id] [int] NOT NULL,
[ext_vendor_id] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[username] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[printer_ip] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[venue_id] [int] NULL,
[name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[staff_members] [int] NULL,
[order_capacity] [int] NULL,
[fast_pass_lane] [int] NULL,
[vendor_status] [int] NULL,
[status] [int] NULL,
[status_description] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[drink_limit] [int] NULL,
[promo_enabled] [int] NULL,
[pickup_increment] [int] NULL,
[wait_m] [int] NULL,
[welcome_text] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pickup_location] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[additional_info] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[first_screen] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[login_required] [int] NULL,
[tip_enabled] [int] NULL,
[fee] [int] NULL,
[fee_in_percent] [int] NULL,
[convince_fee] [int] NULL,
[fee_text] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[collected_tax_rate] [decimal] (18, 2) NULL,
[tax_on_fee] [int] NULL,
[taxOnConvenienceFee] [int] NULL,
[image_url] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vendor_type] [int] NULL,
[seat_confirmation] [int] NULL,
[tare_weight] [decimal] (18, 2) NULL,
[food_count] [int] NULL,
[drink_count] [int] NULL,
[mixer_count] [int] NULL,
[mixer_built_count] [int] NULL,
[merch_count] [int] NULL,
[bundle_count] [int] NULL,
[pickupTimeSelectionEnabled] [int] NULL,
[tax_on_total] [int] NULL,
[tax_on_tip] [int] NULL,
[tax_charge_after_discount] [int] NULL,
[quick_order_view] [int] NULL,
[quick_order_image] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[groups] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[is_drink_limit_per_event] [int] NULL,
[pickupIncrement] [int] NULL,
[isAlcoholLimitPerEventEnabled] [int] NULL,
[alcoholLimitPerEvent] [int] NULL,
[isAlcoholLimitPerOrderEnabled] [int] NULL,
[alcoholLimitPerOrder] [int] NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Appetize___ETL_C__6CCCFD7B] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Appetize___ETL_C__6DC121B4] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Appetize___ETL_U__6EB545ED] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Appetize___ETL_U__6FA96A26] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Appetize_VendorUpdate] ON [ods].[Appetize_Vendor]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Appetize_Vendor] t
	JOIN inserted i ON  t.[Vendor_id] = i.[Vendor_id]

INSERT INTO [ods].[Snapshot_Appetize_Vendor] ([Vendor_id],[ext_vendor_id],[username],[printer_ip],[venue_id],[name],[staff_members],[order_capacity],[fast_pass_lane],[vendor_status],[status],[status_description],[drink_limit],[promo_enabled],[pickup_increment],[wait_m],[welcome_text],[pickup_location],[additional_info],[first_screen],[login_required],[tip_enabled],[fee],[fee_in_percent],[convince_fee],[fee_text],[collected_tax_rate],[tax_on_fee],[taxOnConvenienceFee],[image_url],[vendor_type],[seat_confirmation],[tare_weight],[food_count],[drink_count],[mixer_count],[mixer_built_count],[merch_count],[bundle_count],[pickupTimeSelectionEnabled],[tax_on_total],[tax_on_tip],[tax_charge_after_discount],[quick_order_view],[quick_order_image],[groups],[is_drink_limit_per_event],[pickupIncrement],[isAlcoholLimitPerEventEnabled],[alcoholLimitPerEvent],[isAlcoholLimitPerOrderEnabled],[alcoholLimitPerOrder],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Appetize_Vendor] ADD CONSTRAINT [PK__Appetize__D9C3FED0AF31B089] PRIMARY KEY CLUSTERED  ([Vendor_id])
GO
