SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_Appetize_Vendor] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_Appetize_Vendor] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[Vendor_id] [int] NULL,
[ext_vendor_id] [nvarchar](50) NULL,
[username] [nvarchar](100) NULL,
[printer_ip] [nvarchar](50) NULL,
[venue_id] [int] NULL,
[name] [nvarchar](100) NULL,
[staff_members] [int] NULL,
[order_capacity] [int] NULL,
[fast_pass_lane] [int] NULL,
[vendor_status] [int] NULL,
[status] [int] NULL,
[status_description] [nvarchar](250) NULL,
[drink_limit] [int] NULL,
[promo_enabled] [int] NULL,
[pickup_increment] [int] NULL,
[wait_m] [int] NULL,
[welcome_text] [nvarchar](250) NULL,
[pickup_location] [nvarchar](250) NULL,
[additional_info] [nvarchar](250) NULL,
[first_screen] [nvarchar](100) NULL,
[login_required] [int] NULL,
[tip_enabled] [int] NULL,
[fee] [int] NULL,
[fee_in_percent] [int] NULL,
[convince_fee] [int] NULL,
[fee_text] [nvarchar](250) NULL,
[collected_tax_rate] [decimal](18, 2) NULL,
[tax_on_fee] [int] NULL,
[taxOnConvenienceFee] [int] NULL,
[image_url] [nvarchar](max) NULL,
[vendor_type] [int] NULL,
[seat_confirmation] [int] NULL,
[tare_weight] [decimal](18, 2) NULL,
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
[quick_order_image] [nvarchar](max) NULL,
[groups] [nvarchar](250) NULL,
[is_drink_limit_per_event] [int] NULL,
[pickupIncrement] [int] NULL,
[isAlcoholLimitPerEventEnabled] [int] NULL,
[alcoholLimitPerEvent] [int] NULL,
[isAlcoholLimitPerOrderEnabled] [int] NULL,
[alcoholLimitPerOrder] [int] NULL,
[ETL_CreatedOn] [datetime] NOT NULL,
[ETL_CreatedBy] NVARCHAR(400) NOT NULL,
[ETL_UpdatedOn] [datetime] NOT NULL,
[ETL_UpdatedBy] NVARCHAR(400) NOT NULL
)

AS
BEGIN

DECLARE @EndDate DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS datetime2(0))))
SET @AsOfDate = (SELECT CAST(@AsOfDate AS datetime2(0)))

INSERT INTO @Results
SELECT [Vendor_id],[ext_vendor_id],[username],[printer_ip],[venue_id],[name],[staff_members],[order_capacity],[fast_pass_lane],[vendor_status],[status],[status_description],[drink_limit],[promo_enabled],[pickup_increment],[wait_m],[welcome_text],[pickup_location],[additional_info],[first_screen],[login_required],[tip_enabled],[fee],[fee_in_percent],[convince_fee],[fee_text],[collected_tax_rate],[tax_on_fee],[taxOnConvenienceFee],[image_url],[vendor_type],[seat_confirmation],[tare_weight],[food_count],[drink_count],[mixer_count],[mixer_built_count],[merch_count],[bundle_count],[pickupTimeSelectionEnabled],[tax_on_total],[tax_on_tip],[tax_charge_after_discount],[quick_order_view],[quick_order_image],[groups],[is_drink_limit_per_event],[pickupIncrement],[isAlcoholLimitPerEventEnabled],[alcoholLimitPerEvent],[isAlcoholLimitPerOrderEnabled],[alcoholLimitPerOrder],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [Vendor_id],[ext_vendor_id],[username],[printer_ip],[venue_id],[name],[staff_members],[order_capacity],[fast_pass_lane],[vendor_status],[status],[status_description],[drink_limit],[promo_enabled],[pickup_increment],[wait_m],[welcome_text],[pickup_location],[additional_info],[first_screen],[login_required],[tip_enabled],[fee],[fee_in_percent],[convince_fee],[fee_text],[collected_tax_rate],[tax_on_fee],[taxOnConvenienceFee],[image_url],[vendor_type],[seat_confirmation],[tare_weight],[food_count],[drink_count],[mixer_count],[mixer_built_count],[merch_count],[bundle_count],[pickupTimeSelectionEnabled],[tax_on_total],[tax_on_tip],[tax_charge_after_discount],[quick_order_view],[quick_order_image],[groups],[is_drink_limit_per_event],[pickupIncrement],[isAlcoholLimitPerEventEnabled],[alcoholLimitPerEvent],[isAlcoholLimitPerOrderEnabled],[alcoholLimitPerOrder],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[Appetize_Vendor] t
	UNION ALL
	SELECT [Vendor_id],[ext_vendor_id],[username],[printer_ip],[venue_id],[name],[staff_members],[order_capacity],[fast_pass_lane],[vendor_status],[status],[status_description],[drink_limit],[promo_enabled],[pickup_increment],[wait_m],[welcome_text],[pickup_location],[additional_info],[first_screen],[login_required],[tip_enabled],[fee],[fee_in_percent],[convince_fee],[fee_text],[collected_tax_rate],[tax_on_fee],[taxOnConvenienceFee],[image_url],[vendor_type],[seat_confirmation],[tare_weight],[food_count],[drink_count],[mixer_count],[mixer_built_count],[merch_count],[bundle_count],[pickupTimeSelectionEnabled],[tax_on_total],[tax_on_tip],[tax_charge_after_discount],[quick_order_view],[quick_order_image],[groups],[is_drink_limit_per_event],[pickupIncrement],[isAlcoholLimitPerEventEnabled],[alcoholLimitPerEvent],[isAlcoholLimitPerOrderEnabled],[alcoholLimitPerOrder],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_Appetize_Vendor]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
