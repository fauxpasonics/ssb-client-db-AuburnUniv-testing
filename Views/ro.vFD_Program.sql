SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Program] as 
select
	case LifeTime 
		when 'N' then 'No'
		when 'Y' then 'Yes'
	else Lifetime end		as Lifetime,
	Isnull(nullif(left(Name,30),''),
		Program)			as Program,
	Program					as ProgramCode,
	isnull(Name,Program)	as ProgramFullName
 , EXPORT_DATETIME from dbo.FD_Program(nolock)



GO
