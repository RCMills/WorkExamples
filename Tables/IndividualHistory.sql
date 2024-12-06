CREATE TABLE [dbo].[IndividualHistory] (
    [EntityId]               INT              NOT NULL,
    [MLSID]                  SMALLINT         NULL,
    [IndividualGroupId]      UNIQUEIDENTIFIER NULL,
    [ParentEntityId]         INT              NULL,
    [UserName]               VARCHAR (200)    NULL,
    [AspNetUserId]           NVARCHAR (450)   NULL,
    [IndividualTypeId]       SMALLINT         NOT NULL,
    [IndividualStatusTypeId] SMALLINT         NOT NULL,
    [NamePrefix]             VARCHAR (10)     NULL,
    [FirstName]              VARCHAR (100)    NULL,
    [MiddleName]             VARCHAR (100)    NULL,
    [LastName]               VARCHAR (100)    NULL,
    [NameSuffix]             VARCHAR (10)     NULL,
    [PreferredName]          VARCHAR (100)    NULL,
    [JobTitle]               VARCHAR (200)    NULL,
    [FlexId]                 VARCHAR (50)     NULL,
    [NRDSId]                 VARCHAR (50)     NULL,
    [PhotoURL]               VARCHAR (2000)   NULL,
    [ComplianceStatusId]     SMALLINT         NULL,
	[URL]					 VARCHAR(1000)	  NULL,
	[LicenseNumber]			 VARCHAR(50)	  NULL,
    [SystemAccess]           BIT              NULL,
    [FbsBillable]            BIT              NULL,
    [MlsStatus]              BIT              NULL,
    [Active]                 BIT              NULL,
    [VisibleInLists]         BIT              NULL,
    [ActiveFrom]             DATETIME2 (7)    NOT NULL,
    [ActiveTo]               DATETIME2 (7)    NOT NULL,
    [SourceSystemId]         INT              NULL,
    [LastModifiedEntityId]   INT              NULL, 
    [PaymentId] UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
	
	
);


GO
CREATE CLUSTERED INDEX [ix_IndividualHistory]
    ON [dbo].[IndividualHistory]([ActiveTo] ASC, [ActiveFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

