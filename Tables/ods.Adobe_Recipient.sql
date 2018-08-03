CREATE TABLE [ods].[Adobe_Recipient]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Adobe_Rec__ETL_C__46623E31] DEFAULT (getdate()),
[ETL_UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__Adobe_Rec__ETL_U__4756626A] DEFAULT (getdate()),
[ETL_IsDeleted] [bit] NOT NULL CONSTRAINT [DF__Adobe_Rec__ETL_I__484A86A3] DEFAULT ((0)),
[ETL_DeletedDate] [datetime] NULL,
[ETL_DeltaHashKey] [binary] (32) NULL,
[ETL_FileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrimaryKey] [int] NOT NULL,
[AccountId] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountType] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuburnAlumni_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Baseball_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BirthdayDay_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BirthdayMonth_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BusinessPhone] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CellPhone] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ClassOf_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Company] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreationDate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreationDate_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailOptOut_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Equestrian_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fax] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Football_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Golf_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Guid] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gymnastics_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HomePhone] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InternetProfile] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MensBasketball_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Linked] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PIN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Soccer_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Softball_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StubhubEmail] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SwimDive_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Tennis_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TrackField_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Volleyball_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WomensBasketball_Preferences] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Zip] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Donor] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DonorType] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriorityPoints] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [ods].[Adobe_Recipient] ADD CONSTRAINT [PK__Adobe_Re__A2D9E5641F8792BD] PRIMARY KEY CLUSTERED  ([PrimaryKey])
GO