SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Entity] as 
select
	Isnull(nullif(left(Name,30),''),
		Entity)			as Entity,
	Entity				as EntityCode,
	isnull(Name,Entity)	as EntityFullName

 , EXPORT_DATETIME from dbo.FD_Entity(nolock)


GO
