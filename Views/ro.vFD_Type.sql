SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Type] as 
select
	Isnull(left(Name,30),
		Type)			as Type,
	Type				as TypeCode,
	Name				as TypeFullName

 , EXPORT_DATETIME from dbo.FD_Type(nolock)


GO
