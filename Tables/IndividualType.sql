﻿CREATE TABLE [dbo].[IndividualType] (
    [IndividualTypeId]            SMALLINT NOT NULL,
    [IndividualTypeDescription]   VARCHAR (100) NULL,
    [LogonType]					  VARCHAR (50)  NULL,
    [LogonTypeDisplay]			  VARCHAR (50)  NULL,
    [AtlasMemberType]             VARCHAR (100) NULL,
    [LoadIntoAtlas]               BIT           NULL,
    [AllowAccess]                 BIT           NULL,
    [ManageMLSStatus]             BIT           NULL,
    [IsSubscriber]                BIT           NULL,
    [ManageVisibleInLists]        BIT           NULL,
    [AtlasLoadType]               VARCHAR (50)  NULL,
    [DisableMlsStatusOnLoad]      BIT           NULL,
    [DisableVisibleInListsOnLoad] BIT           NULL,
    [DisableVisibleInListsAlways] BIT           NULL,
    [VisibleInMainSearch]		  BIT			NULL, 
    [MLSID]						  SMALLINT		NOT NULL
    CONSTRAINT [PK_IndividualType_Id] PRIMARY KEY CLUSTERED ([IndividualTypeId], [MLSID] ASC), 
    [UsesDefaultSubscription] BIT NULL,
	[DefaultSubscriptionEntityId] int NULL, 
    [CanBeCreated] BIT NULL,
    [RequiresLicenseNumber] BIT NULL,
    [RequiresNRDSID] BIT NULL,
    [AccountTypeId] INT NULL,
    [CanHaveSubscription] BIT NULL,
    [CanHaveAddOns] BIT NULL,
    [HomeRoute] NVARCHAR(200) NULL,
    [SubscriberExport] BIT NULL
);

