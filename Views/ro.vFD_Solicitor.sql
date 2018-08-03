SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Solicitor] as 
select
	Solicitor				as SolicitorCode,
	isnull(Team,'(none)')	as TeamCode
 , EXPORT_DATETIME from dbo.FD_Solicitor(nolock)


GO
