SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Donor] as
select
	DO.Comments						as Comments,
	isnull(DO.Donor,'(none)')		as DonorID,
	DO.Priority_Points				as DonorPrPoints,
	DO.Ranking						as DonorRanking,
	isnull(DO.Donor_Type,'(none)')	as DonorTypeCode,
	DO.Years_Of_Donation			as DonorYears,
	DO.Last_DateTime				as LastUpdate,
	DO.Last_User					as LastUpdaterCode,
	DO.Publish_Name					as PublishName,
	DO.Tag_Marks					as Tags,
	DO.UD1							as UserField1,
	DO.UD2							as UserField2,
	DO.UD3							as UserField3,
	DO.UD4							as UserField4,
	DO.UD5							as UserField5,
	DO.UD6							as UserField6,
	DO.UD7							as UserField7,
	DO.UD8							as UserField8,
	DO.UD9							as UserField9,
	DO.UD10							as UserField10,
	DO.UD11							as UserField11,
	DO.UD12							as UserField12,
	DO.UD13							as UserField13,
	DO.UD14							as UserField14,
	DO.UD15							as UserField15,
	DO.UD16							as UserField16,
	DO.UD17							as UserField17,
	DO.UD18							as UserField18,
	DO.UD19							as UserField19,
	DO.UD20							as UserField20

 , EXPORT_DATETIME from dbo.FD_Donor (nolock)			as DO


GO
