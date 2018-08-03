SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [ro].[vTK_Season] as
select
	isnull(SE.Activity,'(none)')	as ActivityCode,
	isnull(SE.Previous,'(none)')	as PrevSeasonCode,
	isnull(nullif(left(SE.Name,30),''),
		SE.Season)					as Season,
	SE.Season						as SeasonCode,
	SE.Name							as SeasonFullName,
	SE.Sort_Order					as Sequence,
	SE.Size							as Size,
	case SE.Status
		when 'C' then	'Closed'
		when 'H' then	'Final Hist'
		when 'H1' then	'Hist Lvl 1'
		when 'O' then	'Open'
		when 'P' then	'Pre Close'
	else SE.Status End			as Status

 , EXPORT_DATETIME From TK_Season(nolock)	as SE

GO
