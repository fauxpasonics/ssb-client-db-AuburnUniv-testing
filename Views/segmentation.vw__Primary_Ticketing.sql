SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO













CREATE VIEW [segmentation].[vw__Primary_Ticketing]
AS (
				  SELECT    rb.SEASON SeasonCode
                          , Season.SeasonFullName
						  , SSBID.SSB_CRMSYSTEM_CONTACT_ID
                          , rb.CUSTOMER
                          , rb.ITEM ItemCode
                          , Item.ItemFullName
                          , rb.I_PT PriceTypeCode
                          , PT.PriceTypeFullName
                          , rb.E_PL PriceLevelCode
                          , PRLev.PL_NAME PriceLevelFullName
                          , rb.I_PRICE Price
                          --, rb.I_DAMT
                          , rb.ORDQTY OrdQty
                          , rb.ORDTOTAL OrdTotal
                          , rb.PAIDTOTAL PaidTotal
                          , rb.MINPAYMENTDATE
						  , CASE WHEN Item.ItemClassCode = 'MP' --added 10/16/2017
							THEN 'Mini Pack' 
						WHEN Item.ItemClassCode = 'S' -- Season Ticket - All Sports except Football
							AND rb.I_PT NOT IN ('APK', 'BRV', 'BRVC', 'CPK', 'ERV', 'ERVC', 'PK', 'SRV', 'SRVC')--Football
							THEN 'Season Ticket'
						WHEN Season.SeasonCode LIKE 'F1%' AND Item.ItemCode LIKE '[0-9][0-8]' AND Item.ItemCode <> '20' --Football
							THEN 'Single Game Ticket'
						WHEN Season.SeasonCode LIKE 'SB1%' AND ISNUMERIC(Item.ItemCode) = 1  --Softball
							THEN 'Single Game Ticket'
						WHEN Season.SeasonCode LIKE 'BB1%' AND ISNUMERIC(Item.ItemCode) = 1  --Baseball
							THEN 'Single Game Ticket'
						WHEN Season.SeasonCode LIKE 'B1%' AND ItemClassCode = 'SIN' --Men's Basketball
							THEN 'Single Game Ticket'
						WHEN Season.SeasonCode LIKE 'W1%' AND ISNUMERIC(Item.ItemCode) = 1 AND Item.ItemCode NOT IN ('2016', '2017') --Women's Basketball
							THEN 'Single Game Ticket'
						WHEN Season.SeasonCode LIKE 'G%' AND ISNUMERIC(Item.ItemCode) = 1  --Gymnastics
							THEN 'Single Game Ticket'
						WHEN Item.ItemClassCode = 'PS'  --Item Class PostSeason
							THEN 'Postseason'
						WHEN Season.SeasonCode LIKE 'SB1%' AND (Item.ItemCode LIKE 'REGIONAL%' OR Item.ItemCode LIKE 'SUPER%')  --Softball
							THEN 'Postseason'
						WHEN Season.SeasonCode LIKE 'BB1%' AND (Item.ItemCode = 'REG' OR Item.ItemCode = 'SGSEC')  --Baseball
							THEN 'Postseason'
						WHEN Season.SeasonCode LIKE 'W1%' AND (Item.ItemCode = 'SEC')  --Women's Basketball Postseason
							THEN 'Postseason'
						WHEN ItemClassCode IN ('M', 'F', 'SF') THEN 'Miscellaneous' --Item Class Miscellaneous
						WHEN ItemClassCode IN ('P', 'PI') THEN 'Parking'
						WHEN ItemClassCode = 'A' THEN 'Away Game'
						WHEN ItemClassCode = 'N' THEN 'Neutral Site'
						WHEN ItemClassCode = 'STUB' THEN 'StubHub'
						WHEN ItemClassCode = 'B' THEN 'Ballena'
						WHEN ItemClassCode = 'PH' THEN 'Placeholder'
						WHEN ItemClassCode = 'D' THEN 'Deposit'
						ELSE NULL END AS TicketTypeClass
				--TicketTypeName
				, CASE WHEN Item.ItemClassCode = 'MP' --added 10/16/2017
							THEN 'Mini Pack'
					WHEN Season.SeasonCode LIKE 'F1%' --Football Suite
							AND (Item.ItemClassCode = 'S' OR Item.ItemCode = 'FS')
							AND rb.I_PT IN ('BC', 'SR', 'SU') THEN 'Suite'
						WHEN Season.SeasonCode LIKE 'F1%' --Football Premium
							AND (Item.ItemClassCode = 'S' OR Item.ItemCode = 'FS')
							AND rb.I_PT = 'SC'  THEN 'Premium'
						WHEN Season.Seasoncode LIKE 'B1%' --Men's Basketball Premium
							AND Item.ItemClassCode = 'S'
							AND rb.I_PT IN ('AC', 'ACH', 'BL', 'CS', 'LC', 'MC', 'SC', 'FX') THEN 'Premium'
						WHEN Season.SeasonCode LIKE 'F1%' --Football Faculty
							AND rb.I_PT = 'F'  THEN 'Faculty'
						WHEN Season.Seasoncode LIKE 'B1%' --Men's Basketball Faculty
							AND Item.ItemClassCode = 'S'
							AND rb.I_PT IN ('F280', 'F175') THEN 'Faculty'
						WHEN Season.SeasonCode LIKE 'F1%' --Football Zone
							AND (Item.ItemClassCode = 'S' OR Item.ItemCode = 'FS')
							AND rb.I_PT IN ('BL', 'G', 'GLD', 'OR', 'YA')  THEN 'Zone'
						WHEN Season.Seasoncode LIKE 'B1%' -- Men's Basketball zone
							AND Item.ItemClassCode = 'S'
							AND rb.I_PT IN ('T225', 'T300', 'T350', 'TE350', 'TS350', 'GLD', 'OR', 'B', 'G', 'T250', 'T175') THEN 'Zone'
						
						WHEN Season.SeasonCode LIKE 'F1%' --Football Public
							AND (Item.ItemClassCode = 'S' OR Item.ItemCode = 'FS')
							AND rb.I_PT = 'P'  THEN 'Public'

						WHEN Season.Seasoncode LIKE 'B1%' -- Men's Basketball Public
							AND Item.ItemClassCode = 'S'
							AND rb.I_PT IN ('P225', 'P300', 'P350', 'P', 'P250', 'P175') THEN 'Public'
						
						WHEN Season.SeasonCode LIKE 'F1%' --Football Misc
							AND (Item.ItemClassCode = 'S' OR Item.ItemCode = 'FS')
							AND rb.I_PT NOT IN ('P','BC', 'SR', 'SU','SC','F','BL', 'G','GLD', 'OR', 'YA', 'APK', 'BRV', 'BRVC', 'CPK', 'ERV', 'ERVC', 'PK', 'SRV', 'SRVC', 'ASC', 'C', 'CD', 'IC', 'CU') 
							THEN 'Miscellaneous'
						
						WHEN Season.Seasoncode LIKE 'B1%' -- Men's Basketball Misc
							AND Item.ItemClassCode = 'S'
							AND rb.I_PT IN ('L300', 'T', 'A', 'LMAN', 'L250') THEN 'Miscellaneous'
						--Comp
						WHEN ((PT.PriceTypeFullName LIKE '%Comp%' OR PT.PriceTypeFullName = 'Comp') AND item.ItemCode <> '20') OR rb.I_PT IN ('CD', 'RD', 'KC') OR ((Season.SeasonCode LIKE 'F1%' OR Season.SeasonCode like 'B1%') AND ISNUMERIC(Item.ItemCode) = 1 AND rb.I_PT IN ('FA', 'M', 'SC', 'R'))
							THEN 'Comp'
						--Chairback
						WHEN (Season.SeasonCode LIKE 'F1%' AND Item.ItemCode = '20')
							THEN 'Chairback'
						--Student Fee
						WHEN ItemClassCode = 'SF' 
							THEN 'Student Card Fee'
						--Processing Fee
						WHEN ItemClassCode = 'F' 
							THEN 'Processing Fee'
						-- Student Ticket
						WHEN ISNUMERIC(Item.ItemCode) = 1  
							AND PriceTypeFullName LIKE '%Student%'
							THEN 'Student'
						-- Season Ticket - All Sports except Football & MBB
						WHEN (Season.SeasonCode NOT LIKE 'F1%' OR Season.SeasonCode NOT LIKE 'B1%') 
							AND Item.ItemClassCode = 'S'
							THEN 'Season Ticket'
						--All Sports Visitor
						WHEN PT.PriceTypeCode LIKE 'V%' 
							THEN 'Visitor Ticket'
						--All Sports ReplyBuy
						WHEN PT.PriceTypeFullName LIKE 'ReplyBuy%' 
							THEN 'ReplyBuy Ticket'
						--Football Group Tickets
						WHEN Season.SeasonCode LIKE 'F1%' AND Item.ItemCode LIKE '[0-9][0-8]' AND Item.ItemCode <> '20' 
							AND PT.PriceTypeCode LIKE 'G%' 
							THEN 'Group Ticket'
						--Mens Basketball Group Tickets
						WHEN Season.SeasonCode LIKE 'B1%' 
							AND ISNUMERIC(Item.ItemCode) = 1
							AND PT.PriceTypeCode LIKE 'GR%'  
							THEN 'Group Ticket'
						--Softball Group Tickets
						WHEN Season.SeasonCode LIKE 'SB1%' 
							AND ISNUMERIC(Item.ItemCode) = 1
							AND PT.PriceTypeCode LIKE 'GR%'  
							THEN 'Group Ticket'
						--Baseball Group Tickets
						WHEN Season.SeasonCode LIKE 'BB1%' 
							AND ISNUMERIC(Item.ItemCode) = 1
							AND PT.PriceTypeCode LIKE 'GR%'  
							THEN 'Group Ticket'
						--Women's Basketball Group Tickets
						WHEN Season.SeasonCode LIKE 'W1%' 
							AND ISNUMERIC(Item.ItemCode) = 1
							AND PT.PriceTypeCode LIKE 'GR%' 
							THEN 'Group Ticket'
						--Gymnastics Group Tickets
						WHEN Season.SeasonCode LIKE 'G1%' 
							AND ISNUMERIC(Item.ItemCode) = 1
							AND PT.PriceTypeCode LIKE 'GR%' 
							THEN 'Group Ticket'
						--Football Public Tickets
						WHEN Season.SeasonCode LIKE 'F1%' AND Item.ItemCode LIKE '[0-9][0-8]' AND Item.ItemCode <> '20' 
							AND PT.PriceTypeCode NOT LIKE 'G%' 
							AND PT.PriceTypeCode NOT LIKE 'V%' 
							AND PT.PriceTypeFullName NOT LIKE 'ReplyBuy%' 
							AND PT.PriceTypeFullName NOT LIKE '%Student%'
							AND rb.I_PRICE > 0
							THEN 'Public Ticket'
						---Softball Public Tickets
						WHEN Season.SeasonCode LIKE 'SB1%' 
							AND ISNUMERIC(Item.ItemCode) = 1
							AND PT.PriceTypeCode NOT LIKE 'GR%'
							AND PT.PriceTypeCode NOT LIKE 'V%'
							AND PT.PriceTypeFullName NOT LIKE 'ReplyBuy%'
							AND PT.PriceTypeFullName NOT LIKE '%Student%' 
							AND rb.I_PRICE > 0
							THEN 'Public Ticket'
						--Men's Basketball Public Tickets
						WHEN Season.SeasonCode LIKE 'B1%' 
							AND ItemClassCode = 'SIN'
							AND PT.PriceTypeCode NOT LIKE 'V%'
							AND PT.PriceTypeFullName NOT LIKE 'ReplyBuy%' 
							AND PT.PriceTypeFullName NOT LIKE '%Student%'
							AND Item.ItemCode <> '2016'
							AND rb.I_PRICE > 0
							THEN 'Public Ticket'
						---Baseball Public Tickets
						WHEN Season.SeasonCode LIKE 'BB1%' 
							AND ISNUMERIC(Item.ItemCode) = 1
							AND PT.PriceTypeCode NOT LIKE 'GR%'
							AND PT.PriceTypeCode NOT LIKE 'V%'
							AND PT.PriceTypeFullName NOT LIKE 'ReplyBuy%' 
							AND PT.PriceTypeFullName NOT LIKE '%Student%'
							AND rb.I_PRICE > 0
							THEN 'Public Ticket'
						---Women's Basketball Public Tickets
						WHEN Season.SeasonCode LIKE 'W1%' 
							AND ISNUMERIC(Item.ItemCode) = 1
							AND PT.PriceTypeCode NOT LIKE 'GR%'
							AND PT.PriceTypeCode NOT LIKE 'V%'
							AND PT.PriceTypeFullName NOT LIKE 'ReplyBuy%' 
							AND PT.PriceTypeFullName NOT LIKE '%Student%'
							AND Item.ItemCode <> '2016'
							AND rb.I_PRICE > 0
							THEN 'Public Ticket'
					 ---Gymnastics Public Tickets
						WHEN Season.SeasonCode LIKE 'G1%' 
							AND ISNUMERIC(Item.ItemCode) = 1
							AND PT.PriceTypeCode NOT LIKE 'GR%'
							AND PT.PriceTypeCode NOT LIKE 'V%'
							AND PT.PriceTypeFullName NOT LIKE 'ReplyBuy%' 
							AND PT.PriceTypeFullName NOT LIKE '%Student%'
							AND rb.I_PRICE > 0
							THEN 'Public Ticket'
						--Item Class Code Posteason
						WHEN Item.ItemClassCode = 'PS' 
							THEN 'Postseason'
						WHEN Season.SeasonCode LIKE 'SB1%' 
							AND (Item.ItemCode LIKE 'REGIONAL%' OR Item.ItemCode LIKE 'SUPER%' OR Item.ItemCode LIKE 'NCAA%')  --Softball Postseason
							THEN 'Postseason'
						WHEN Season.SeasonCode LIKE 'BB1%' AND (Item.ItemCode = 'REG' OR Item.ItemCode = 'SGSEC')  --Baseball
							THEN 'Postseason'
						WHEN Season.SeasonCode LIKE 'W1%' AND (Item.ItemCode = 'SEC')  --Women's Basketball Postseason
							THEN 'Postseason'
						--Item Class Miscellaneous
						WHEN ItemClassCode = 'M' THEN 'Miscellaneous' 
						WHEN ItemClassCode IN ('P', 'PI') THEN 'Parking'
						WHEN ItemClassCode = 'A' THEN 'Away Game'
						WHEN ItemClassCode = 'N' THEN 'Neutral Site'
						WHEN ItemClassCode = 'STUB' THEN 'StubHub'
						WHEN ItemClassCode = 'B' THEN 'Ballena'
						WHEN ItemClassCode = 'PH' THEN 'Placeholder'
						WHEN ItemClassCode = 'D' THEN 'Deposit'
						ELSE NULL END AS TicketTypeName
                  FROM      dbo.vwTIReportBase rb WITH (NOLOCK)
							INNER JOIN [ro].[vTK_Season] Season ON Season.SeasonCode COLLATE SQL_Latin1_General_CP1_CI_AS = rb.SEASON
                            LEFT JOIN [ro].[vTK_Item] Item ON Item.ItemCode COLLATE SQL_Latin1_General_CP1_CI_AS = rb.ITEM
                                                          AND Item.SeasonCode COLLATE SQL_Latin1_General_CP1_CI_AS = rb.SEASON
                            LEFT JOIN [ro].[vTK_PrType] PT ON PT.SeasonCode COLLATE SQL_Latin1_General_CP1_CI_AS = Item.SeasonCode
															AND PT.PriceTypeCode COLLATE SQL_Latin1_General_CP1_CI_AS = rb.I_PT
                           LEFT JOIN dbo.TK_PTABLE_PRLEV PRLev WITH (NOLOCK) ON PRLev.SEASON COLLATE SQL_Latin1_General_CP1_CI_AS = rb.SEASON
                                                              AND PRLev.PTABLE COLLATE SQL_Latin1_General_CP1_CI_AS = rb.ITEM
                                                              AND PRLev.PL COLLATE SQL_Latin1_General_CP1_CI_AS = rb.E_PL
							INNER JOIN dbo.dimcustomerssbid SSBID WITH (NOLOCK) 
									  ON SSBID.SSID COLLATE SQL_Latin1_General_CP1_CS_AS 
											= rb.CUSTOMER COLLATE SQL_Latin1_General_CP1_CS_AS  
										 AND SSBID.SourceSystem = 'Paciolan'
                  WHERE    CAST(RIGHT(rb.SEASON,2) AS INT)	--WE WILL NEED TO KEEP AN EYE OUT FOR THIS IN THE FUTURE SO AS NOT 
						    >= RIGHT(DATEPART(YEAR,GETDATE()),2)-4	--TO BREAK THE VIEW


)            








GO
