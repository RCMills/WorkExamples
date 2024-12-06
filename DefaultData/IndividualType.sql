use Atlas;
Go

IF (SELECT Object_Id(N'tempdb..#IndividualType')) IS NOT NULL
BEGIN
	
	DROP TABLE #IndividualType
	
END

CREATE TABLE #IndividualType(
		[IndividualTypeId] 			  SMALLINT	NOT NULL,
		[IndividualTypeDescription]   VARCHAR (100) NULL,
    	[LogonType]		  			  VARCHAR (50)  NULL,
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
    	[VisibleInMainSearch]	      BIT			NULL, 
    	[MLSID]						  SMALLINT	    NOT NULL,
		[UsesDefaultSubscription]	  BIT			NULL,
		[DefaultSubscriptionEntityId] int			NULL,
		[CanBeCreated]							BIT NULL,
		[RequiresLicenseNumber]			BIT NULL,
		[RequiresNRDSID]					BIT NULL,
		[AccountTypeId] INT NULL,
		[CanHaveSubscription] BIT NULL,
		[CanHaveAddOns] BIT NULL,
		[HomeRoute] NVARCHAR(200) NULL,
		[SubscriberExport] BIT NULL
)

INSERT #IndividualType(
		[IndividualTypeId],
		[IndividualTypeDescription],
    	[LogonType],
    	[LogonTypeDisplay],
    	[AtlasMemberType],
    	[LoadIntoAtlas],
    	[AllowAccess],
    	[ManageMLSStatus],
    	[IsSubscriber],
    	[ManageVisibleInLists],
    	[AtlasLoadType],
    	[DisableMlsStatusOnLoad],
    	[DisableVisibleInListsOnLoad],
    	[DisableVisibleInListsAlways],
    	[VisibleInMainSearch], 
    	[MLSID],
		[UsesDefaultSubscription],
		[DefaultSubscriptionEntityId],
		[CanBeCreated],
		[RequiresLicenseNumber],
		[RequiresNRDSID],
		[AccountTypeId],
		[CanHaveSubscription],
		[CanHaveAddOns],
		[HomeRoute],
		[SubscriberExport])
