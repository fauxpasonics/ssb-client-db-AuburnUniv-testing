SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Trans] as
select 
	FT.AItem_Amt				as AddlItem,
	FT.APaid_Amt				as AddlPaid,
	FT.Batch 					as BatchCode,
	FT.Ben_Amt					as Benefit,
	FT.Cash_Amt					as Cash,
	isnull(FT.Class,'(none)')	as ClassCode,
	convert(date,FT.Date)		as Date,
	FT.Description				as Description,
	FT.Document					as Document,
	FT.Don_Amt					as Donation,
	isnull(FT.Donor,'(none)')	as DonorID,
	isnull(FT.Drive,'(none)')	as DriveCode,
	FT.GIK_Amt					as GiftInKind,
	isnull(FT.Motive,'(none)')	as MotiveCode,
	FT.Out_Amt					as Outright,
	isnull(FT.PayMode,'(none)')	as PayModeCode,
	FT.Plg_Amt					as Pledge,
	FT.SEQ						as Sequence,
	FT.Source					as Source,
	FT.Trans_No					as TransNo,
	FT.WO_Amt					as WriteOff,
	FT.ZID						as ZID

 , EXPORT_DATETIME from dbo.FD_Trans (nolock)			as FT
	--left join FD_Class (nolock)		as FC	on	FC.Class	= FT.Class
	--left join PD_Patron(nolock)		as PA	on	PA.Patron	= FT.Donor
	--left join FD_Drive (nolock)		as DR	on	DR.Drive	= FT.Drive
	--left join FD_PayMode(nolock)	as PM	on	PM.PayMode	= FT.PayMode
	--left join FD_Campaign(nolock)	as CA	on	CA.Campaign	= DR.Campaign
	--left join FD_Program(nolock)	as PR	on	PR.Program	= CA.Program
	--left join FD_Motive(nolock)		as MO	on	MO.Motive	= FT.Motive



GO
