SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







CREATE PROCEDURE [etl].[SFDC_Opportunity_Task_Pivot_DEV]

AS


BEGIN


	DROP TABLE [ODS].[SFDC_Opportunity_Task_Pivot]

	end
		

DROP TABLE #oppspivot

SELECT a.WhatId AS OpportunityId,
	   a.StageName,
	   a.xRank, 
	   a.[Type],
	   a.ActivityDate,
	   u.[Name] AS OwnerName,
	   opp.LeadSource
	   --ActivityDates
	   --Last Activity Date
INTO  #oppspivot
FROM [ro].[vw_prodcopy.Task] a
INNER JOIN [ro].[vw_prodcopy.Opportunity] opp 
	ON a.WhatId = opp.Id
INNER JOIN [ro].[vw_prodcopy.user] u
	ON opp.[OwnerId] = u.Id
WHERE 1=1
AND xRank < '26'





--AND a.DimCustomerId = '938587'



        DECLARE @cols AS NVARCHAR(MAX)
              , @query AS NVARCHAR(MAX)

        SELECT @cols = STUFF((   SELECT   ',' + QUOTENAME(xRank)
                                 FROM     #oppspivot
                                 GROUP BY xRank
                                 ORDER BY xRank
                                 FOR XML PATH(''), TYPE
                             ).value('.', 'NVARCHAR(MAX)')
                           , 1
                           , 1
                           , ''
                            )
		

        SET @query = 'SELECT      OpportunityId
								, StageName
								, OwnerName
								, LeadSource
								,' + @cols + ' 
					  INTO [ODS].[SFDC_Opportunity_Task_Pivot]
					  FROM 
					 (
						SELECT OpportunityId
								, StageName
								, OwnerName
								, LeadSource
								, xRank
								, [Type]
						FROM #oppspivot
					) x
					PIVOT 
					(
						Min([Type])
						FOR xRank IN (' + @cols + ')
					) p'



        EXECUTE ( @query )




 --   END






--SELECT * FROM [ODS].[SFDC_Opportunity_Task_Pivot]

GO
