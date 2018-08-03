SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [rpt].[vw__Attendance_Summary]

AS (


SELECT SSB_CRMSYSTEM_CONTACT_ID
, CAST(Season_Name AS VARCHAR(50)) Season_Name
, COUNT(CASE WHEN Event_Date <= GETDATE() THEN Event_Code ELSE NULL END) Total_Available
, SUM(CAST(IsAttended AS INT)) Total_Attended
, ISNULL((CAST((SUM(CAST(IsAttended AS INT)) / CAST(NULLIF(COUNT(CASE WHEN Event_Date <= GETDATE() THEN Event_Code ELSE NULL END),0) AS float))*100 
				AS DECIMAL(18,1))),0) [Percent_Attended]
FROM (
		SELECT DimCustomer.SSB_CRMSYSTEM_CONTACT_ID
			  ,Season_Name
			  ,Event_Code
			  ,Event_Name
			  ,Event_Date
			  ,Event_Time
			  ,Section_Name
			  ,Row_Name
			  ,Seat
			  ,Scan_Time
			  ,Game_Scan_Time_Difference
			  ,Scan_Gate
			  ,IsAttended
		FROM (  SELECT tkSeatSeat.CUSTOMER
						, Season.NAME AS Season_Name
						, tkSeatSeat.Event AS Event_code
						, Event.NAME AS Event_Name
						, Event.DATE AS Event_Date
						, CASE WHEN Event.time = 'TBA' THEN '1900-01-01'
							   WHEN Event.TIME <> 'TBA' THEN CAST(Event.time AS TIME) END AS Event_Time
						, tkSeatSeat.SECTION AS Section_Name
						, tkSeatSeat.ROW AS Row_Name
						, tkSeatSeat.SEAT AS Seat
						, CAST(bc.SCAN_TIME AS TIME) Scan_Time
						, DATEDIFF(MINUTE,(CASE WHEN Event.time = 'TBA' THEN '1900-01-01'
											 WHEN Event.TIME <> 'TBA' THEN CAST(Event.time AS TIME) END),bc.SCAN_TIME) Game_Scan_Time_Difference
						, bc.SCAN_GATE AS Scan_Gate
						, CASE WHEN bc.ATTENDED = 'Y' THEN 1
									ELSE 0 END AS IsAttended
					FROM dbo.TK_SEAT_SEAT tkSeatSeat WITH (NOLOCK)
					JOIN dbo.TK_SEASON Season WITH (NOLOCK) ON Season.SEASON = tkSeatSeat.SEASON
					JOIN dbo.TK_EVENT Event WITH (NOLOCK) ON Event.SEASON = tkSeatSeat.SEASON AND Event.EVENT = tkSeatSeat.EVENT
					LEFT JOIN dbo.TK_BC bc (NOLOCK) ON bc.BC_ID = tkSeatSeat.BARCODE AND bc.SEASON = tkSeatSeat.SEASON
					WHERE Event.DATE <= CAST(GETDATE()+1 AS DATE)
							 )x
			  INNER JOIN [dbo].[vwDimCustomer_ModAcctId] DimCustomer WITH ( NOLOCK ) ON DimCustomer.SSID = x.CUSTOMER
																		   AND DimCustomer.SourceSystem = 'Paciolan'
) b

GROUP BY SSB_CRMSYSTEM_CONTACT_ID, CAST(Season_Name AS VARCHAR(50))

)
GO
