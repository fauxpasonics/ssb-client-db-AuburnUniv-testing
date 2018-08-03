SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Campaign] as 
select
	Isnull(left(CA.Name,30),CA.Campaign)	as Campaign,
	CA.Campaign					as CampaignCode,
	CA.Name						as CampaignFullName,
	CA.ChairPerson				as ChairPerson,

	--case CA.Basis
	--	when 'D' then 'Donated'
	--	when 'P' then 'Pledged'
	--	when 'H' then 'High P/D'
	--	when 'M' then 'Manual'
	--else CA.Basis End			as ClassBasis,

	case when (CA.Basis is null)
		then '(none)'
	else case CA.Basis
		when 'D' then 'Donated'
		when 'P' then 'Pledged'
		when 'H' then 'High P/D'
		when 'M' then 'Manual'
	else CA.Basis End End		as ClassBasis,

	case when (CA.Class_Level is null)
		then '(none)'
	else case CA.Class_Level
		when 'C' then 'Campaign'
		when 'L' then 'Life Time'
		when 'P' then 'Program'
	else CA.Class_Level End end	as ClassLevel,
	Convert(Date,CA.End_Date)	as EndDate,
	CA.GOAL						as Goal,
	CA.Last_DateTime			as LastUpdate,
	CA.Last_User				as LastUpdaterCode,
	case when (CA.Matching_Basis is null)
		then '(none)'
	else case CA.Matching_Basis
		when 'D' then 'Donated'
		when 'P' then 'Pledged'
		when 'H' then 'High P/D'
		when 'M' then 'Manual'
	else CA.Matching_Basis end
	end							as MatchingClassBasis,
	CA.Program					as ProgramCode,
	CA.Seq						as Sequence,
	Convert(Date,CA.Start_Date)	as StartDate,
	case when (CA.Status is null)
		then '(none)'
	else case CA.Status
		when 'O'	then 'Open'
		when 'C'	then 'Closed'
		when 'H1'	then 'Hist Lvl 1'
		when 'H2'	then 'Hist Lvl 2'
	else CA.Status end end		as Status

 , EXPORT_DATETIME from dbo.FD_Campaign (nolock)		as CA


GO
