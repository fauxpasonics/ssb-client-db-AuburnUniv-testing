SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Solicit]as
select
	SO.Comments					as Comments,
	Convert(Date,SO.Date)		as Date,
	isnull(SO.Donor,'(none)')	as DonorID,
	isnull(SO.Drive,'(none)')	as DriveCode,
	SO.Goal						as Goal,
	SO.Last_DateTime			as LastUpdate,
	SO.Last_User				as LastUpdaterCode,
	isnull(SO.Rating,'(none)')	as RatingCode,
	isnull(SO.Primary_Solicitor,
		'(none)')				as SolicitorCode,
	isnull(SO.Target,'(none)')	as TargetCode,
	isnull(SO.Usage,'(none)')	as UsageCode,
	EXPORT_DATETIME
 
From	dbo.FD_Solicit(nolock)      as SO


GO
