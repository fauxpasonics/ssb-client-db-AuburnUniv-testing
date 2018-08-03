SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Region_Zip] as
select
	Region		as RegionCode,
	Zip			as Zip

 , EXPORT_DATETIME from dbo.FD_Region_Zip(nolock)



GO
