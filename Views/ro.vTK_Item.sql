SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [ro].[vTK_Item] as
select
	case when IT.Basis is null
		then '(none)'
	else case IT.Basis
		when 'A'	then 'Access Pass'
		when 'C'	then 'Combo'
		when 'D'	then 'Donation'
		when 'G'	then 'Gift Cert'
		when 'M'	then 'Misc'
		when 'S'	then 'Single'
	else IT.Basis end end			as Basis,
	IT.Internet_Name				as InternetName,
	Isnull(nullif(left(IT.Name,30),''),
		IT.Item)					as Item,
	IT.Item						as ItemCode,
	isnull(IT.Class,'(none)')		as ItemClassCode,
	IT.Name							as ItemFullName,
	IT.Keyword						as Keywords,
	IT.Last_DateTime				as LastUpdate,
	IT.Last_User					as LastUpdaterCode,
	IT.Print_Line					as PrintLine,
	IT.Season						as SeasonCode,
	'('+IT.Season+') '+
	isnull(nullif(left(IT.Name,30),''),IT.Item) collate SQL_Latin1_General_CP1_CS_AS
									as SeasonCodeItem,
	IT.Season+'::'+IT.Item		as SeasonCodeItemCode,
	Convert(date,IT.Sell_Date_From)	as SellFromDate,
	Convert(time,IT.Sell_Time_From)	as SellFromTime,
	Convert(date,IT.Sell_Date_To)	as SellToDate,
	Convert(time,IT.Sell_Time_To)	as SellToTime,
	IT.Tag							as Tags

 , EXPORT_DATETIME From  TK_Item(nolock)	as IT	

GO
