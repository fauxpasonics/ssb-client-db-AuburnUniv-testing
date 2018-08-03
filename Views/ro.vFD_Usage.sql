SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Usage] as
select 
	isnull(Entity,'(none)')		as EntityCode,
	case Inactivity
		when 'N'	then 'No'
		when 'Y'	then 'Yes'
	else Inactivity end			as Inactive,
	Last_DateTime				as LastUpdate,
	Last_User					as LastUpdaterCode,
	case Restricted
		when 'N'	then 'No'
		when 'Y'	then 'Yes'
	else Restricted end			as Restricted,
	isnull(isnull(nullif(Name,''),
		Fund_Usage),'(none)')	as Usage,
	Fund_Usage					as UsageCode,
	isnull(Name,Fund_Usage)		as UsageFullName

 , EXPORT_DATETIME from dbo.FD_Usage(nolock)


GO
