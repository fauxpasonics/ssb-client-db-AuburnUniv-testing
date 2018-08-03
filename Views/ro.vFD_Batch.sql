SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- drop view vFD_Batch
CREATE VIEW [ro].[vFD_Batch] as
select
	isnull(nullif(left(Name,30),''),
		Batch)					as Batch,
	Batch						as BatchCode,
	Name						as BatchFullName,
	convert(date,Close_Date)	as CloseDate,
	convert(date,Deposit_Date)	as DepositDate,
	convert(date,Expire_Date)	as ExpirationDate,
	Last_DateTime				as LastUpdate,
	Last_User					as LastUpdaterCode,
	convert(date,Open_Date)		as OpenDate,
	convert(date,Post_Date)		as PostDate,
	case Status
		when 'O' then 'Open'
		when 'C' then 'Closed'
		when 'P' then 'Posted'
	else Status end				as Status,
	case Type 
		when 'D' then 'Donations'
		when 'W' then 'Write-Off'
	else Type end				as Type,
	ZID							as ZID,
	EXPORT_DATETIME
From FD_Batch(nolock)



GO
