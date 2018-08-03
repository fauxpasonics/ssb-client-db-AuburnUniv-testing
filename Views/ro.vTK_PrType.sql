SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [ro].[vTK_PrType] as
select
	isnull(nullif(left(PT.Name,30),''),
		PT.PrType)					as PriceType,
	isnull(nullif(PT.Class,''),
		'(none)')					as PriceTypeClassCode,
	PT.PrType						as PriceTypeCode,
	PT.Name							as PriceTypeFullName,
	case PT.Kind
		when 'C'	then 'Comp'
		when 'F'	then 'Full Price'
		when 'H'	then 'Hold'
		when null	then 'Discount'
	else PT.Kind end				as PriceTypeKind,
	PT.Season						as SeasonCode,
	'('+PT.Season+') '+
	left(PT.Name,30)
	collate SQL_Latin1_General_CP1_CS_AS
									as SeasonCodePriceType,
	PT.Season+'::'+PT.PrType		as SeasonCodePriceTypeCode

 , EXPORT_DATETIME From TK_PRType(nolock)				as PT

GO
