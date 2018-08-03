SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_PayModeType] as
select distinct
	isnull(nullif(left(Type_Name,30),''),
		Type)				as PayModeType,
	Type					as PayModeTypeCode,
	Type_Name				as PayModeTypeFullName
From FD_PayMode(nolock)



GO
