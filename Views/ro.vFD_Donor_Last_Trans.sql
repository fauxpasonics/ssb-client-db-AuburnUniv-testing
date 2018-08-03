SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Donor_Last_Trans] as
select
	  DO.Donor							as DonorID

	, (select convert(Date, max(LD.Date))
		from FD_Trans (nolock) as LD
		where	DO.Donor	= LD.Donor
			and LD.Don_Amt > 0)			as LastDonation
	, (select convert(Date, max(LO.Date))
		from FD_Trans (nolock) as LO
		where	DO.Donor	= LO.Donor
			and LO.Out_Amt > 0)			as LastOutright
	, (select convert(Date, max(LP.Date))
		from FD_Trans (nolock) as LP
		where	DO.Donor	= LP.Donor
			and LP.Plg_Amt > 0)			as LastPledge
	, (select convert(Date, max(LW.Date))
		from FD_Trans (nolock) as LW
		where	DO.Donor	= LW.Donor
			and LW.WO_Amt > 0)			as LastWriteOff


 , EXPORT_DATETIME from dbo.FD_Donor (nolock)			as DO


GO
