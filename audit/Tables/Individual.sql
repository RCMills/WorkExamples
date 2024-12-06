CREATE TABLE [audit].[Individual] (
    [Id]                             INT            IDENTITY (1, 1) NOT NULL,
    [insertedEntityId]               INT            NULL,
    [insertedUserName]               VARCHAR (200)  NULL,
    [insertedMlsId]                  INT            NULL,
    [insertedParentEntityId]         INT            NULL,
    [insertedIndividualTypeId]       INT            NULL,
    [insertedIndividualStatusTypeId] INT            NULL,
    [insertedFirstName]              VARCHAR (50)   NULL,
    [insertedMiddleName]             VARCHAR (50)   NULL,
    [insertedLastName]               VARCHAR (50)   NULL,
    [insertedPreferredName]          VARCHAR (100)  NULL,
    [insertedFlexId]                 VARCHAR (40)   NULL,
    [insertedNRDSID]                 INT            NULL,
    [insertedPhotoURL]               VARCHAR (2000) NULL,
    [insertedSystemAccess]           BIT            NULL,
    [insertedFbsBillable]            BIT            NULL,
    [insertedMlsStatus]              BIT            NULL,
    [insertedActive]                 BIT            NULL,
    [insertedVisibleInLists]         BIT            NULL,
    [deletedEntityId]                INT            NULL,
    [deletedUserName]                VARCHAR (200)  NULL,
    [deletedMlsId]                   VARCHAR (200)  NULL,
    [deletedParentEntityId]          INT            NULL,
    [deletedIndividualTypeId]        INT            NULL,
    [deletedIndividualStatusTypeId]  INT            NULL,
    [deletedFirstName]               VARCHAR (50)   NULL,
    [deletedMiddleName]              VARCHAR (50)   NULL,
    [deletedLastName]                VARCHAR (50)   NULL,
    [deletedPreferredName]           VARCHAR (100)  NULL,
    [deletedFlexId]                  VARCHAR (40)   NULL,
    [deletedNRDSID]                  INT            NULL,
    [deletedPhotoURL]                VARCHAR (2000) NULL,
    [deletedSystemAccess]            BIT            NULL,
    [deletedFbsBillable]             BIT            NULL,
    [deletedMlsStatus]               BIT            NULL,
    [deletedActive]                  BIT            NULL,
    [deletedVisibleInLists]          BIT            NULL,
    [action]                         NVARCHAR (30)  NULL,
    [actiondate]                     DATETIME2(7)   NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO

CREATE INDEX IX_AuditIndividual_ActionDate ON [audit].[Individual]([ActionDate]);
GO

CREATE INDEX IX_AuditIndividual_Action ON [audit].[Individual]([Action]) INCLUDE ([ActionDate]);
GO

