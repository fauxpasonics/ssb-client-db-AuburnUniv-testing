SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Region] as 
select
	Isnull(nullif(left(Name,30),''),
		Region)			as Region,
	Region				as RegionCode,
	isnull(Name,Region)	as RegionFullName

 , EXPORT_DATETIME from dbo.FD_Region(nolock)


GO
