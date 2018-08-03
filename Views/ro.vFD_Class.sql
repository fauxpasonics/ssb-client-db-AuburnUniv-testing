SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Class] as 
select 
	Isnull(nullif(left(CL.Name,30),''),
		CL.Class)				as Class,
	CL.Class					as ClassCode,
	CL.Name						as ClassFullName,
	CL.Last_DateTime			as LastUpdate,
	CL.Last_User				as LastUpdaterCode,
	CL.Lower_Limit				as LowerLimit,
	CL.Program					as ProgramCode,
	CL.Upper_Limit				as UpperLimit

 , EXPORT_DATETIME from dbo.FD_Class (nolock) as CL


GO
