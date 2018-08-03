SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [ro].[vFD_Trans_Usage] as
select 
	Usg_Don_Amt				as Donation,
	Usg_Out_Amt				as Outright,
	Usg_Plg_Amt				as Pledge,
	Trans_No				as TransNo,
	isnull(Usage,'(none)')	as UsageCode,
	Usg_WO_Amt				as WriteOff,
	ZID						as ZID

 , EXPORT_DATETIME from dbo.FD_Trans_Usage(nolock)
	--left join FD_Usage(nolock)	as FU	on	FU.Fund_Usage	= TU.Usage
	--left join FD_Entity(nolock)	as EN	on	EN.Entity		= FU.Entity



GO
