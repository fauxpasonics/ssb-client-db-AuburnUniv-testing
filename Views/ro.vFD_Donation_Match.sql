SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [ro].[vFD_Donation_Match] as

select
	isnull(DM.Donor,'(none)')			as DonorID,
	isnull(DM.Drive,'(none)')			as DriveCode,
	DM.Match_Don_Amt					as MatchedDonation,
	Substring(Left(DM.Match,Len
		(DM.Match)-Charindex(':',
		Reverse(DM.Match))),Charindex
		(':',DM.Match)+1,len(DM.Match))	as MatchedDonorID,
	DM.Match_Plg_Amt					as MatchedPledge,
	DM.Seq								as Sequence,
	DM.ZID								as ZID,
    [dbo].[fnGetValueFromDelimitedString](dm.MATCH,':',1) as Match_DriveCode,
	[dbo].[fnGetValueFromDelimitedString](dm.MATCH,':',2) as Match_DonorId,
	[dbo].[fnGetValueFromDelimitedString](dm.MATCH,':',3) as Match_Sequence

 , EXPORT_DATETIME 
 
 from dbo.FD_Donation_Match (nolock)	as DM



GO
