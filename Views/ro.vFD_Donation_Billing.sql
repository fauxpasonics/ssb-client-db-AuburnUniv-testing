SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Donation_Billing] as
select
	DB.Billing_Amount					as Billing,
	Convert(Date,DB.Billing_Date)		as BillDate,
	isnull(DB.Donor,'(none)')			as DonorID,
	isnull(DB.Drive,'(none)')			as DriveCode,
	Seq									as Sequence,
	DB.ZID								as ZID

 , EXPORT_DATETIME from dbo.FD_Donation_Billing(nolock)as DB	
	--left join PD_Patron(nolock)		as PA	on	PA.Patron	= DB.Donor
	--left join FD_Drive (nolock)		as DR	on	DR.Drive	= DB.Drive
	--left join FD_Campaign(nolock)	as CA	on	CA.Campaign	= DR.Campaign
	--left join FD_Program(nolock)	as PR	on	PR.Program	= CA.Program



GO
