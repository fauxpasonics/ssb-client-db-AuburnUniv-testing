SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




/*********

Reviewed by Scott Sales 2018-06-14  Ran with  @SSB_CRMSYSTEM_CONTACT_ID VARCHAR(50) = 4D3DC380-FC5E-426B-B788-548C03F4A69C with no issues



*************/





CREATE PROCEDURE [api].[CRM_GetAccountSECSurveySummary]
 @SSB_CRMSYSTEM_ACCT_ID VARCHAR(50) = 'Test',
 @SSB_CRMSYSTEM_CONTACT_ID VARCHAR(50) = 'Test',
	@DisplayTable INT = 0,
	@RowsPerPage  INT = 500, @PageNumber   INT = 0
AS
    BEGIN 

-- Init vars needed for API
DECLARE @totalCount         INT,
		@xmlDataNode        XML,
		@recordsInResponse  INT,
		@remainingCount     INT,
		@rootNodeName       NVARCHAR(100),
		@responseInfoNode   NVARCHAR(MAX),
		@finalXml           XML


--DECLARE @SSB_CRMSYSTEM_ACCT_ID VARCHAR(50) = 'None'
--DECLARE @SSB_CRMSYSTEM_CONTACT_ID VARCHAR(50) = '659223BA-A800-49AA-8BD4-43D0F524633A'
--DECLARE	@RowsPerPage  INT = 500, @PageNumber   INT = 0
--DECLARE @DisplayTable INT = 0



--PRINT 'Acct-' + @SSB_CRMSYSTEM_ACCT_ID
--PRINT 'Contact-' + @SSB_CRMSYSTEM_CONTACT_ID

DECLARE @GUIDTable TABLE (
GUID VARCHAR(50)
)

IF (@SSB_CRMSYSTEM_ACCT_ID NOT IN ('None','Test'))
BEGIN
	INSERT INTO @GUIDTable
	        ( GUID )
	SELECT DISTINCT dc.SSB_CRMSYSTEM_ACCT_ID
		FROM dbo.vwDimCustomer_ModAcctId dc
		WHERE dc.SSB_CRMSYSTEM_ACCT_ID = @SSB_CRMSYSTEM_ACCT_ID
END

IF (@SSB_CRMSYSTEM_CONTACT_ID NOT IN ('None','Test'))
BEGIN
	INSERT INTO @GUIDTable
	        ( GUID )
	SELECT @SSB_CRMSYSTEM_CONTACT_ID
	FROM dbo.vwDimCustomer_ModAcctId dc
	WHERE dc.SSB_CRMSYSTEM_CONTACT_ID = @SSB_CRMSYSTEM_CONTACT_ID
END



SELECT  emails.SSB_CRMSYSTEM_CONTACT_ID
, sr.Email
, sr.SportName
, sr.SurveyYear
, sr.Question
, sr.Answer
, sr.Gap
INTO  #tmpBase
FROM SEC.[auburn].[SECSurveySummary_Results] sr (NOLOCK)
INNER JOIN (select distinct SSB_CRMSYSTEM_CONTACT_ID, EmailPrimary
		    FROM [dbo].[vwDimCustomer_ModAcctId]
		    WHERE EmailPrimary <> ' '
		   ) emails ON sr.Email = emails.EmailPrimary
WHERE  emails.EmailPrimary IN (SELECT GUID FROM @GUIDTable)



SELECT 
 ISNULL(Email					,'')	Email
, ISNULL(SportName				,'')	SportName
, ISNULL(SurveyYear				,'')	SurveyYear
, ISNULL(Question				,'')	Question
, ISNULL(Answer					,'')	Gap
--, ISNULL(CAST(SSB_CRMSYSTEM_CONTACT_ID AS VARCHAR(50))		 		,'')	SSB_CRMSYSTEM_ACCT_ID

INTO #tmpOutput
FROM #tmpBase
ORDER BY SurveyYear, SportName DESC
OFFSET (@PageNumber) * @RowsPerPage ROWS
FETCH NEXT @RowsPerPage ROWS ONLY


-- Pull counts
SELECT @recordsInResponse = COUNT(*) FROM #tmpOutput
SELECT @totalCount = COUNT(*) FROM #tmpBase

SET @xmlDataNode = (
		SELECT * FROM #tmpOutput
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

	PRINT @responseInfoNode
	
-- Wrap response info and data, then return	
IF @xmlDataNode IS NULL
BEGIN
	SET @xmlDataNode = '<' + @rootNodeName + ' />' 
END
		
SET @finalXml = '<Root>' + @responseInfoNode + CAST(@xmlDataNode AS NVARCHAR(MAX)) + '</Root>'

IF @DisplayTable = 1
SELECT * FROM #tmpBase

IF @DisplayTable = 0
SELECT CAST(@finalXml AS XML)

DROP TABLE #tmpBase
DROP TABLE #tmpOutput

 END


GO
