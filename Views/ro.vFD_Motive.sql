SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Motive] as 
select 
	Isnull(nullif(left(Name,30),''),
		Motive)					as Motive,
	Motive						as MotiveCode,
	isnull(Name,Motive)			as MotiveFullName

 , EXPORT_DATETIME from dbo.FD_Motive(nolock)


GO
