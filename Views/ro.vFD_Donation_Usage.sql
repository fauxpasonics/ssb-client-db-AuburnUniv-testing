SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Donation_Usage] as
select
	DU.Usg_Cash_Amt				as Cash,
	isnull(DU.Donor,'(none)')	as DonorID,
	isnull(DU.Drive,'(none)')	as DriveCode,
	DU.Usg_Gik_Amt				as GiftInKind,
	DU.Usg_Out_Amt				as Outright,
	DU.Usg_Plg_Amt				as Pledge,
	isnull(DU.Usage,'(none)')	as UsageCode,
	DU.Usg_WO_Amt				as WriteOff,
	DU.ZID						as ZID

 , EXPORT_DATETIME from dbo.FD_Donation_Usage (nolock)	as DU
	--left join PD_Patron(nolock)		as PA	on	PA.Patron		= DU.Donor
	--left join FD_Drive (nolock)		as DR	on	DR.Drive		= DU.Drive
	--left join FD_Usage (nolock)		as US	on  US.Fund_Usage	= DU.Usage
	--left join FD_Entity(nolock)		as EN	on  EN.Entity		= US.Entity
	--left join FD_Campaign(nolock)	as CA	on	CA.Campaign		= DR.Campaign
	--left join FD_Program(nolock)	as PR	on	PR.Program		= CA.Program



GO
