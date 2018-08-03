SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








-- ==========================================================================================
-- Author:		Abbey Meitin
-- Create date: 8/2/17
-- Description:	 API View for Salesforce
-- ==========================================================================================


CREATE PROCEDURE [api].[CRM_GetDonations]
(
    @SSB_CRMSYSTEM_ACCT_ID VARCHAR(50) = 'Test',
	@SSB_CRMSYSTEM_CONTACT_ID VARCHAR(50) = 'Test',
	@DisplayTable INT = 0,
	@RowsPerPage  INT = 500,
	@PageNumber   INT = 0,
	@ViewResultInTable INT = 0
)
WITH RECOMPILE
AS

BEGIN

IF OBJECT_ID('tempdb..#BASE')IS NOT NULL DROP TABLE #BASE
IF OBJECT_ID('tempdb..#PatronList')IS NOT NULL DROP TABLE #PatronList


--DECLARE @SSB_CRMSYSTEM_ACCT_ID VARCHAR(50) = 'Test'
--DECLARE @SSB_CRMSYSTEM_CONTACT_ID VARCHAR(50) = '992C6C53-7B25-40E3-BA33-CDCC88072728'
--DECLARE @DisplayTable INT = 0
--DECLARE @RowsPerPage  INT = 500
--DECLARE @PageNumber   INT = 0
--DECLARE @ViewResultInTable INT = 0
/*===================================================================================================
												DECLARE VARIABLES
===================================================================================================*/

DECLARE @totalCount      INT
	,@xmlDataNode        XML
	,@recordsInResponse  INT
	,@remainingCount     INT
	,@rootNodeName       NVARCHAR(100)
	,@responseInfoNode   NVARCHAR(MAX)
	,@finalXml           XML
	,@PatronID varchar(500)

DECLARE @GUIDTable TABLE (
GUID VARCHAR(50)
)

IF (@SSB_CRMSYSTEM_ACCT_ID NOT IN ('None','Test'))
BEGIN
	INSERT INTO @GUIDTable
	SELECT DISTINCT z.SSB_CRMSYSTEM_CONTACT_ID
	FROM dbo.vwDimCustomer_ModAcctId z 
	WHERE z.SSB_CRMSYSTEM_ACCT_ID = @SSB_CRMSYSTEM_ACCT_ID
END

IF (@SSB_CRMSYSTEM_CONTACT_ID NOT IN ('None','Test'))
BEGIN
	INSERT INTO @GUIDTable
	SELECT @SSB_CRMSYSTEM_CONTACT_ID
END

DECLARE @Parent TABLE (
DriveCode VARCHAR(500)
, DriveFullName VARCHAR(500)
, UsageCode VARCHAR(500)
, UsageFullName VARCHAR(500)
, [Commit] NUMERIC(18,2)
, [Match] NUMERIC(18,2)
, [Donation] NUMERIC(18,2)
)	

/*===================================================================================================
												SSID's
===================================================================================================*/


SELECT a.[SSID] --TRY_CAST(a.[SSID] AS VARCHAR(50)) AS SSID
INTO #PatronList
FROM dbo.[vwDimCustomer_ModAcctId] (nolock) a
	JOIN @GUIDTable guids on guids.[GUID] = a.SSB_CRMSYSTEM_CONTACT_ID
WHERE a.SourceSystem = 'Paciolan'

SET @PatronID = (SELECT SUBSTRING(
(SELECT ',' + s.SSID
FROM [#PatronList] s
ORDER BY s.SSID
FOR XML PATH('')),2,200000) AS CSV)

/*===================================================================================================
												BASE
===================================================================================================*/

CREATE TABLE #BASE (
    [SoftDonorId] [VARCHAR](4000) NOT NULL	
   ,[DonorId] [VARCHAR](20) NOT NULL
   ,[TransDate] [date] NULL
   ,[DriveCode] [VARCHAR](32) NOT NULL
   ,[DriveFullName] [VARCHAR](128) NULL
   ,[UsageCode] [VARCHAR](32) NOT NULL
   ,[UsageFullName] [VARCHAR](128) NOT NULL
   ,[Commit] [NUMERIC](18, 2) NOT NULL
   ,[Donation] [NUMERIC](18, 2) NOT NULL
   ,[Match] [NUMERIC](18, 2) NOT NULL
   ,[MotiveCode] [VARCHAR](32) NOT NULL
   ,[UsageSeatQuantity] int NOT NULL
   ,[Entity1] [VARCHAR](30) NOT NULL
   ,[Entity2] [VARCHAR](30) NOT NULL
   ,[Entity2Name] [VARCHAR](50) NOT NULL
   ,[PricePerSeat] [DECIMAL](10, 2)    
   ,[PayModeCode] [VARCHAR](32) NOT NULL


)

