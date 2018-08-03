SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Donation] as 
select
	DON.AItem_Amt					as AddlItem,
	DON.APaid_Amt					as AddlPaid,
	DON.AItem_WO 					as AddlWriteOff,
	DON.Ben_Amt						as Benefit,
	DON.Billing_Periods				as BillPeriods,
	case when DON.Billing_Plan is null then
		'(none)'
	else case DON.Billing_Plan
		when 'A' then	'Annual'
		when 'M' then	'Monthly'
		when 'N' then	'None'
		when 'P' then	'Plan'
		when 'Q' then	'Quarterly'
		when 'S' then	'Semiannual'
	else DON.Billing_Plan end end	as BillPlan,
	DON.Cash_Amt					as Cash,
	Convert(Date, Don.Date)			as Date,
	DON.Donor						as DonorID,
	isnull(DON.Drive,'(none)')		as DriveCode,
	Don.Gik_Amt						as GiftInKind,
	DON.Last_DateTime				as LastUpdate,
	DON.Last_User					as LastUpdaterCode,
	isnull(DON.Motive,'(none)')		as MotiveCode,
	DON.Out_Amt						as Outright,
	DON.Plg_Amt						as Pledge,
	isnull(DON.Source,'(none)')		as SourceCode,
	isnull(DON.Tribute,'(none)')	as TributeCode,
	case DON.Type
		when 'P' then 'Pledge'
		when 'D' then 'Donation'
		when 'X' then 'Pldg/Don'
	else DON.Type End				as Type,
	DON.Wo_Amt						as WriteOff,
	DON.ZID							as ZID

 , EXPORT_DATETIME from dbo.FD_Donation (nolock)		as DON


GO
