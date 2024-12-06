CREATE TABLE [dbo].[Individual] (
    [EntityId]               INT                                         NOT NULL,
    [MLSID]                  SMALLINT                                    NULL,
    [IndividualGroupId]      UNIQUEIDENTIFIER                            NULL,
    [ParentEntityId]         INT                                         NULL,
    [UserName]               VARCHAR (200)                               NULL,
    [AspNetUserId]           NVARCHAR (450)                              NULL,
    [IndividualTypeId]       SMALLINT                                    NOT NULL,
    [IndividualStatusTypeId] SMALLINT                                    NOT NULL,
    [NamePrefix]             VARCHAR (10)                                NULL,
    [FirstName]              VARCHAR (100)                               NULL,
    [MiddleName]             VARCHAR (100)                               NULL,
    [LastName]               VARCHAR (100)                               NULL,
    [NameSuffix]             VARCHAR (10)                                NULL,
    [PreferredName]          VARCHAR (100)                               NULL,
    [JobTitle]               VARCHAR (200)                               NULL,
    [FlexId]                 VARCHAR (50)                                NULL,
    [NRDSId]                 VARCHAR (50)                                NULL,
    [PhotoURL]               VARCHAR (2000)                              NULL,
    [ComplianceStatusId]     SMALLINT                                    NULL,
	[URL]					 VARCHAR(1000)								 NULL,
	[LicenseNumber]			 VARCHAR(50)								 NULL,
    [SystemAccess]           BIT                                         NULL,
    [FbsBillable]            BIT                                         NULL,
    [MlsStatus]              BIT                                         NULL,
    [Active]                 BIT                                         NULL,
    [VisibleInLists]         BIT                                         NULL,
    [ActiveFrom]             DATETIME2 (7) GENERATED ALWAYS AS ROW START CONSTRAINT [DF__Individual_ActiveFrom] DEFAULT (getdate()) NOT NULL,
    [ActiveTo]               DATETIME2 (7) GENERATED ALWAYS AS ROW END   CONSTRAINT [DF__Individual_ActiveTo] DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    [SourceSystemId]         INT                                         NULL,
    [LastModifiedEntityId]   INT                                         NULL,
    [PaymentId] UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(), 
    CONSTRAINT [PK_Individual_EntityId] PRIMARY KEY CLUSTERED ([EntityId] ASC),
    CONSTRAINT [FK_SourceSystem_SourceSystemId] FOREIGN KEY ([SourceSystemId]) REFERENCES [dbo].[SourceSystem] ([SourceSystemId]),
    PERIOD FOR SYSTEM_TIME ([ActiveFrom], [ActiveTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[IndividualHistory], DATA_CONSISTENCY_CHECK=ON));

GO

CREATE INDEX IX_Individual_IndividualGroupId ON dbo.Individual([IndividualGroupId]) INCLUDE ([EntityId]);
GO
