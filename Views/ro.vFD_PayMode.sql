SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_PayMode] as
select 
	Last_DateTime			as LastUpdate,
	Last_User				as LastUpdaterCode,
	Isnull(nullif(left(Name,30),''),
		PayMode)			as PayMode,
	PayMode					as PayModeCode,
	isnull(Name,PayMode)	as PayModeFullName,
	isnull(Type,'(none)')	as PayModeTypeCode

 , EXPORT_DATETIME from dbo.FD_PayMode (nolock)


GO
