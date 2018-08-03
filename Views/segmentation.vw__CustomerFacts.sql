SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [segmentation].[vw__CustomerFacts] 
AS
    ( SELECT  dc.SSB_CRMSYSTEM_CONTACT_ID
			, fb.I_MARK AS F17_IMARK
			, ats.Percent_Attended AS F17_PercentAttended
			, ISNULL(tx.Tickets_Total_Paid, 0) AS Tickets_TotalSpent_All
			, ISNULL(DATEDIFF(DAY, tx.Tickets_First_Purchase_Date, GETDATE()), 100000) AS Tickets_DaysSince_First
			, ISNULL(DATEDIFF(DAY, tx.Tickets_Last_Purchase_Date, GETDATE()), 100000) AS Tickets_DaysSince_Last
			, ISNULL(DATEDIFF(DAY, ad.First_Donation_Date, GETDATE()), 100000) AS Donation_DaysSince_First
			, ISNULL(DATEDIFF(DAY, ad.Last_Donation_Date, GETDATE()), 100000) AS Donation_DaysSince_Last
			, ISNULL(ad.First_Donation_Amount,0) AS Donation_FirstAmount
			, ISNULL(ad.Max_Donation_Amt,0)		 AS Donation_LargestAmt
			, ISNULL(ad.Total_Donation_Amt,0)	 AS Donation_TotalSpent_All
			, ISNULL(ad.Annual_Donation_Amt,0)	 AS Donation_TotalSpent_365Days
			, ISNULL(DATEDIFF(DAY, adobe.AdobeLastOpenDate, GETDATE()), 100000) AS Email_DaysSince_LastOpen

      FROM     [dbo].[vwCompositeRecord_ModAcctID]  dc
	   LEFT JOIN (SELECT DISTINCT SSB_CRMSYSTEM_CONTACT_ID
				, SUM(I_PAY) Tickets_Total_Paid
				, CAST(MAX(I_DATE) AS DATE) Tickets_Last_Purchase_Date
				, CAST(MIN(I_DATE) AS DATE) Tickets_First_Purchase_Date
				FROM TK_ODET tko (NOLOCK)
				 INNER JOIN [dbo].[vwDimCustomer_ModAcctId] dc ON dc.SourceSystem = 'Paciolan' AND dc.ssid = tko.CUSTOMER
				 GROUP BY SSB_CRMSYSTEM_CONTACT_ID
				 ) tx ON tx.[SSB_CRMSYSTEM_CONTACT_ID]= dc.[SSB_CRMSYSTEM_CONTACT_ID] 
	
	  LEFT JOIN (SELECT DISTINCT SSB_CRMSYSTEM_CONTACT_ID
				, odet.I_DATE
				, odet.I_MARK
				 ,ROW_NUMBER() OVER (PARTITION BY dc.SSB_CRMSYSTEM_CONTACT_ID ORDER BY odet.I_DATE DESC) RN
				 FROM dbo.TK_ODET odet (NOLOCK)
				 INNER JOIN dbo.TK_ITEM i (NOLOCK) ON i.SEASON = odet.SEASON AND i.ITEM = odet.ITEM
				 INNER JOIN [dbo].[vwDimCustomer_ModAcctId] dc ON dc.SourceSystem = 'Paciolan' AND dc.ssid = odet.CUSTOMER
				 WHERE odet.Season = 'F17' 
				 AND i.CLASS = 'S'
				 AND odet.I_MARK LIKE 'ASPIRE%'
				 ) fb ON fb.[SSB_CRMSYSTEM_CONTACT_ID]= dc.[SSB_CRMSYSTEM_CONTACT_ID] AND fb.RN = '1'
	 LEFT JOIN (SELECT SSB_CRMSYSTEM_CONTACT_ID, Season_Name, Percent_Attended 
				FROM [rpt].[vw__Attendance_Summary] 
				WHERE Season_Name = 'Football 2017'
				) ats ON ats.SSB_CRMSYSTEM_CONTACT_ID = dc.SSB_CRMSYSTEM_CONTACT_ID
	LEFT JOIN
     (
          SELECT
                SSB_CRMSYSTEM_CONTACT_ID,
                CAST(MAX([LogDate]) AS DATE) AdobeLastOpenDate
          FROM  [ro].[vw_Adobe_TrackingLog] tl
          WHERE URLType = 'Open'
          GROUP BY SSB_CRMSYSTEM_CONTACT_ID
     ) adobe
	  ON adobe.[SSB_CRMSYSTEM_CONTACT_ID] = dc.[SSB_CRMSYSTEM_CONTACT_ID]


	LEFT JOIN
     (
          SELECT
                a.SSB_CRMSYSTEM_CONTACT_ID,
                MIN([DATE]) AS First_Donation_Date,
                MAX([DATE]) AS Last_Donation_Date,
                MAX(ISNULL(CASH_AMT, 0)) AS Max_Donation_Amt,
                SUM(ISNULL(a.CASH_AMT, 0)) AS Total_Donation_Amt,
                SUM(ISNULL(    CASE
                                    WHEN fd.SSB_CRMSYSTEM_CONTACT_ID IS NOT NULL THEN a.CASH_AMT
                                    END, 0
                          )
                   ) AS [First_Donation_Amount],
                SUM(ISNULL(    CASE
                                    WHEN YEAR(a.DATE) = YEAR(GETDATE()) THEN a.CASH_AMT
                                    END, 0
                          )
                   ) AS Annual_Donation_Amt
          FROM  ro.vw__Donation_Detail a
          LEFT OUTER JOIN
               (
                    SELECT
                            SSB_CRMSYSTEM_CONTACT_ID,
                            MIN(TRANS_NO) AS TRANS_NO
                    FROM    ro.vw__Donation_Detail a
                    WHERE   CASH_AMT > 0
                    GROUP BY
                            SSB_CRMSYSTEM_CONTACT_ID
               ) fd
               ON a.SSB_CRMSYSTEM_CONTACT_ID = fd.SSB_CRMSYSTEM_CONTACT_ID
                  AND   a.TRANS_NO = fd.TRANS_NO
          WHERE a.CASH_AMT > 0
          GROUP BY
                a.SSB_CRMSYSTEM_CONTACT_ID
     ) ad
     ON ad.[SSB_CRMSYSTEM_CONTACT_ID] = dc.[SSB_CRMSYSTEM_CONTACT_ID]
	 
	 WHERE tx.Tickets_Last_Purchase_Date IS NOT NULL
	 OR fb.I_MARK IS NOT NULL 
	 OR ats.Percent_Attended IS NOT NULL
	 OR adobe.AdobeLastOpenDate IS NOT NULL
	 OR First_Donation_Date IS NOT NULL


	 )


GO
