SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




-- =============================================
-- Author:		<Abbey Meitin>
-- Create date: <4/26/2017>
-- Description:	<Created view to use in MDM Primary record selection>
-- =============================================




CREATE VIEW [etl].[vw_MDM_Custom_Rules] AS
(
SELECT  PATRON ,
        QTY ,
		TRANS ,
		SH
FROM    dbo.PD_PATRON p WITH (NOLOCK)

LEFT JOIN ( SELECT  detail.CUSTOMER
					 , COUNT(DISTINCT detail.TIX) AS QTY
			FROM    ( SELECT  DISTINCT CUSTOMER
							, o.SEASON TIX
						 FROM      TK_ODET o WITH ( NOLOCK )
			UNION ALL
						 SELECT  DISTINCT
								   DONOR AS CUSTOMER
								 , o.DRIVE TIX
						 FROM      FD_DONATION o WITH ( NOLOCK )
					   ) detail
			GROUP BY detail.CUSTOMER
           ) QTY ON p.PATRON = QTY.CUSTOMER
LEFT JOIN ( SELECT  detail.CUSTOMER
					 , MAX(I_DATE) AS TRANS
			FROM    ( SELECT  DISTINCT CUSTOMER
							, MAX(I_DATE) AS I_DATE
						 FROM      TK_ODET o WITH ( NOLOCK )
						 GROUP BY o.CUSTOMER
			UNION ALL
						 SELECT  DISTINCT
								   DONOR AS CUSTOMER
								 , MAX(o.DATE) AS I_DATE
						 FROM      FD_DONATION o WITH ( NOLOCK )
						 GROUP BY o.DONOR
					   ) detail
			GROUP BY detail.CUSTOMER
           ) TRANS ON p.PATRON = TRANS.CUSTOMER

LEFT JOIN ( SELECT  CUSTOMER
					 , CASE WHEN o.TYPE = 'SH' THEN 1 ELSE 0 END AS SH
		    FROM      TK_CUSTOMER o WITH ( NOLOCK )

           ) SH ON p.PATRON = SH.CUSTOMER

)


GO
