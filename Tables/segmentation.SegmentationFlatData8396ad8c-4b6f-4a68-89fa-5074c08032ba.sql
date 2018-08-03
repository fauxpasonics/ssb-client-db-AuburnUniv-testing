CREATE TABLE [segmentation].[SegmentationFlatData8396ad8c-4b6f-4a68-89fa-5074c08032ba]
(
[id] [uniqueidentifier] NOT NULL,
[DocumentType] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AcctId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NULL,
[CreatedById] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedByName] [nvarchar] (121) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedDate] [datetime] NULL,
[LastModifiedById] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OwnerId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OwnerName] [nvarchar] (121) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastActivityDate] [date] NULL,
[DaysSinceLastActivity] [int] NULL,
[HasOpenOpportunity] [datetime] NULL,
[LastOpportunityCreatedDate] [datetime] NULL,
[LastOpportunityOwnerName] [nvarchar] (121) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastOpportunityLastModifiedDate] [datetime] NULL,
[LastOpportunityClosedWonDate] [datetime] NULL,
[LastOpportunityClosedLostReason] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsBusiness] [int] NULL
)
GO
ALTER TABLE [segmentation].[SegmentationFlatData8396ad8c-4b6f-4a68-89fa-5074c08032ba] ADD CONSTRAINT [pk_SegmentationFlatData8396ad8c-4b6f-4a68-89fa-5074c08032ba] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData8396ad8c-4b6f-4a68-89fa-5074c08032ba] ON [segmentation].[SegmentationFlatData8396ad8c-4b6f-4a68-89fa-5074c08032ba] ([_rn])
GO
