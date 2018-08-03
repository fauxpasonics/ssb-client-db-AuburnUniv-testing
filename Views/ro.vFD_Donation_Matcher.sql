SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [ro].[vFD_Donation_Matcher] as
select
	isnull(DM.Donor,'(none)')		as DonorID,
	isnull(DM.Drive,'(none)')		as DriveCode,
	DM.Matcher_Don_Amt				as MatchingDonation,
	Substring(Left(DM.Matcher,
		Len(DM.Matcher)-Charindex
		(':',Reverse(DM.Matcher))),
		Charindex(':',DM.Matcher)+1,
		Len(DM.Matcher))			as MatchingDonorID,
	DM.Matcher_Plg_Amt				as MatchingPledge,
	DM.Matcher_Ratio				as MatchingRatio,
	DM.Seq							as Sequence,
	DM.ZID							as ZID,
	[dbo].[fnGetValueFromDelimitedString](dm.Matcher,':',1) as Matcher_DriveCode,
	[dbo].[fnGetValueFromDelimitedString](dm.Matcher,':',2) as Matcher_DonorId,
	[dbo].[fnGetValueFromDelimitedString](dm.Matcher,':',3) as Matcher_Sequence

 , EXPORT_DATETIME from dbo.FD_Donation_Matcher(nolock)as DM



GO