INSERT INTO #BASE

 select SoftDonorId
, DonorId
, TransDate
, DriveCode
, DriveFullName
, UsageCode
, UsageFullName
, SUM([Commit]) [Commit]
, SUM(Donation) Donation
, SUM([Match]) [Match]
, MotiveCode
, UsageSeatQuantity
, Entity1
, Entity2
, Entity2Name
, PricePerSeat
, PayModeCode 
FROM (
		select SoftDonorId
		, DonorId
		, TransDate
		, DriveCode
		, DriveFullName
		, UsageCode
		, UsageFullName
		, PLG_AMT [Commit]
		, CAST('0.00' AS NUMERIC(18,2)) AS [Donation]
		, CAST(ISNULL(DON_AMT, '0.00') AS NUMERIC(18,2)) AS [Match]
		, MotiveCode
		, UsageSeatQuantity
		, Entity1
		, Entity2
		, Entity2Name
		, PricePerSeat
		, PayModeCode
		FROM [ro].[vw_Donation_Transaction] trans
		JOIN #PatronList list on list.SSID = trans.SoftDonorId
		where 1=1
		AND SoftDonorId <> DonorId
		
		UNION ALL

		select SoftDonorId
		, DonorId
		, TransDate
		, DriveCode
		, DriveFullName
		, UsageCode
		, UsageFullName
		, CAST(PLG_AMT AS NUMERIC(18,2)) [Commit]
		, DON_AMT AS [Donation]
		, CAST('0.00' AS NUMERIC(18,2)) AS [Match]
		, MotiveCode
		, UsageSeatQuantity
		, Entity1
		, Entity2
		, Entity2Name
		, PricePerSeat
		, PayModeCode
		FROM [ro].[vw_Donation_Transaction] trans
		JOIN #PatronList list on list.SSID = trans.SoftDonorId
		where 1=1
		AND SoftDonorId = DonorId
		
 ) don
 GROUP BY SoftDonorId
, DonorId
, TransDate
, DriveCode
, DriveFullName
, UsageCode
, UsageFullName
, MotiveCode
, UsageSeatQuantity
, Entity1
, Entity2
, Entity2Name
, PricePerSeat
, PayModeCode

	
ORDER BY TransDate DESC
OFFSET (@PageNumber) * @RowsPerPage ROWS
FETCH NEXT @RowsPerPage ROWS ONLY

/*===================================================================================================
												CREATE XML
===================================================================================================*/

IF @ViewResultinTable = 1
BEGIN
	PRINT @PatronID
