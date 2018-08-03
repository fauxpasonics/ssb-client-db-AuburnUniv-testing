SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Donor_Program] as
select 
	isnull(DP.Class,'(none)')	as ClassCode,
	isnull(DP.Donor,'(none)')	as DonorID,
	case when (DP.Year > 0)
		then DP.Year
	else null end				as FirstYear,
	DP.Lifetime_Donation		as LifeTimeDonation,
	case DP.Lifetime_Donor
		when 'N'	then 'No'
		when 'Y'	then 'Yes'
	else DP.Lifetime_Donor end	as LifeTimeDonor,		
	DP.Lifetime_Match			as LifeTimeMatch,
	isnull(DP.Program,'(none)') as ProgramCode
 , EXPORT_DATETIME from dbo.FD_Donor_Program (nolock)	as DP



GO