VALUES(
	1,
	'MLS Only Appraiser', -- Individual Type Description
	'Affiliate Appraiser', -- Logon Type
	'Affiliate Appraiser', -- Logon Type Display
	'Agent', -- Atlas Member Type
	0x01, -- Load Into Atlas
	0x01, -- Allow Access
	0x01, -- Manage MLS Status
	0x01, -- IsSubscriber
	0x01, -- Manage Visible In Lists
	'Agent',  -- Type to be used for loading into Atlas
	0x01, -- Disable Mls Staus On Load for new records
	0x01, -- Disable Visible In Lists On Load for new records
	0x00, -- Disable Visible In Lists Always
	0x01, -- Visible In Main Search
	1, -- MLSID
	0x00, -- Uses Default Subscription
	NULL, -- Default Subscription EntityId
	0x01, -- Can Be Created
	0x01, -- Requires License Number
	0x00, -- Requires NRDSID
	7, -- AccountTypeId
	0x01, -- CanHaveSubscription
	0x00, -- CanHaveAddOns 
	NULL,  -- HomeRoute
	0x01), -- SubscriberExport
	(2,
	'Non Member/Vendor', -- Individual Type Description
	'Affiliate', -- Logon Type
	'Affiliate', -- Logon Type Display
	NULL, -- Atlas Member Type
	0x01, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent',  -- Type to be used for loading into Atlas
	0x00,  -- Disable Mls Staus On Load for new records
	0x00, -- Disable Visible In Lists On Load for new records
	0x00, -- Disable Visible In Lists Always
	0x01,
	1, -- MLSID
	0x00,
	NULL,
	0x01, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	1, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns 
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(3,
	'Affiliate Key', -- Individual Type Description
	'Affiliate Key', -- Logon Type
	'Affiliate Key', -- Logon Type Display
	NULL, -- Atlas Member Type
	0x01, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent',  -- Type to be used for loading into Atlas
	0x00, -- Disable Mls Staus On Load for new records
	0x00, -- Disable Visible In Lists On Load for new records
	0x00, -- Disable Visible In Lists Always
	0x01,
	1, -- MLSID
	0x00,
	NULL,
	0x01, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	1, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns 
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(4,
	'Realtor Appraiser', -- Individual Type Description
	'Appraiser', -- Logon Type 
	'Appraiser', -- Logon Type Display
	'Agent', -- Atlas Member Type
	0x01, -- Load Into Atlas
	0x01, -- Allow Access
	0x01, -- Manage MLS Status
	0x01, -- IsSubscriber
	0x01, -- Manage Visible In Lists
	'Agent',  -- Type to be used for loading into Atlas
	0x01, -- Disable Mls Staus On Load for new records
	0x01 , -- Disable Visible In Lists On Load for new records
	0x00, -- Disable Visible In Lists Always
	0x01,
	1, -- MLSID
	0x00,
	NULL,
	0x01, -- Can Be Created
	0x01, -- Requires License Number
	0x01, -- Requires NRDSID
	7, -- AccountTypeId
	0x01, -- CanHaveSubscription
	0x01, -- CanHaveAddOns 
	NULL, -- HomeRoute
	0x01), -- SubscriberExport
	(4,
	'Realtor Appraiser', -- Individual Type Description
	'Realtor Appraiser', -- Logon Type
	'Appraiser', -- Logon Type Display
	'Agent', -- Atlas Member Type
	0x01, -- Load Into Atlas
	0x01, -- Allow Access
	0x01, -- Manage MLS Status
	0x01, -- IsSubscriber
	0x01, -- Manage Visible In Lists
	'Agent',  -- Type to be used for loading into Atlas
	0x01, -- Disable Mls Staus On Load for new records
	0x01 , -- Disable Visible In Lists On Load for new records
	0x00, -- Disable Visible In Lists Always
	0x01,
	2, -- MLSID
	0x00,
	NULL,
	0x01, -- Can Be Created
	0x01, -- Requires License Number
	0x01, -- Requires NRDSID
	7, -- AccountTypeId
	0x01, -- CanHaveSubscription
	0x00, -- CanHaveAddOns 
	NULL, -- HomeRoute
	0x01), -- SubscriberExport
	(5,
	'MLS Only Broker', -- Individual Type Description
	'Designated Broker (Non-Realtor)', -- Logon Type
	'Designated Broker (Non-Realtor)', -- Logon Type Display
	'Agent', -- Atlas Member Type
	0x01, -- Load Into Atlas
	0x01, -- Allow Access
	0x01, -- Manage MLS Status
	0x01, -- IsSubscriber
	0x01, -- Manage Visible In Lists
	'Broker',  -- Type to be used for loading into Atlas
	0x01, -- Disable Mls Staus On Load for new records
	0x01 , -- Disable Visible In Lists On Load for new records
	0x00, -- Disable Visible In Lists Always
	0x01,
	1, -- MLSID
	0x00,
	NULL,
	0x01, -- Can Be Created
	0x01, -- Requires License Number
	0x00, -- Requires NRDSID
	7, -- AccountTypeId
	0x01, -- CanHaveSubscription
	0x01, -- CanHaveAddOns 
	NULL, -- HomeRoute
	0x01), -- SubscriberExport
	(6,
	'Designated Realtor Participant', -- Individual Type Description
	'Designated Realtor', -- Logon Type
	'Designated Realtor', -- Logon Type Display
	'Agent', -- Atlas Member Type
	0x01, -- Load Into Atlas
	0x01, -- Allow Access
	0x01, -- Manage MLS Status
	0x01, -- IsSubscriber
	0x01, -- Manage Visible In Lists
	'Broker',  -- Type to be used for loading into Atlas
	0x01, -- Disable Mls Staus On Load for new records
	0x01 , -- Disable Visible In Lists On Load for new records
	0x00, -- Disable Visible In Lists Always
	0x01,
	1, -- MLSID
	0x00,
	NULL,
	0x01, -- Can Be Created
	0x01, -- Requires License Number
	0x01, -- Requires NRDSID
	7, -- AccountTypeId
	0x01, -- CanHaveSubscription
	0x01, -- CanHaveAddOns 
	NULL, -- HomeRoute
	0x01), -- SubscriberExport
	(6,
	'Designated Realtor Participant', -- Individual Type Description
	'Designated Realtor', -- Logon Type
	'Designated Realtor', -- Logon Type Display
	'Agent', -- Atlas Member Type
	0x01, -- Load Into Atlas
	0x01, -- Allow Access
	0x01, -- Manage MLS Status
	0x01, -- IsSubscriber
	0x01, -- Manage Visible In Lists
	'Broker',  -- Type to be used for loading into Atlas
	0x01, -- Disable Mls Staus On Load for new records
	0x01 , -- Disable Visible In Lists On Load for new records
	0x00, -- Disable Visible In Lists Always
	0x01,
	2, -- MLSID
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	7, -- AccountTypeId
	0x01, -- CanHaveSubscription
	0x01, -- CanHaveAddOns 
	NULL, -- HomeRoute
	0x01), -- SubscriberExport
	(7,
	'Brokerage Office Staff', -- Individual Type Description
	'Office Staff', -- Logon Type
	'Office Staff', -- Logon Type Display
	'Agent', -- Atlas Member Type
	0x01, -- Load Into Atlas
	0x01, -- Allow Access
	0x01, -- Manage MLS Status
	0x01, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent',  -- Type to be used for loading into Atlas
	0x01, -- Disable Mls Staus On Load for new records
	0x01 , -- Disable Visible In Lists On Load for new records
	0x01, -- Disable Visible In Lists Always
	0x01,
	1, -- MLSID
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	5, -- AccountTypeId
	0x01, -- CanHaveSubscription
	0x00, -- CanHaveAddOns 
	NULL, -- HomeRoute
	0x01), -- SubscriberExport
	(7,
	'Brokerage Office Staff', -- Individual Type Description
	'Staff', -- Logon Type
	'Office Staff', -- Logon Type Display
	'Agent', -- Atlas Member Type
	0x01, -- Load Into Atlas
	0x01, -- Allow Access
	0x01, -- Manage MLS Status
	0x01, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent',  -- Type to be used for loading into Atlas
	0x01, -- Disable Mls Staus On Load for new records
	0x01 , -- Disable Visible In Lists On Load for new records
	0x01, -- Disable Visible In Lists Always
	0x01,
	2, -- MLSID
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	5, -- AccountTypeId
	0x01, -- CanHaveSubscription
	0x00, -- CanHaveAddOns 
	NULL, -- HomeRoute
	0x01), -- SubscriberExport
	(8,
	'Realtor Sales Person', -- Individual Type Description
	'Realtor', -- Logon Type
	'Realtor', -- Logon Type Display
	'Agent', -- Atlas Member Type
	0x01, -- Load Into Atlas
	0x01, -- Allow Access
	0x01, -- Manage MLS Status
	0x01, -- IsSubscriber
	0x01, -- Manage Visible In Lists
	'Agent',  -- Type to be used for loading into Atlas
	0x01, -- Disable Mls Staus On Load for new records
	0x01 , -- Disable Visible In Lists On Load for new records
	0x00, -- Disable Visible In Lists Always
	0x01,
	1, -- MLSID
	0x00,
	NULL,
	0x01, -- Can Be Created
	0x01, -- Requires License Number
	0x01, -- Requires NRDSID
	7, -- AccountTypeId
	0x01, -- CanHaveSubscription
	0x01, -- CanHaveAddOns 
	NULL, -- HomeRoute
	0x01), -- SubscriberExport
	(8,
	'Realtor Sales Person', -- Individual Type Description
	'Realtor',  -- Logon Type
	'Realtor', -- Logon Type Display
	'Agent', -- Atlas Member Type
	0x01, -- Load Into Atlas
	0x01, -- Allow Access
	0x01, -- Manage MLS Status
	0x01, -- IsSubscriber
	0x01, -- Manage Visible In Lists
	'Agent',  -- Type to be used for loading into Atlas
	0x01, -- Disable Mls Staus On Load for new records
	0x01 , -- Disable Visible In Lists On Load for new records
	0x00, -- Disable Visible In Lists Always
	0x01,
	2, -- MLSID
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	7, -- AccountTypeId
	0x01, -- CanHaveSubscription
	0x01, -- CanHaveAddOns 
	NULL, -- HomeRoute
	0x01), -- SubscriberExport
	(9,
	'MLS Only Salesperson', -- Individual Type Description
	'Sales Person', -- Logon Type
	'Sales Person', -- Logon Type Display
	'Agent', -- Atlas Member Type
	0x01, -- Load Into Atlas
	0x01, -- Allow Access
	0x01, -- Manage MLS Status
	0x01, -- IsSubscriber
	0x01, -- Manage Visible In Lists
	'Agent',  -- Type to be used for loading into Atlas
	0x01, -- Disable Mls Staus On Load for new records
	0x01 , -- Disable Visible In Lists On Load for new records
	0x00, -- Disable Visible In Lists Always
	0x01,
	1, -- MLSID
	0x00,
	NULL,
	0x01, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	7, -- AccountTypeId
	0x01, -- CanHaveSubscription
	0x01, -- CanHaveAddOns 
	NULL, -- HomeRoute
	0x01), -- SubscriberExport
	(10,
	'MLS Staff', -- Individual Type Description
	'MLS Staff', -- Logon Type
	'MLS Staff', -- Logon Type Display
	'MLS Staff', -- Atlas Member Type
	0x01, -- Load Into Atlas
	0x01, -- Allow Access
	0x01, -- Manage MLS Status
	0x01, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'MlsStaff',  -- Type to be used for loading into Atlas
	0x00, -- Disable Mls Staus On Load for new records
	0x01 , -- Disable Visible In Lists On Load for new records
	0x01, -- Disable Visible In Lists Always
	0x00,
	1, -- MLSID
	0x01,
	-1,
	0x01, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	4, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns 
	NULL, -- HomeRoute
	0x00), -- SubscriberExport
	(10,
	'MLS Staff', -- Individual Type Description
	'SAAR/SAMLS Staff', -- Logon Type
	'MLS Staff', -- Logon Type Display
	'MLS Staff', -- Atlas Member Type
	0x01, -- Load Into Atlas
	0x01, -- Allow Access
	0x01, -- Manage MLS Status
	0x01, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'MlsStaff',  -- Type to be used for loading into Atlas
	0x00, -- Disable Mls Staus On Load for new records
	0x01 , -- Disable Visible In Lists On Load for new records
	0x01, -- Disable Visible In Lists Always
	0x00,
	2, -- MLSID
	0x01,
	-1,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	4, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns 
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(11, 
	'Waiver',  
	'Waiver', 
	'Waiver', 
	'Waiver', 
	1, 
	0, 
	0, 
	0, 
	0, 
	'Agent', 
	1, 
	1, 
	0, 
	1,
	1, -- MLSID
	0x00,
	NULL,
	0x01, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	9, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns 
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(11,
	'Waiver', -- Individual Type Description
	'Waiver',
	'Waiver', --  Logon Type
	'Waiver', -- Atlas Member Type
	0x01, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent',  -- Type to be used for loading into Atlas
	0x01, -- Disable Mls Staus On Load for new records
	0x01 , -- Disable Visible In Lists On Load for new records
	0x00, -- Disable Visible In Lists Always
	0x01,
	2, -- MLSID
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	9, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns 
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	--(13, 
	--'Client', 
	--'Client', 
	--'Client', 
	--'Client', 
	--NULL, 
	--NULL, 
	--NULL, 
	--NULL, 
	--NULL, 
	--NULL, 
	--NULL, 
	--NULL, 
	--NULL, 
	--0,
	--1,
	--0x00,
	--NULL,
	--0x00, -- Can Be Created
	--0x00, -- Requires License Number
	--0x00), -- Requires NRDSID),
	(14, 
	'Registered User', 
	'Registered User', 
	'Registered User', 
	'Registered User', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	0,
	1,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	6, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns 
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	--(15, 
	--'Agent', 
	--'Agent', 
	--'Agent', 
	--'Agent', 
	--NULL, 
	--NULL, 
	--NULL, 
	--NULL, 
	--NULL, 
	--NULL, 
	--NULL, 
	--NULL, 
	--NULL, 
	--0,
	--1,
	--0x00,
	--NULL,
	--0x00, -- Can Be Created
	--0x00, -- Requires License Number
	--0x00), -- Requires NRDSID),
	(16, 	
	'Guest', 
	'Guest',
	'Guest', 
	'Guest', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	0,
	1,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	6, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns 
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(17, 
	'Association Staff', 
	'Association Staff', 
	'Association Staff', 
	'Association Staff', 
	1, 
	1, 
	1, 
	1, 
	0, 
	'MlsStaff', 
	0, 
	1, 
	1, 
	0,
	1, -- MLSID
	0x01,
	-2,
	0x01, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	2, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns 
	'/sms/search', -- HomeRoute
	0x00),
	(17, 
	'Assoc', 
	'Assoc', 
	'Assoc', 
	'Assoc', 
	1, 
	1, 
	1, 
	1, 
	0, 
	'MlsStaff', 
	0, 
	1, 
	1, 
	0,
	2, -- MLSID
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	2, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns 
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(18, 
	'Branch Manager', 
	'Branch Manager', 
	'Branch Manager', 
	'Agent', 
	1, 
	1, 
	1, 
	1, 
	1, 
	'Agent', 
	1, 
	1, 
	0, 
	1,
	2, -- MLSID
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	7, -- AccountTypeId
	0x01, -- CanHaveSubscription
	0x01, -- CanHaveAddOns 
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(8, -- Individual Type Id
	'Realtor', -- Individual Type Description
	'Realtor', -- Logon Type
	'Realtor', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	3, -- MLSID
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns 
	NULL, -- HomeRoute
	0x01), -- SubscriberExport
	(19, -- Individual Type Id
	'Designate/Manager', -- Individual Type Description
	'Designate/Manager', -- Logon Type
	'Designate/Manager', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	3,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x01, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL, -- HomeRoute
	0x01), -- SubscriberExport
	(4, -- Individual Type Id
	'Appraiser', -- Individual Type Description
	'Appraiser', -- Logon Type
	'Appraiser', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	3,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(30, -- Individual Type Id
	'Office Assistant', -- Individual Type Description
	'Office Assistant', -- Logon Type
	'Office Assistant', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	3,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(6, -- Individual Type Id
	'Broker/Owner', -- Individual Type Description
	'Broker/Owner', -- Logon Type
	'Broker/Owner', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	3,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x01, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL, -- HomeRoute
	0x01), -- SubscriberExport
	(20, -- Individual Type Id
	'Agent Assistant', -- Individual Type Description
	'Agent Assistant', -- Logon Type
	'Agent Assistant', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	3,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(21, -- Individual Type Id
	'Company Assistant', -- Individual Type Description
	'Company Assistant', -- Logon Type
	'Company Assistant', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	3,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(22, -- Individual Type Id
	'Team Login', -- Individual Type Description
	'Team Login', -- Logon Type
	'Team Login', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	3,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(23, -- Individual Type Id
	'Photographer', -- Individual Type Description
	'Photographer', -- Logon Type
	'Photographer', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	3,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(24, -- Individual Type Id
	'Office Admin', -- Individual Type Description
	'Office Admin', -- Logon Type
	'Office Admin', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	3,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(25, -- Individual Type Id
	'Appraiser Assistant', -- Individual Type Description
	'Appraiser Assistant', -- Logon Type
	'Appraiser Assistant', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	3,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(26, -- Individual Type Id
	'Team Assistant', -- Individual Type Description
	'Team Assistant', -- Logon Type
	'Team Assistant', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	3,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(27, -- Individual Type Id
	'WI-DOR', -- Individual Type Description
	'WI-DOR', -- Logon Type
	'WI-DOR', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	3,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(28, -- Individual Type Id
	'Board Staff', -- Individual Type Description
	'Board Staff', -- Logon Type
	'Board Staff', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	3,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(29, -- Individual Type Id
	'Non MLS Member', -- Individual Type Description
	'Non MLS Member', -- Logon Type
	'Non MLS Member', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	3,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(8, -- Individual Type Id
	'Realtor', -- Individual Type Description
	'Realtor', -- Logon Type
	'Realtor', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	4,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(6, -- Individual Type Id
	'Designated Realtor', -- Individual Type Description
	'Designated Realtor', -- Logon Type
	'Designated Realtor', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	4,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(10, -- Individual Type Id
	'MLS Staff', -- Individual Type Description
	'MLS Staff', -- Logon Type
	'MLS Staff', -- Logon Type Display
	'MLS Staff', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'MlsStaff', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	3, -- MLSID
	0x01, -- UsesDefaultSubscription
	-3, -- DefaultSubscriptionEntityId
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	4, -- AccountTypeId
	0x01, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(33, -- Individual Type Id
	'Agent MLO', -- Individual Type Description
	'Agent MLO', -- Logon Type
	'Agent MLO', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	4,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(4, -- Individual Type Id
	'Appraiser', -- Individual Type Description
	'Appraiser', -- Logon Type
	'Appraiser', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	4,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(35, -- Individual Type Id
	'Appraiser MLO', -- Individual Type Description
	'Appraiser MLO', -- Logon Type
	'Appraiser MLO', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	4,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(36, -- Individual Type Id
	'Assistant', -- Individual Type Description
	'Assistant', -- Logon Type
	'Assistant', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	4,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(37, -- Individual Type Id
	'Designated Broker MLO', -- Individual Type Description
	'Designated Broker MLO', -- Logon Type
	'Designated Broker MLO', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	4,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(8, -- Individual Type Id
	'Realtor', -- Individual Type Description
	'Realtor', -- Logon Type
	'Realtor', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	5,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(39, -- Individual Type Id
	'Administrator Asst', -- Individual Type Description
	'Administrator Asst', -- Logon Type
	'Administrator Asst', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	5,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(40, -- Individual Type Id
	'Manager', -- Individual Type Description
	'Manager', -- Logon Type
	'Manager', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	5,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(41, -- Individual Type Id
	'Broker', -- Individual Type Description
	'Broker', -- Logon Type
	'Broker', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	5,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(4, -- Individual Type Id
	'Appraiser', -- Individual Type Description
	'Appraiser', -- Logon Type
	'Appraiser', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	5,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(43, -- Individual Type Id
	'Associate Broker', -- Individual Type Description
	'Associate Broker', -- Logon Type
	'Associate Broker', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	5,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(44, -- Individual Type Id
	'MLS No Charge', -- Individual Type Description
	'MLS No Charge', -- Logon Type
	'MLS No Charge', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	5,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(8, -- Individual Type Id
	'Realtor', -- Individual Type Description
	'Realtor', -- Logon Type
	'Realtor', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	6,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(46, -- Individual Type Id
	'Staff Admin', -- Individual Type Description
	'Staff Admin', -- Logon Type
	'Staff Admin', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	6,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(41, -- Individual Type Id
	'Broker', -- Individual Type Description
	'Broker', -- Logon Type
	'Broker', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	6,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(4, -- Individual Type Id
	'Appraiser', -- Individual Type Description
	'Appraiser', -- Logon Type
	'Appraiser', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	6,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(49, -- Individual Type Id
	'Secondary Realtor', -- Individual Type Description
	'Secondary Realtor', -- Logon Type
	'Secondary Realtor', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	7,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(8, -- Individual Type Id
	'Realtor', -- Individual Type Description
	'Realtor', -- Logon Type
	'Realtor', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	7,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(6, -- Individual Type Id
	'Designated Realtor', -- Individual Type Description
	'Designated Realtor', -- Logon Type
	'Designated Realtor', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	7,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(52, -- Individual Type Id
	'Secondary DR', -- Individual Type Description
	'Secondary DR', -- Logon Type
	'Secondary DR', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	7,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(28, -- Individual Type Id
	'Board Staff', -- Individual Type Description
	'Board Staff', -- Logon Type
	'Board Staff', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	7,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(4, -- Individual Type Id
	'Appraiser', -- Individual Type Description
	'Appraiser', -- Logon Type
	'Appraiser', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	7,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(4, -- Individual Type Id
	'Appraiser', -- Individual Type Description
	'Appraiser', -- Logon Type
	'Appraiser', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	8,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(60, -- Individual Type Id
	'Title Company', -- Individual Type Description
	'Title Company', -- Logon Type
	'Title Company', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	8,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(8, -- Individual Type Id
	'Realty', -- Individual Type Description
	'Realty', -- Logon Type
	'Realty', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	8,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(61, -- Individual Type Id
	'Realtor Secondary', -- Individual Type Description
	'Realtor Secondary', -- Logon Type
	'Realtor Secondary', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	8,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(62, -- Individual Type Id
	'Realtor Primary', -- Individual Type Description
	'Realtor Primary', -- Logon Type
	'Realtor Primary', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	8,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(63, -- Individual Type Id
	'Branch Manager (S)', -- Individual Type Description
	'Branch Manager (S)', -- Logon Type
	'Branch Manager (S)', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	8,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(64, -- Individual Type Id
	'Branch Manager (P)', -- Individual Type Description
	'Branch Manager (P)', -- Logon Type
	'Branch Manager (P)', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	8,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(65, -- Individual Type Id
	'Designated Broker(P)', -- Individual Type Description
	'Designated Broker(P)', -- Logon Type
	'Designated Broker(P)', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	8,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(6, -- Individual Type Id
	'Designated Broker(S)', -- Individual Type Description
	'Designated Broker(S)', -- Logon Type
	'Designated Broker(S)', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	8,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(10, -- Individual Type Id
	'MLS Staff', -- Individual Type Description
	'MLS Staff', -- Logon Type
	'MLS Staff', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	8,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(7, -- Individual Type Id
	'Office Staff', -- Individual Type Description
	'Office Staff', -- Logon Type
	'Office Staff', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	8,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(66, -- Individual Type Id
	'Personal Assistant', -- Individual Type Description
	'Personal Assistant', -- Logon Type
	'Personal Assistant', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	8,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(9, -- Individual Type Id
	'MLS Only', -- Individual Type Description
	'MLS Only', -- Logon Type
	'MLS Only', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	8,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(67, -- Individual Type Id
	'Appraisal Company', -- Individual Type Description
	'Appraisal Company', -- Logon Type
	'Appraisal Company', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	8,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(2, -- Individual Type Id
	'Affiliate', -- Individual Type Description
	'Affiliate', -- Logon Type
	'Affiliate', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(17, -- Individual Type Id
	'Association Staff', -- Individual Type Description
	'Association Staff', -- Logon Type
	'Association Staff', -- Logon Type Display
	'Association Staff', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(19, -- Individual Type Id
	'Designate/Manager', -- Individual Type Description
	'Designate/Manager', -- Logon Type
	'Designate/Manager', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(68, -- Individual Type Id
	'DR/Manager-Flager', -- Individual Type Description
	'DR/Manager-Flager', -- Logon Type
	'DR/Manager-Flager', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(69, -- Individual Type Id
	'Lender', -- Individual Type Description
	'Lender', -- Logon Type
	'Lender', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(70, -- Individual Type Id
	'MLS Agent', -- Individual Type Description
	'MLS Agent', -- Logon Type
	'MLS Agent', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Sales Person', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(71, -- Individual Type Id
	'MLS Manager', -- Individual Type Description
	'MLS Manager', -- Logon Type
	'MLS Manager', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(72, -- Individual Type Id
	'MLS Owner', -- Individual Type Description
	'MLS Owner', -- Logon Type
	'MLS Owner', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(73, -- Individual Type Id
	'MLS Secretary', -- Individual Type Description
	'MLS Secretary', -- Logon Type
	'MLS Secretary', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(10, -- Individual Type Id
	'MLS Staff', -- Individual Type Description
	'MLS Staff', -- Logon Type
	'MLS Staff', -- Logon Type Display
	'MLS Staff', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(74, -- Individual Type Id
	'Office Administrator', -- Individual Type Description
	'Office Administrator', -- Logon Type
	'Office Administrator', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(75, -- Individual Type Id
	'Owner Broker-Flagler', -- Individual Type Description
	'Owner Broker-Flagler', -- Logon Type
	'Owner Broker-Flagler', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(76, -- Individual Type Id
	'Owner/Broker', -- Individual Type Description
	'Owner/Broker', -- Logon Type
	'Owner/Broker', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(66, -- Individual Type Id
	'Personal Assistant', -- Individual Type Description
	'Personal Assistant', -- Logon Type
	'Personal Assistant', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(77, -- Individual Type Id
	'Phtotographer', -- Individual Type Description
	'Phtotographer', -- Logon Type
	'Phtotographer', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(78, -- Individual Type Id
	'REALTOR Appraiser', -- Individual Type Description
	'REALTOR Appraiser', -- Logon Type
	'REALTOR Appraiser', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(79, -- Individual Type Id
	'REALTOR Salesperson', -- Individual Type Description
	'REALTOR Salesperson', -- Logon Type
	'REALTOR Salesperson', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(80, -- Individual Type Id
	'Realtor/No Add', -- Individual Type Description
	'Realtor/No Add', -- Logon Type
	'Realtor/No Add', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(81, -- Individual Type Id
	'REALTOR-Flagler', -- Individual Type Description
	'REALTOR-Flagler', -- Logon Type
	'REALTOR-Flagler', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(82, -- Individual Type Id
	'Recip REALTOR Listing', -- Individual Type Description
	'Recip REALTOR Listing', -- Logon Type
	'Recip REALTOR Listing', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(83, -- Individual Type Id
	'Recip. MLS Agent', -- Individual Type Description
	'Recip. MLS Agent', -- Logon Type
	'Recip. MLS Agent', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(84, -- Individual Type Id
	'Recip. MLS Designate', -- Individual Type Description
	'Recip. MLS Designate', -- Logon Type
	'Recip. MLS Designate', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(85, -- Individual Type Id
	'Recip. MLS Secretary', -- Individual Type Description
	'Recip. MLS Secretary', -- Logon Type
	'Recip. MLS Secretary', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(86, -- Individual Type Id
	'Reciprocal Agent', -- Individual Type Description
	'Reciprocal Agent', -- Logon Type
	'Reciprocal Agent', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(87, -- Individual Type Id
	'Reciprocal Designate', -- Individual Type Description
	'Reciprocal Designate', -- Logon Type
	'Reciprocal Designate', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(88, -- Individual Type Id
	'Reciprocal MLS Owner', -- Individual Type Description
	'Reciprocal MLS Owner', -- Logon Type
	'Reciprocal MLS Owner', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(89, -- Individual Type Id
	'Reciprocal Owner', -- Individual Type Description
	'Reciprocal Owner', -- Logon Type
	'Reciprocal Owner', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(90, -- Individual Type Id
	'Reciprocal Secretary', -- Individual Type Description
	'Reciprocal Secretary', -- Logon Type
	'Reciprocal Secretary', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(91, -- Individual Type Id
	'Registered Trainee', -- Individual Type Description
	'Registered Trainee', -- Logon Type
	'Registered Trainee', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(92, -- Individual Type Id
	'Secondary DR/Manager', -- Individual Type Description
	'Secondary DR/Manager', -- Logon Type
	'Secondary DR/Manager', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(93, -- Individual Type Id
	'Secondary Owner/Broker', -- Individual Type Description
	'Secondary Owner/Broker', -- Logon Type
	'Secondary Owner/Broker', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(49, -- Individual Type Id
	'Secondary Realtor', -- Individual Type Description
	'Secondary Realtor', -- Logon Type
	'Secondary Realtor', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(94, -- Individual Type Id
	'Secretary', -- Individual Type Description
	'Secretary', -- Logon Type
	'Secretary', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	9,
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(95, -- Individual Type Id
	'Third Party', -- Individual Type Description
	'Third Party', -- Logon Type
	'Third Party', -- Logon Type Display
	'Third Party', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Customer', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	1, -- MLSID
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	8, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00), -- SubscriberExport
	(96, -- Individual Type Id
	'LaCrosse Assistant', -- Individual Type Description
	'LaCrosse Assistant', -- Logon Type
	'LaCrosse Assistant', -- Logon Type Display
	'Customer', -- Atlas Member Type
	0x00, -- Load Into Atlas
	0x00, -- Allow Access
	0x00, -- Manage MLS Status
	0x00, -- IsSubscriber
	0x00, -- Manage Visible In Lists
	'Agent', -- Atlas Load Type
	0x00, -- Disable Mls Status On Load
	0x00, -- Disable Visible In Lists On Load
	0x00, -- Disable Visiable In Lists Always
	0x01, -- Visible In Main Search
	3, -- MLSID
	0x00,
	NULL,
	0x00, -- Can Be Created
	0x00, -- Requires License Number
	0x00, -- Requires NRDSID
	3, -- AccountTypeId
	0x00, -- CanHaveSubscription
	0x00, -- CanHaveAddOns
	NULL,  -- HomeRoute
	0x00); -- Subscriber Export

	MERGE dbo.IndividualType as TARGET
	USING #IndividualType AS SOURCE ON (TARGET.IndividualTypeId = SOURCE.IndividualTypeId AND TARGET.MLSID = SOURCE.MLSID)
	WHEN MATCHED THEN
		UPDATE
			SET IndividualTypeDescription = SOURCE.IndividualTypeDescription
				, LogonType = SOURCE.LogonType
				, LogonTypeDisplay = SOURCE.LogonTypeDisplay
				, AtlasMemberType = SOURCE.AtlasMemberType
				, LoadIntoAtlas = Source.LoadIntoAtlas
				, AllowAccess = Source.AllowAccess
				, ManageMLSStatus = Source.ManageMlsStatus
				, IsSubscriber = Source.IsSubscriber
				, ManageVisibleInLists = Source.ManageVisibleInLists
				, AtlasLoadType = Source.AtlasLoadType
				, DisableMlsStatusOnLoad = Source.DisableMlsStatusOnLoad
				, DisableVisibleInListsOnLoad = Source.DisableVisibleInListsOnLoad
				, DisableVisibleInListsAlways = Source.DisableVisibleInListsAlways
				, VisibleInMainSearch = Source.VisibleInMainSearch
				, [UsesDefaultSubscription] = Source.[UsesDefaultSubscription]
				, [DefaultSubscriptionEntityId] = Source.[DefaultSubscriptionEntityId]
				, [CanBeCreated] = SOURCE.[CanBeCreated]
				, [RequiresLicenseNumber] = SOURCE.[RequiresLicenseNumber]
				, [RequiresNRDSID] = SOURCE.[RequiresNRDSID]
				, [AccountTypeId] = SOURCE.[AccountTypeId]
				, [CanHaveSubscription] = SOURCE.[CanHaveSubscription]
				, [CanHaveAddOns] = SOURCE.[CanHaveAddOns]
				, [HomeRoute] = SOURCE.[HomeRoute]
				, [SubscriberExport] = SOURCE.SubscriberExport
		WHEN NOT MATCHED THEN
			INSERT
				(
				[IndividualTypeId],
				[IndividualTypeDescription],
    			[LogonType],
    			[LogonTypeDisplay],
    			[AtlasMemberType],
    			[LoadIntoAtlas],
    			[AllowAccess],
    			[ManageMLSStatus],
    			[IsSubscriber],
    			[ManageVisibleInLists],
    			[AtlasLoadType],
    			[DisableMlsStatusOnLoad],
    			[DisableVisibleInListsOnLoad],
    			[DisableVisibleInListsAlways],
    			[VisibleInMainSearch], 
    			[MLSID],
				[UsesDefaultSubscription],
				[DefaultSubscriptionEntityId],
				[CanBeCreated],
				[RequiresLicenseNumber],
				[RequiresNRDSID],
				[AccountTypeId],
				[CanHaveSubscription],
				[CanHaveAddOns],
				[HomeRoute],
				[SubscriberExport])
			VALUES(
				SOURCE.[IndividualTypeId],
				SOURCE.[IndividualTypeDescription],
    			SOURCE.[LogonType],
    			SOURCE.[LogonTypeDisplay],
    			SOURCE.[AtlasMemberType],
    			SOURCE.[LoadIntoAtlas],
    			SOURCE.[AllowAccess],
    			SOURCE.[ManageMLSStatus],
    			SOURCE.[IsSubscriber],
    			SOURCE.[ManageVisibleInLists],
    			SOURCE.[AtlasLoadType],
    			SOURCE.[DisableMlsStatusOnLoad],
    			SOURCE.[DisableVisibleInListsOnLoad],
    			SOURCE.[DisableVisibleInListsAlways],
    			SOURCE.[VisibleInMainSearch], 
    			SOURCE.[MLSID],
				SOURCE.[UsesDefaultSubscription],
				SOURCE.[DefaultSubscriptionEntityId],
				SOURCE.[CanBeCreated],
				SOURCE.[RequiresLicenseNumber],
				SOURCE.[RequiresNRDSID],
				SOURCE.[AccountTypeId],
				SOURCE.[CanHaveSubscription],
				SOURCE.[CanHaveAddOns],
				SOURCE.[HomeRoute],
				SOURCE.[SubscriberExport]);

				