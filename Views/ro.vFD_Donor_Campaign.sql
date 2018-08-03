SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Donor_Campaign] as
select 
	isnull(DC.Campaign,'(none)')as CampaignCode,
	isnull(DC.Class,'(none)')	as ClassCode,
	isnull(DC.Donor,'(none)')	as DonorID

 , EXPORT_DATETIME from dbo.FD_Donor_Campaign (nolock)	as DC


GO
