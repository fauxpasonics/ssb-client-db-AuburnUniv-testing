SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vFD_Donation_Payment] as
select
	isnull(DP.Donor,'(none)')		as DonorID,
	isnull(DP.Drive,'(none)')		as DriveCode,
	DP.Pmnt_Amt						as Payment,
	DP.Pmnt_Batch					as PaymentBatchCode,
	Convert(Date, DP.Pmnt_Date)		as PaymentDate,
	isnull(DP.Pmnt_Mode,'(none)')	as PayModeCode,
	DP.ZID							as ZID

 , EXPORT_DATETIME from dbo.FD_Donation_Payment(nolock)as DP


GO
