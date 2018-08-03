SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [ro].[vFD_Donation_Solicitor] as
select
	isnull(DS.Donor,'(none)')		as DonorID,
	isnull(DS.Drive,'(none)')		as DriveCode,
	isnull(DS.Solicitor,'(none)')	as SolicitorCode,
	DS.ZID							as ZID

 , DS.EXPORT_DATETIME from dbo.FD_Donation_Solicitor(nolock)	as DS
	--left join PD_Patron(nolock)			as PA	on	PA.Patron	= DS.Donor
	--left join FD_Drive (nolock)			as DR	on	DR.Drive	= DS.Drive
	--left join FD_Campaign(nolock)		as CA	on	CA.Campaign	= DR.Campaign
	--left join FD_Program (nolock)		as PR	on	PR.Program	= CA.Program
	--left join FD_Solicitor(nolock)		as SO	on	SO.Solicitor= DS.Solicitor
	--left join PD_Patron(nolock)			as SP	on	SP.Patron	= DS.Solicitor
	--left join FD_Team	(nolock)		as TE	on	TE.Team		= SO.Team



GO