END

 SET @totalCount = @@ROWCOUNT

 INSERT INTO @Parent
         ( [DriveCode] ,
           [DriveFullName] ,
		   [UsageCode] ,
		   [UsageFullName] ,
           [Commit],
		   [Donation],
		   [Match]
         )
 SELECT DriveCode
		, DriveFullName
		, UsageCode
		, UsageFullName
		, SUM([Commit]) [Commit]
		, SUM(Donation) Donation
		, SUM([Match]) [Match]
 FROM [#BASE] 
 GROUP BY DriveCode
		, DriveFullName
		, UsageCode
		, UsageFullName 
ORDER BY DriveCode DESC

-- Cap returned results at 1000
IF @RowsPerPage > 1000
BEGIN
	SET @RowsPerPage = 1000;
END
	
-- Pull total count
SELECT @totalCount = COUNT(*)
FROM #BASE


-- Set records in response
SET @recordsInResponse  = (SELECT COUNT(*) FROM #BASE)

-- Create XML response data node
SET @xmlDataNode = (
SELECT [DriveCode] , [DriveFullName],[UsageCode] ,[UsageFullName],
CASE WHEN SIGN(ISNULL(TRY_CAST([Commit] AS VARCHAR(50)) ,'')) <0 THEN '-' ELSE '' END + '$' + ISNULL(TRY_CAST([Commit] AS VARCHAR(50)), '0.00') AS [Commit],
CASE WHEN SIGN(ISNULL(TRY_CAST([Donation] AS VARCHAR(50)) ,'')) <0 THEN '-' ELSE '' END + '$' + ISNULL(TRY_CAST([Donation] AS VARCHAR(50)), '0.00') AS [Donation],
CASE WHEN SIGN(ISNULL(TRY_CAST([Match] AS VARCHAR(50)) ,'')) <0 THEN '-' ELSE '' END + '$' + ISNULL(TRY_CAST([Match] AS VARCHAR(50)), '0.00') AS [Match],
	(SELECT ISNULL(TRY_CAST(SoftDonorId AS VARCHAR(50)),'') AS SoftDonorId,
			ISNULL(TRY_CAST(DonorId AS VARCHAR(50)),'') AS DonorId
		   ,CONVERT(DATE, ISNULL([TransDate],''),102) AS [TransDate] 
		   , CASE WHEN SIGN(ISNULL(TRY_CAST([Commit] AS VARCHAR(50)) ,'')) <0 THEN '-' ELSE '' END + '$' + TRY_CAST([Commit] AS VARCHAR(50)) AS [Commit]
		   , CASE WHEN SIGN(ISNULL(TRY_CAST([Donation] AS VARCHAR(50)) ,'')) <0 THEN '-' ELSE '' END + '$' + ISNULL(TRY_CAST([Donation] AS VARCHAR(50)), '0.00') AS [Donation]
		   , CASE WHEN SIGN(ISNULL(TRY_CAST([Match] AS VARCHAR(50)) ,'')) <0 THEN '-' ELSE '' END + '$' + ISNULL(TRY_CAST([Match] AS VARCHAR(50)), '0.00') AS [Match]
			,ISNULL(TRY_CAST(MotiveCode AS VARCHAR(50)),'') AS [MotiveCode]
		   ,ISNULL(TRY_CAST(UsageSeatQuantity AS VARCHAR(50)),'') AS [UsageSeatQuantity] 
		   ,ISNULL(TRY_CAST([Entity1] AS VARCHAR(50)),'') AS [Entity1] 
		   ,ISNULL(TRY_CAST([Entity2] AS VARCHAR(50)),'') AS [Entity2] 
		   ,ISNULL(TRY_CAST([Entity2Name] AS VARCHAR(50)),'') AS [Entity2Name] 
		   ,ISNULL(TRY_CAST([PricePerSeat] AS VARCHAR(50)),'') AS [PricePerSeat] 
		   ,'' [Break]
	 FROM #BASE c
	 WHERE c.DriveCode = p.DriveCode
	 AND c.UsageCode = p.UsageCode
	 ORDER BY TransDate DESC
	 FOR XML PATH ('Child'), TYPE
	 ) AS 'Children'
FROM @Parent AS p  
FOR XML PATH ('Parent'), ROOT('Parents'))

SET @rootNodeName = 'Parents'
	
-- Calculate remaining count
SET @remainingCount = @totalCount - (@RowsPerPage * (@PageNumber + 1))
IF @remainingCount < 0
BEGIN
	SET @remainingCount = 0
END

-- Create response info node
SET @responseInfoNode = ('<ResponseInfo>'
	+ '<TotalCount>' + CAST(@totalCount AS NVARCHAR(20)) + '</TotalCount>'
	+ '<RemainingCount>' + CAST(@remainingCount AS NVARCHAR(20)) + '</RemainingCount>'
	+ '<RecordsInResponse>' + CAST(@recordsInResponse AS NVARCHAR(20)) + '</RecordsInResponse>'
	+ '<PagedResponse>true</PagedResponse>'
	+ '<RowsPerPage>' + CAST(@RowsPerPage AS NVARCHAR(20)) + '</RowsPerPage>'
	+ '<PageNumber>' + CAST(@PageNumber AS NVARCHAR(20)) + '</PageNumber>'
	+ '<RootNodeName>' + @rootNodeName + '</RootNodeName>'
	+ '</ResponseInfo>')

	
-- Wrap response info and data, then return	
IF @xmlDataNode IS NULL
BEGIN
	SET @xmlDataNode = '<' + @rootNodeName + ' />' 
END
		
SET @finalXml = '<Root>' + @responseInfoNode + CAST(@xmlDataNode AS NVARCHAR(MAX)) + '</Root>'

IF @ViewResultinTable = 0
BEGIN
SELECT CAST(@finalXml AS XML)
END
ELSE 
BEGIN
SELECT * FROM #BASE
END

END


DROP TABLE #BASE
DROP TABLE #PatronList
GO
