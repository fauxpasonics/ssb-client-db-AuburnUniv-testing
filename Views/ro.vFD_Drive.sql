SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [ro].[vFD_Drive] as
select 
	isnull(DR.Campaign,'(none)')	as CampaignCode,
	(select sum(Cash_Amt+GIK_Amt)
		from FD_Donation as DON
		where DON.Drive = DR.Drive)	as Donation,
	(select count(distinct(Donor))
		from FD_Donation as DON
		where DON.Drive = DR.Drive
		and	(Cash_Amt+GIK_Amt) > 0)	as DonationDonorCount,
	Isnull(left(DR.Name,30),
			DR.Drive)				as Drive,
	DR.Drive						as DriveCode,
	DR.Name							as DriveFullName,
	Convert(Date,DR.END_DATE)		as EndDate,
	DR.Goal 						as Goal,
	DR.Last_DateTime				as LastUpdate,
	DR.Last_User					as LastUpdaterCode,
	case DR.Lifetime
		when 'N'	then 'No'
		when 'Y'	then 'Yes'
	else DR.Lifetime end			as Lifetime,
	(select count(distinct(Donor))
		from FD_Donation as DON
		where DON.Drive = DR.Drive
		and	Plg_Amt > 0)			as PledgeDonorCount,
	DR.Seq							as SortSequence,
	Convert(Date,DR.START_DATE)		as StartDate,
	case DR.Status
		when 'O'	then 'Open'
		when 'C'	then 'Closed'
		when 'H1'	then 'Hist Lvl 1'
		when 'H2'	then 'Hist Lvl 2'
	else DR.Status End				as Status,
	case DR.Update_Class
		when 'N'	then 'No'
		when 'Y'	then 'Yes'
	else DR.Update_Class end		as UpdateClass
 , EXPORT_DATETIME from dbo.FD_Drive(nolock)			as DR



GO
