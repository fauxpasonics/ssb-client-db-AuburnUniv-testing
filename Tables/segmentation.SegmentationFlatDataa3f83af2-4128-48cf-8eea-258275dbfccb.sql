CREATE TABLE [segmentation].[SegmentationFlatDataa3f83af2-4128-48cf-8eea-258275dbfccb]
(
[id] [uniqueidentifier] NOT NULL,
[DocumentType] [varchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[F17_IMARK] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[F17_PercentAttended] [decimal] (18, 1) NULL,
[Tickets_TotalSpent_All] [numeric] (38, 2) NOT NULL,
[Tickets_DaysSince_First] [int] NOT NULL,
[Tickets_DaysSince_Last] [int] NOT NULL,
[Donation_DaysSince_First] [int] NOT NULL,
[Donation_DaysSince_Last] [int] NOT NULL,
[Donation_FirstAmount] [numeric] (38, 2) NOT NULL,
[Donation_LargestAmt] [numeric] (38, 2) NOT NULL,
[Donation_TotalSpent_All] [numeric] (38, 2) NOT NULL,
[Donation_TotalSpent_365Days] [numeric] (38, 2) NOT NULL,
[Email_DaysSince_LastOpen] [int] NOT NULL
)
GO
ALTER TABLE [segmentation].[SegmentationFlatDataa3f83af2-4128-48cf-8eea-258275dbfccb] ADD CONSTRAINT [pk_SegmentationFlatDataa3f83af2-4128-48cf-8eea-258275dbfccb] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatDataa3f83af2-4128-48cf-8eea-258275dbfccb] ON [segmentation].[SegmentationFlatDataa3f83af2-4128-48cf-8eea-258275dbfccb] ([_rn])
GO
