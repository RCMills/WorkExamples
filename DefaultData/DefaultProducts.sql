SET NOCOUNT ON; 
SET XACT_ABORT ON;

declare @Dev nvarchar(250) = N'dev10-12';
declare @QA nvarchar(250) = N'qa10-12';
declare @Staging nvarchar(250) = N'staging10-12';
declare @Prod nvarchar(250) = N'wopr2';

DECLARE @EnvironmentPrefix VARCHAR(50);

SELECT @EnvironmentPrefix = CASE WHEN @@SERVERNAME = @Dev THEN 'https://dev.'
	WHEN @@SERVERNAME = @QA THEN 'https://qa.'
	WHEN @@SERVERNAME = @Staging THEN 'https://staging.'
	WHEN @@SERVERNAME = @Prod THEN 'https://'
	ELSE 'https://dev.' END -- Defaults to DEV

/*
(ProductId, ParentProductId, ProductTypeId, SKU, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, SubscriptionPeriod, SubscriptionPeriodInDays, InternalUseOnly, AccountReceivableId, ProductTier, ProductLaunchURL, ProductImage, ProductIcon, Priority, DisplayOrder, SsoClientId, RequiresLockboxSerialNumber, RequiresLockboxKeyNumber, RequiresAddress, FixedEndDate, MlsId)
*/

MERGE INTO catalog.Products AS Target
USING (VALUES
-- Products and Packages
	(
		  1 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 7 -- ProductTypeId
		, NULL -- SKU
		, 'MLS Pro Subscription with the Advantage Bundle' -- ProductName
		, 504.00 -- Price
		, 'MLS Pro Subscription with the Advantage Bundle' -- ProductDisplayName
		, 'The tools in MLS Pro plus our Advantage bundle of 5 elevated products for only $180 more, a savings of almost $1,800 a year off the retail price.' -- ProductDescription
		, 0x00 -- IsActive
		, 12 -- SubscriptionPeriod
		, 365 -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, 1 -- AccountReceivableId
		, 2 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  2 -- ProductId
		, 1 -- ParentProductId (deprecated: check the PackageContents table)
		, 4 -- ProductTypeId
		, NULL -- SKU
		, 'Cloud CMA' -- ProductName
		, 0.00 -- Price
		, 'Cloud CMA' -- ProductDisplayName
		, 'With Cloud CMA you can easily create CMAs, buyer tours, property reports, and flyers. Every report is branded to you and full of big beautiful photos.' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, NULL -- AccountReceivableId
		, NULL -- ProductTier
		, 'https://cloudcma.com/saml/login/armls' -- ProductLaunchURL
		, 'cloud_cma.png' -- ProductImage
		, 'cloud_cma.svg' -- ProductIcon
		, 2 -- Priority
		, 7 -- DisplayOrder
		, 3 -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  3 -- ProductId
		, 1 -- ParentProductId (deprecated: check the PackageContents table)
		, 4 -- ProductTypeId
		, NULL -- SKU
		, 'Cloud Streams' -- ProductName
		, 0.00 -- Price
		, 'Cloud Streams' -- ProductDisplayName
		, 'Cloud Streams keeps your clients updated with auto listing alerts via email and text much faster than other portal options.' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, NULL -- AccountReceivableId
		, NULL -- ProductTier
		, 'https://cloudstreams.net/saml/login/armls' -- ProductLaunchURL
		, 'cloud_streams.png' -- ProductImage
		, 'cloud_streams.svg' -- ProductIcon
		, 2 -- Priority
		, 9 -- DisplayOrder
		, 4 -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  4 -- ProductId
		, 1 -- ParentProductId (deprecated: check the PackageContents table)
		, 4 -- ProductTypeId
		, NULL -- SKU
		, 'Cloud MLX' -- ProductName
		, 0.00 -- Price
		, 'Cloud MLX' -- ProductDisplayName
		, 'Effortlessly search for listings, share information with clients and other agents, and access Cloud CMA and Cloud Streams all with Cloud MLX.' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, NULL -- AccountReceivableId
		, NULL -- ProductTier
		, 'https://cloudmlx.com/saml/login/armls' -- ProductLaunchURL
		, 'cloud-mlx-logo.png' -- ProductImage
		, 'cloud_mlx.svg' -- ProductIcon
		, 2 -- Priority
		, 8 -- DisplayOrder
		, 5 -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  5 -- ProductId
		, 1 -- ParentProductId (deprecated: check the PackageContents table)
		, 2 -- ProductTypeId
		, NULL -- SKU
		, 'MLS Pro Subscription' -- ProductName
		, 324.00 -- Price
		, 'MLS Pro Subscription' -- ProductDisplayName
		, 'A new name for your 2018 subscriber fees with the tools you’re using today (Flexmls, Monsoon, ShowingTime, etc.).' -- ProductDescription
		, 0x00 -- IsActive
		, 12 -- SubscriptionPeriod
		, 365 -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, 1 -- AccountReceivableId
		, 1 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  6 -- ProductId
		, 5 -- ParentProductId (deprecated: check the PackageContents table)
		, 4 -- ProductTypeId
		, NULL -- SKU
		, 'Monsoon' -- ProductName
		, 0.00 -- Price
		, 'Monsoon' -- ProductDisplayName
		, 'Monsoon is our tax records system using data from The Information Market (TIM). Based in Tempe, TIM has been providing data since 2005.' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, NULL -- AccountReceivableId
		, NULL -- ProductTier
		, CONCAT(@EnvironmentPrefix, 'mymonsoon.com') -- ProductLaunchURL
		, 'monsoon.png' -- ProductImage
		, 'monsoon-icon.svg' -- ProductIcon
		, 2 -- Priority
		, 2 -- DisplayOrder
		, 6 -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  7 -- ProductId
		, 5 -- ParentProductId (deprecated: check the PackageContents table)
		, 4 -- ProductTypeId
		, NULL -- SKU
		, 'Flexmls' -- ProductName
		, 0.00 -- Price
		, 'Flexmls' -- ProductDisplayName
		, 'Our MLS runs on the Flexmls platform by FBS Data Systems out of Fargo, ND. The system has desktop, mobile and mobile web versions.' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, NULL -- AccountReceivableId
		, 1 -- ProductTier
		, 'https://armls.flexmls.com' -- ProductLaunchURL
		, 'flexmls-logo.png' -- ProductImage
		, 'flexmls-icon.svg' -- ProductIcon
		, 1 -- Priority
		, 1 -- DisplayOrder
		, 7 -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  8 -- ProductId
		, 5 -- ParentProductId (deprecated: check the PackageContents table)
		, 4 -- ProductTypeId
		, NULL -- SKU
		, 'ShowingTime' -- ProductName
		, 0.00 -- Price
		, 'ShowingTime' -- ProductDisplayName
		, 'ShowingTime is a showing system that makes scheduling showings easy for everyone. Based in Chicago, ShowingTime is fully integrated into Flexmls.' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, NULL -- AccountReceivableId
		, NULL -- ProductTier
		, 'http://206.27.177.103/ShowingTime' -- ProductLaunchURL
		, 'showingtime-logo.png' -- ProductImage
		, 'showingtime.svg' -- ProductIcon
		, 3 -- Priority
		, 3 -- DisplayOrder
		, 8 -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  9 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 2 -- ProductTypeId
		, NULL -- SKU
		, 'ARMLS Existing User Subscription' -- ProductName
		, 0.00 -- Price
		, 'Existing Subscription' -- ProductDisplayName
		, 'ARMLS subscription for existing users in the system' -- ProductDescription
		,  0x00 -- IsActive
		, 12 -- SubscriptionPeriod
		, 365 -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, NULL -- AccountReceivableId
		, 0 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  10 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 5 -- ProductTypeId
		, NULL -- SKU
		, 'Refund' -- ProductName
		, 0.00 -- Price
		, 'Refund' -- ProductDisplayName
		, 'Refund' -- ProductDescription
		,  0x00 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, NULL -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  11 -- ProductId
		, 1 -- ParentProductId (deprecated: check the PackageContents table)
		, 3 -- ProductTypeId
		, NULL -- SKU
		, 'RapidStats' -- ProductName
		, 360.00 -- Price
		, 'RapidStats' -- ProductDisplayName
		, 'RapidStats is the in-house reporting and market analytics tool from ARMLS. Consider it your one-stop shop for reporting and analytics.' -- ProductDescription
		, 0x01 -- IsActive
		, 12 -- SubscriptionPeriod
		, 365 -- SubscriptionPeriodInDays
		, 0 -- InternalUseOnly
		, 1 -- AccountReceivableId
		, 1 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, 2 -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  12 -- ProductId
		, 1 -- ParentProductId (deprecated: check the PackageContents table)
		, 4 -- ProductTypeId
		, NULL -- SKU
		, 'Remine' -- ProductName
		, 0 -- Price
		, 'Remine' -- ProductDisplayName
		,'Remine uses data layers to illuminate real estate opportunities with intuitive map-based visualizations and push notifications with actionable intelligence so you can prospect for new buyers and sellers.' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0 -- InternalUseOnly
		, NULL -- AccountReceivableId
		, NULL -- ProductTier
		, 'https://armls.remine.com' -- ProductLaunchURL
		, 'remine-logo.png' -- ProductImage
		, 'remine.svg' -- ProductIcon
		, 5 -- Priority
		, 5 -- DisplayOrder
		, 9 -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  13 -- ProductId
		, 5 -- ParentProductId (deprecated: check the PackageContents table)
		, 4 -- ProductTypeId
		, NULL -- SKU
		, 'AgentSquared' -- ProductName
		, 0 -- Price
		, 'AgentSquared' -- ProductDisplayName
		, 'AgentSquared creates one-click agent websites and syncs with Flexmls. Unlike an iFrame, AgentSquared is a full website.' -- ProductDescription
		, 0x00 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0 -- InternalUseOnly
		, NULL -- AccountReceivableId
		, NULL -- ProductTier
		,'http://206.27.177.103/AgentSquared' -- ProductLaunchURL
		,'agentsquared-logo.png' -- ProductImage
		,'agentsquared.svg' -- ProductIcon
		, 2 -- Priority
		, 9 -- DisplayOrder
		, 10 -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  14 -- ProductId
		, 5 -- ParentProductId (deprecated: check the PackageContents table)
		, 4 -- ProductTypeId
		, NULL -- SKU
		, 'Mobile apps' -- ProductName
		, 0 -- Price
		, 'Mobile apps' -- ProductDisplayName
		, 'We will continue to offer multiple mobile options (Flexmls Pro, etc.).' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0 -- InternalUseOnly
		, NULL -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		,'mobile-apps-logo.png' -- ProductImage
		,'mobile_apps.svg' -- ProductIcon
		, 2 -- Priority
		, 25 -- DisplayOrder
		, 11 -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  15 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 4 -- ProductTypeId
		, NULL -- SKU
		, 'EasyGenerator' -- ProductName
		, 0 -- Price
		, 'EasyGenerator' -- ProductDisplayName
		, NULL -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0 -- InternalUseOnly
		, NULL -- AccountReceivableId
		, 1 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, 2 -- Priority
		, -1 -- DisplayOrder
		, 20 -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  20 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 2 -- ProductTypeId
		, NULL -- SKU
		, 'MLS Pro Subscription' -- ProductName
		, 324.00 -- Price
		, 'MLS Pro Subscription' -- ProductDisplayName
		, 'A new name for your 2018 subscriber fees with the tools you’re using today (Flexmls, Monsoon, ShowingTime, etc.).' -- ProductDescription
		, 0x00 -- IsActive
		, 12 -- SubscriptionPeriod
		, 365 -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, 1 -- AccountReceivableId
		, 1 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  21 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 3 -- ProductTypeId
		, NULL -- SKU
		, 'Advantage Bundle: Add-On' -- ProductName
		, 180.00 -- Price
		, 'Advantage Bundle: Add-On' -- ProductDisplayName
		, 'Advantage bundle of 5 elevated products for only $180, a savings of almost $1,800 a year off the retail price.' -- ProductDescription
		, 0x00 -- IsActive
		, 12 -- SubscriptionPeriod
		, 365 -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, 1 -- AccountReceivableId
		, 2 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  22 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 6 -- ProductTypeId
		, NULL -- SKU
		, 'Mobile Application Access Package' -- ProductName
		, 0 -- Price
		, 'Mobile Application Access Package' -- ProductDisplayName
		, 'Mobile Application Access Package' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, 1 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  23 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 8 -- ProductTypeId
		, NULL -- SKU
		, 'Office Staff MLS Pro Subscription' -- ProductName
		, 50.00 -- Price
		, 'Office Staff MLS Pro Subscription' -- ProductDisplayName
		, 'Your office staff account to work for an agent, office or brokerage.' -- ProductDescription
		, 0x01 -- IsActive
		, 3 -- SubscriptionPeriod
		, 90 -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, 1 -- AccountReceivableId
		, 1 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  24 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 2 -- ProductTypeId
		, NULL -- SKU
		, 'MLS Pro Subscription' -- ProductName
		, 342.00 -- Price
		, 'MLS Pro Subscription' -- ProductDisplayName
		, 'The name for your subscriber fees with the tools you’re using today (Flexmls, Monsoon, ShowingTime, etc.)' -- ProductDescription
		, 0x00 -- IsActive
		, 12 -- SubscriptionPeriod
		, 365 -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, 1 -- AccountReceivableId
		, 1 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  25 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 3 -- ProductTypeId
		, NULL -- SKU
		, 'Advantage Bundle: Add-On' -- ProductName
		, 210.00 -- Price
		, 'Advantage Bundle: Add-On' -- ProductDisplayName
		, 'Adds 5 elevated products for $210 (prorated if purchased after MLS Pro renewal), a 90% savings off the retail price.' -- ProductDescription
		, 0x00 -- IsActive
		, 12 -- SubscriptionPeriod
		, 365 -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, 1 -- AccountReceivableId
		, 2 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  26 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 2 -- ProductTypeId
		, NULL -- SKU
		, 'Rapid Stats' -- ProductName
		, 0.00 -- Price
		, 'Rapid Stats' -- ProductDisplayName
		, 'Rapid Stats Product Demo' -- ProductDescription
		, 0x00 -- IsActive
		, 3 -- SubscriptionPeriod
		, 90 -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, 1 -- AccountReceivableId
		, 2 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  27 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 2 -- ProductTypeId
		, NULL -- SKU
		, 'Simply Voting' -- ProductName
		, 0.00 -- Price
		, 'Simply Voting' -- ProductDisplayName
		, 'Simply Voting' -- ProductDescription
		, 0x00 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, 1 -- AccountReceivableId
		, 1 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, 17 -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  28 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 2 -- ProductTypeId
		, NULL -- SKU
		, 'MLS Pro Subscription' -- ProductName
		, 349.00 -- Price
		, 'MLS Pro Subscription' -- ProductDisplayName
		, 'The name for your subscriber fees with the tools you’re using today (Flexmls, Monsoon, etc.)' -- ProductDescription
		, 0x00 -- IsActive
		, 12 -- SubscriptionPeriod
		, 365 -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, 1 -- AccountReceivableId
		, 1 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, 1 -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  29 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 3 -- ProductTypeId
		, NULL -- SKU
		, 'Advantage Bundle: Add-On' -- ProductName
		, 250.00 -- Price
		, 'Advantage Bundle: Add-On' -- ProductDisplayName
		, 'Adds 6 elevated products for $250 (prorated if purchased after MLS Pro renewal), a 90% savings off the retail price.' -- ProductDescription
		, 0x00 -- IsActive
		, 12 -- SubscriptionPeriod
		, 365 -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, 1 -- AccountReceivableId
		, 2 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  31 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 4 -- ProductTypeId
		, NULL -- SKU
		, 'Cloud Attract' -- ProductName
		, 0.00 -- Price
		, 'Cloud Attract' -- ProductDisplayName
		,'With Cloud Attract you engage potential buyers and sellers with beautiful landing pages that automatically respond with a home valuation, CMA, or listing alerts.' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, NULL -- AccountReceivableId
		, NULL -- ProductTier
		, 'https://cloudagentsuite.com/connect/armls/initiate' -- ProductLaunchURL
		, 'cloud_attract.png' -- ProductImage
		, 'cloud_mlx.svg' -- ProductIcon
		, 2 -- Priority
		, 6 -- DisplayOrder
		, 21 -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  32 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 3 -- ProductTypeId
		, NULL -- SKU
		, 'Cloud Agent Suite' -- ProductName
		, 360.00 -- Price
		, 'Cloud Agent Suite' -- ProductDisplayName
		, 'Cloud Agent Suite gives real estate agents modern MLS tools for better CMAs, listing alerts, search, and lead generation.' -- ProductDescription
		, 0x01 -- IsActive
		, 12 -- SubscriptionPeriod
		, 365 -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, 1 -- AccountReceivableId
		, 1 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, 4 -- Priority
		, 3 -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  33 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 4 -- ProductTypeId
		, NULL -- SKU
		, 'RapidStats' -- ProductName
		, 0.00 -- Price
		, 'RapidStats' -- ProductDisplayName
		, 'With RapidStats you can create your own market reports, tailored to the areas you work. See how you compare to other agents with the Agent Metrics report. New features are being added regularly.' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, NULL -- AccountReceivableId
		, NULL -- ProductTier
		, CONCAT(@EnvironmentPrefix, 'rapidstats.com') -- ProductLaunchURL
		, 'rapid_stats.png' -- ProductImage
		, 'rapid_stats.svg' -- ProductIcon
		, 4 -- Priority
		, 4 -- DisplayOrder
		, 16 -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  34 -- ProductId
		, 5 -- ParentProductId (deprecated: check the PackageContents table)
		, 4 -- ProductTypeId
		, NULL -- SKU
		, 'ARMLS Class' -- ProductName
		, 0.00 -- Price
		, 'ARMLS Class' -- ProductDisplayName
		, 'ARMLS Class' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, NULL -- AccountReceivableId
		, 2 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, 22 -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  35 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 3 -- ProductTypeId
		, NULL -- SKU
		, 'Remine' -- ProductName
		, 360.00 -- Price
		, 'Remine' -- ProductDisplayName
		, 'Remine combines tax data, property data, and an easy-to-use color-coded map to prospect leads.' -- ProductDescription
		, 0x00 -- IsActive
		, 12 -- SubscriptionPeriod
		, 365 -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, 1 -- AccountReceivableId
		, 2 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, 4 -- Priority
		, 4 -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, '04/27/2022' -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  36 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 2 -- ProductTypeId
		, NULL -- SKU
		, 'RapidStats' -- ProductName
		, 45.00 -- Price
		, 'RapidStats' -- ProductDisplayName
		, 'RapidStats is the in-house reporting and market analytics tool provided by Markt. Consider it your one-stop shop for reporting and analytics.' -- ProductDescription
		, 0x01 -- IsActive
		, 3 -- SubscriptionPeriod
		, 90 -- SubscriptionPeriodInDays
		, 0 -- InternalUseOnly
		, 5 -- AccountReceivableId
		, 1 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, 1 -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 3 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  37 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 4 -- ProductTypeId
		, NULL -- SKU
		, 'RapidStats' -- ProductName
		, 0.00 -- Price
		, 'RapidStats' -- ProductDisplayName
		, 'With RapidStats you can create your own market reports, tailored to the areas you work. See how you compare to other agents with the Agent Metrics report. New features are being added regularly.' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, NULL -- AccountReceivableId
		, NULL -- ProductTier
		, CONCAT(@EnvironmentPrefix, 'rapidstats.com') -- ProductLaunchURL
		, 'rapid_stats.png' -- ProductImage
		, 'rapid_stats.svg' -- ProductIcon
		, 1 -- Priority
		, 1 -- DisplayOrder
		, 16 -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 3 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  38 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 2 -- ProductTypeId
		, NULL -- SKU
		, 'MLS Pro Subscription' -- ProductName
		, 395.00 -- Price
		, 'MLS Pro Subscription' -- ProductDisplayName
		, 'The name for your subscriber fees with the tools you’re using today (Flexmls, Monsoon, etc.)' -- ProductDescription
		, 0x01 -- IsActive
		, 12 -- SubscriptionPeriod
		, 365 -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, 1 -- AccountReceivableId
		, 1 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, 1 -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  39 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 2 -- ProductTypeId
		, NULL -- SKU
		, 'Flexmls' -- ProductName
		, 0.00 -- Price
		, 'Flexmls' -- ProductDisplayName
		, 'Our MLS runs on the Flexmls platform by FBS Data Systems out of Fargo, ND. The system has desktop, mobile and mobile web versions.' -- ProductDescription
		, 0x00 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, NULL -- AccountReceivableId
		, 1 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, 1 -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  40 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 2 -- ProductTypeId
		, NULL -- SKU
		, 'MLS Pro Subscription' -- ProductName
		, 450.00 -- Price
		, 'MLS Pro Subscription' -- ProductDisplayName
		, 'The name for your subscriber fees with the tools you’re using today (Flexmls, Monsoon, etc.)' -- ProductDescription
		, 0x00 -- IsActive
		, 12 -- SubscriptionPeriod
		, 365 -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, 1 -- AccountReceivableId
		, 1 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, 1 -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	), (
		  41 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 8 -- ProductTypeId
		, NULL -- SKU
		, 'Office Staff MLS Pro Subscription' -- ProductName
		, 65.00 -- Price
		, 'Office Staff MLS Pro Subscription' -- ProductDisplayName
		, 'Your office staff account to work for an agent, office or brokerage.' -- ProductDescription
		, 0x00 -- IsActive
		, 3 -- SubscriptionPeriod
		, 90 -- SubscriptionPeriodInDays
		, 0x00 -- InternalUseOnly
		, 1 -- AccountReceivableId
		, 1 -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 1 -- RevenueRecognitionTypeId
	),
	-- Violations
	(
		  101 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Information Leading to Bypass Own Agent' -- ProductName
		, 200 -- Price
		, 'Information Leading to Bypass Own Agent' -- ProductDisplayName
		, 'Violation of Rule(s) 11.5 - Information Leading to Bypass Own Agent' -- ProductDescription
		, 0x00 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  102 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Access Codes in Wrong Field' -- ProductName
		, 100 -- Price
		, 'Access Codes in Wrong Field' -- ProductDisplayName
		, 'Violation of Rule(s) 11.5 , 11.8 - Access Codes in Wrong Field' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  103 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Buyer''s Agent Bonus in Public Field' -- ProductName
		, 50 -- Price
		, 'Buyer''s Agent Bonus in Public Field' -- ProductDisplayName
		, 'Violation of Rule(s) 11.5 - Buyer''s Agent Bonus in Public Field' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  104 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Closed Status Incorrect' -- ProductName
		, 100 -- Price
		, 'Closed Status Incorrect' -- ProductDisplayName
		, 'Violation of Rule(s) 8.5 - Closed Status Incorrect' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  105 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Closed Status Incorrect (Rental Listing)' -- ProductName
		, 100 -- Price
		, 'Closed-Leased Status Incorrect' -- ProductDisplayName
		, 'Violation of Rule(s) 8.5 - Closed/Leased Status Incorrect' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  106 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Closed Status Incorrect (Response Req.)' -- ProductName
		, 100 -- Price
		, 'Closed Status Incorrect' -- ProductDisplayName
		, 'Violation of Rule(s) 8.5 - Closed Status Incorrect' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  107 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Closed Status Incorrect DOM on New Listing' -- ProductName
		, 100 -- Price
		, 'Closed Status Incorrect' -- ProductDisplayName
		, 'Violation of Rule(s) 8.5 - Closed Status Incorrect' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  108 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Comm Discussion-Invitation Comments' -- ProductName
		, 200 -- Price
		, 'Commission Discussion or Invitation' -- ProductDisplayName
		, 'Violation of Rule(s) 11.5 , 12.1 - Commission Discussion or Invitation' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  109 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Commission Comments in a Public Field' -- ProductName
		, 50 -- Price
		, 'Commission Comments in a Public Field' -- ProductDisplayName
		, 'Violation of Rule(s) 11.5 , 12.1 - Commission Comments in a Public Field' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  110 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Commission Cond Comment in Private Field' -- ProductName
		, 200 -- Price
		, 'Conditional Commission Comment' -- ProductDisplayName
		, 'Violation of Rule(s) 11.5 , 12.1 - Conditional Commission Comment' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  111 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Commission Field (zero amount)' -- ProductName
		, 200 -- Price
		, 'Commission Field' -- ProductDisplayName
		, 'Violation of Rule(s) 12.1 - Commission Field' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  112 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Contact Info in Media Description-Caption' -- ProductName
		, 200 -- Price
		, 'Contact Information in Media Description-Caption' -- ProductDisplayName
		, 'Violation of Rule(s) 8.23 - Contact Information in Media Description-Caption' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  113 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Contact Info on Photo (Reqs New Photo)' -- ProductName
		, 200 -- Price
		, 'Contact Information on Photo' -- ProductDisplayName
		, 'Violation of Rule(s) 8.23 , 8.24 - Contact Information on Photo' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  114 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Contact Info. and/or URL and/or Open House/Showing Info.' -- ProductName
		, 200 -- Price
		, 'Contact Info. and/or URL and/or Open House/Showing Info.' -- ProductDisplayName
		, 'Violation of Rule(s) 11.5 - Contact Information in a Public Field' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  115 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Contact Info on a Photo' -- ProductName
		, 200 -- Price
		, 'Contact Information on a Photo' -- ProductDisplayName
		, 'Violation of Rule(s) 8.23 - Contact Information on a Photo' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  116 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'DOM Manipulation' -- ProductName
		, 500 -- Price
		, 'Days on Market Manipulation' -- ProductDisplayName
		, 'Violation of Rule(s) 8.5 - Days on Market Manipulation' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  117 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Email Invalid or Missing' -- ProductName
		, 50 -- Price
		, 'Email Address' -- ProductDisplayName
		, 'Violation of Rule(s) 16.2 - Email Address' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  118 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Entity Name in Public Remarks' -- ProductName
		, 200 -- Price
		, 'Entity Name in Public Remarks' -- ProductDisplayName
		, 'Violation of Rule(s) 11.6 - Entity Name in Public Remarks' -- ProductDescription
		, 0x00 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  120 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Invalid Dual' -- ProductName
		, 50 -- Price
		, 'Dual Listing' -- ProductDisplayName
		, 'Violation of Rule(s) 8.6 - Dual Listing' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  121 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Invalid Listing' -- ProductName
		, 200 -- Price
		, 'Types of Property' -- ProductDisplayName
		, 'Violation of Rule(s) 8.1 - Types of Property' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  122 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'List Price' -- ProductName
		, 50 -- Price
		, 'List Price' -- ProductDisplayName
		, 'Violation of Rule(s) 8.11 - List Price' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  123 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'List Price Per Rental Verbiage' -- ProductName
		, 50 -- Price
		, 'List Price' -- ProductDisplayName
		, 'Violation of Rule(s) 8.11 - List Price' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  124 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'No Exterior Photo of Front of Dwelling' -- ProductName
		, 50 -- Price
		, 'No Exterior Photo of Front of Dwelling' -- ProductDisplayName
		, 'Violation of Rule(s) 8.24 - No Exterior Photo of Front of Dwelling' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  125 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Open House-Showing-Auction Info.' -- ProductName
		, 200 -- Price
		, ' Open House, Showing, or Auction Information' -- ProductDisplayName
		, 'Violation of Rule(s) 11.5 - Open House, Showing, or Auction Information' -- ProductDescription
		, 0x00 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  126 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Public PDF Doc Contains Buyer''s Agent Bonus' -- ProductName
		, 50 -- Price
		, 'Public PDF Doc Contains Buyer''s Agent Bonus' -- ProductDisplayName
		, 'Violation of Rule(s) 11.5 - Public PDF Document Contains Buyer''s Agent Bonus' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  127 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Public PDF Doc Contains Commission Comments' -- ProductName
		, 50 -- Price
		, 'Public PDF Doc Contains Commission Comments' -- ProductDisplayName
		, 'Violation of Rule(s) 11.5 12.1 - Public PDF Document Contains Commission Comments' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  128 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Public PDF Doc Contains Contact Info' -- ProductName
		, 200 -- Price
		, 'Public PDF Doc Contains Contact Info' -- ProductDisplayName
		, 'Violation of Rule(s) 8.23 - Public PDF Document Contains Contact Information' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  129 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'PDF Doc Contains Title Company Language' -- ProductName
		, 100 -- Price
		, 'PDF Doc Contains Title Company Language' -- ProductDisplayName
		, 'Violation of Rule(s) 11.5 - PDF Document Contains Title Company Language' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  130 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'PDF Doc Contains Access Code' -- ProductName
		, 100 -- Price
		, 'PDF Doc Contains Access Code' -- ProductDisplayName
		, 'Violation of Rule(s) 11.5, 11.8 - PDF Document Contains Access Code' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  131 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Status Incorrect as Ping' -- ProductName
		, 100 -- Price
		, 'Listing Status' -- ProductDisplayName
		, 'Violation of Rule(s) 10.7, 10.12 - Listing Status' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  132 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Photo(s) not of Listed Prop (Reqs Photo)' -- ProductName
		, 50 -- Price
		, 'No Exterior Photo of Front of Dwelling' -- ProductDisplayName
		, 'Violation of Rule(s) 8.24 - No Exterior Photo of Front of Dwelling' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  133 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Photo - Copied' -- ProductName
		, 200 -- Price
		, 'Copied Photo' -- ProductDisplayName
		, 'Violation of Rule(s) 8.23 - Copied Photo' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  134 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Photo - Copied (Reqs New Photo)' -- ProductName
		, 200 -- Price
		, 'Copied Photo' -- ProductDisplayName
		, 'Violation of Rule(s) 8.23 - Copied Photo' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  135 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Public Remarks Inappropriate Use of Field' -- ProductName
		, 200 -- Price
		, 'Inappropriate Use of Public Remarks' -- ProductDisplayName
		, 'Violation of Rule(s) 11.5, 11.6 - Inappropriate Use of Public Remarks' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  136	-- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Public Remarks - Gaining Access to Prop' -- ProductName
		, 200 -- Price
		, 'Inappropriate Use of Public Remarks' -- ProductDisplayName
		, 'Violation of Rule(s) 11.6 - Inappropriate Use of Public Remarks' -- ProductDescription
		, 0x00 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  137 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Selling Agent Incorrect' -- ProductName
		, 500 -- Price
		, 'Selling Agent' -- ProductDisplayName
		, 'Violation of Rule(s) 8.5 - Selling Agent' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  138 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Selling Agent Incorrect - Contact ARMLS' -- ProductName
		, 500 -- Price
		, 'Selling Agent' -- ProductDisplayName
		, 'Violation of Rule(s) 8.5 - Selling Agent' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  139 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Sold Price Incorrect' -- ProductName
		, 500 -- Price
		, 'Sold Price Incorrect ' -- ProductDisplayName
		, 'Violation of Rule(s) 8.5 - Sold Price Incorrect ' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  140 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Sold Price Incorrect for Rental Listing' -- ProductName
		, 500 -- Price
		, 'Sold Leased Price' -- ProductDisplayName
		, 'Violation of Rule(s) 8.5 - Sold Leased Price' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  141 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Status Incorrect - Cancel Due to Ownership' -- ProductName
		, 100 -- Price
		, 'Listing Status' -- ProductDisplayName
		, 'Violation of Rule(s) 8.2, 10.2 - Listing Status' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  142 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Status Incorrect as Active (UCB or P.)' -- ProductName
		, 100 -- Price
		, 'Listing Status' -- ProductDisplayName
		, 'Violation of Rule(s) 10.7 - Listing Status' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  143 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Status Incorrect as Active' -- ProductName
		, 100 -- Price
		, 'Listing Status' -- ProductDisplayName
		, 'Violation of Rule(s) 8.2, 10.7, 10.13 - Listing Status' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  144 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Status Incorrect as Active (Short Sale)' -- ProductName
		, 100 -- Price
		, 'Listing Status' -- ProductDisplayName
		, 'Violation of Rule(s) 10.7 - Listing Status' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  145 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Status Incorrect as Cancelled' -- ProductName
		, 100 -- Price
		, 'Listing Status' -- ProductDisplayName
		, 'Violation of Rule(s) 8.2, 10.7 - Listing Status' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  146 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Status Incorrect as Expired' -- ProductName
		, 100 -- Price
		, 'Listing Status' -- ProductDisplayName
		, 'Violation of Rule(s) 8.2, 10.7 - Listing Status' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  147 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Title Company Language' -- ProductName
		, 100 -- Price
		, 'Title Company Language' -- ProductDisplayName
		, 'Violation of Rule(s) 11.5 - Title Company Language' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  148 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Video Contains Contact Info' -- ProductName
		, 200 -- Price
		, 'Video Contains Contact Info' -- ProductDisplayName
		, 'Violation of Rule(s) 8.23, 8.24 - Video Contains Contact Information' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  149 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Virtual Tour - Copied' -- ProductName
		, 200 -- Price
		, 'Copied Virtual Tour' -- ProductDisplayName
		, 'Violation of Rule(s) 8.23 - Copied Virtual Tour' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  150 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Virtual Tour Contains Contact Info' -- ProductName
		, 200 -- Price
		, 'Virtual Tour Contains Contact Information' -- ProductDisplayName
		, 'Violation of Rule(s) 8.23, 8.24 - Virtual Tour Contains Contact Information' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  151 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Fair Housing Issues' -- ProductName
		, 200 -- Price
		, 'Fair Housing Language' -- ProductDisplayName
		, 'Violation of Rule(s) 11.5 - Fair Housing Language' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  152 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Status Incorrect as UCB' -- ProductName
		, 100 -- Price
		, 'Listing Status' -- ProductDisplayName
		, 'Violation of Rule(s) 10.7, 10.8, 10.12 - Listing Status' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  153 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Advertising a property without consent of Listing Subscriber' -- ProductName
		, 200 -- Price
		, 'Advertising a property without consent of Listing Subscriber' -- ProductDisplayName
		, 'Violation of Rule(s) 10.11 - Advertising a property without consent of Listing Subscriber' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  154 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Misuse of Data - Trashed' -- ProductName
		, 500 -- Price
		, 'Misuse of Data that Misleads' -- ProductDisplayName
		, 'Violation of Rule(s) 8.5 - Misuse of Data that Misleads' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  155 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'PDF Doc Private Cond Commission Comment' -- ProductName
		, 200 -- Price
		, 'Conditional Commission Comments' -- ProductDisplayName
		, 'Violation of Rule(s) 11.5, 12.1 - Conditional Commission Comments' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  156 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Status Incorrect as TOM' -- ProductName
		, 100 -- Price
		, 'Listing Status' -- ProductDisplayName
		, 'Violation of Rule(s) 8.2, 10.7, 10.13 - Listing Status' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  157 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'DOM Manipulation- Contained Wrong Info.' -- ProductName
		, 500 -- Price
		, 'Days on Market Manipulation' -- ProductDisplayName
		, 'Violation of Rule(s) 8.5 - Days on Market Manipulation' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  158 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Open House-Showing-Auction on Photo OR in Caption-Description' -- ProductName
		, 200 -- Price
		, 'Open House, Showing, or Auction info on Photo or Other Public Attachment' -- ProductDisplayName
		, 'Violation of Rule(s) 11.5 - Open House, Showing, or Auction info on Photo or Other Public Attachment' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  159 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, '13.1 Lockbox on Property without Permission L1' -- ProductName
		, 500 -- Price
		, 'Authorization to Use Lockbox' -- ProductDisplayName
		, 'Level 1 Violation of Rule(s) 13.1 Authorization to Use a Lockbox' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x01 -- RequiresLockboxSerialNumber
		, 0x01 -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  160 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, '13.1 Lockbox on Property without Permission L2' -- ProductName
		, 1000 -- Price
		, 'Authorization to Use Lockbox' -- ProductDisplayName
		, 'Level 2 Violation of Rule(s) 13.1 Authorization to Use a Lockbox' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x01 -- RequiresLockboxSerialNumber
		, 0x01 -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  161 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, '13.2 Removing Keys from the Listed Property L1' -- ProductName
		, 500 -- Price
		, 'Removing Keys from the Listed Property' -- ProductDisplayName
		, 'Level 1 Violation of Rule(s) 13.2 Removing Keys from the Listed Property ' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x01 -- RequiresLockboxSerialNumber
		, 0x01 -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  162 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, '13.2 Removing Keys from the Listed Property L2' -- ProductName
		, 1000 -- Price
		, 'Removing Keys from the Listed Property' -- ProductDisplayName
		, 'Level 2 Violation of Rule(s) 13.2 Removing Keys from the Listed Property ' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x01 -- RequiresLockboxSerialNumber
		, 0x01 -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  163 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, '13.3 Key Used by Non-Licensee' -- ProductName
		, 2000 -- Price
		, 'Lockbox Keys - Sharing with a Non- Licensee' -- ProductDisplayName
		, 'Violation of Rule(s) 13.3 Lockbox Keys - Shared with Non-Licensee' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x01 -- RequiresLockboxSerialNumber
		, 0x01 -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  164 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, '13.3 Key Used by Another Key Subscriber L1' -- ProductName
		, 500 -- Price
		, 'Lockbox Keys - Sharing with another Key Subscriber' -- ProductDisplayName
		, 'Level 1 Violation of Rule(s) 13.3 Lockbox Keys - Shared with another Key Subscriber'-- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x01 -- RequiresLockboxSerialNumber
		, 0x01 -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  165 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, '13.3 Key Used by Another Key Subscriber L2' -- ProductName
		, 1000 -- Price
		, 'Lockbox Keys - Sharing with another Key Subscriber' -- ProductDisplayName
		, 'Level 2 Violation of Rule(s) 13.3 Lockbox Keys - Shared with another Key Subscriber' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x01 -- RequiresLockboxSerialNumber
		, 0x01 -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  166 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, '13.3 Key Used by Non-Key Subscriber' -- ProductName
		, 1000 -- Price
		, 'Lockbox Keys - Shared with a Licensee, non Key Subscriber ' -- ProductDisplayName
		, 'Violation of Rule(s) 13.3 Lockbox Keys - Shared with Non-Key Subscriber' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x01 -- RequiresLockboxSerialNumber
		, 0x01 -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  167 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, '13.4 Use of Lockbox Access L1' -- ProductName
		, 500 -- Price
		, 'Use of Lockbox Access' -- ProductDisplayName
		, 'Level 1 Violation of Rule(s) 13.4 - Use of Lockbox Access' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x01 -- RequiresLockboxSerialNumber
		, 0x01 -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  168 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, '13.4 Use of Lockbox Access L2' -- ProductName
		, 1000 -- Price
		, 'Use of Lockbox Access' -- ProductDisplayName
		, 'Level 2 Violation of Rule(s) 13.4 - Use of Lockbox Access' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x01 -- RequiresLockboxSerialNumber
		, 0x01 -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  169 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, '13.5 Timely Removal of a Lockbox L1' -- ProductName
		, 500 -- Price
		, 'Failure of Timely Removal of Lockbox' -- ProductDisplayName
		, 'Level 1 Violation of Rule(s) 13.5 - Failure of Timely Removal of Lockbox' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x01 -- RequiresLockboxSerialNumber
		, 0x00 -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  170 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, '13.5 Timely Removal of a Lockbox L2' -- ProductName
		, 1000 -- Price
		, 'Failure of Timely Removal of Lockbox' -- ProductDisplayName
		, 'Level 2 Violation of Rule(s) 13.5 - Failure of Timely Removal of Lockbox' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x01 -- RequiresLockboxSerialNumber
		, 0x00 -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  171 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, '13.6 Removed Lockbox from a Property L1' -- ProductName
		, 500 -- Price
		, 'Removal of Lockbox by Unauthorized Indivdiduals' -- ProductDisplayName
		, 'Level 1 Violation of Rule(s) 13.6 - Removal of Lockbox by Unauthorized Individuals' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x01 -- RequiresLockboxSerialNumber
		, 0x01 -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  172 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, '13.6 Removed Lockbox from a Property L2' -- ProductName
		, 1000 -- Price
		, 'Removal of Lockbox by Unauthorized Indivdiduals' -- ProductDisplayName
		, 'Level 2 Violation of Rule(s) 13.6 - Removal of Lockbox by Unauthorized Individuals' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x01 -- RequiresLockboxSerialNumber
		, 0x01 -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  173 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Lockbox Keys - Utilized another Subscribers Key (Level 1)' -- ProductName
		, 500 -- Price
		, 'Lockbox Keys - Utilized another Subscribers Key' -- ProductDisplayName
		, 'Level 1 Violation of Rule(s) 13.3 Lockbox Keys' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x01 -- RequiresLockboxSerialNumber
		, 0x01 -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  174 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Lockbox Keys - Utilized another Subscribers Key (Level 2)' -- ProductName
		, 1000 -- Price
		, 'Lockbox Keys - Utilized another Subscribers Key' -- ProductDisplayName
		, 'Level 2 Violation of Rule(s) 13.3 Lockbox Keys' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x01 -- RequiresLockboxSerialNumber
		, 0x01 -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  175 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Disclosure of Lockbox Code(s) without Permission (Level 1)' -- ProductName
		, 500 -- Price
		, 'Disclosure of Lockbox Code(s) without Permission' -- ProductDisplayName
		, 'Level 1 Violation of Rule(s) 13.4 - Disclosure of Lockbox Code' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x00 -- RequiresLockboxSerialNumber
		, 0x00 -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  176 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Disclosure of Lockbox Code(s) without Permission (Level 2)' -- ProductName
		, 1000 -- Price
		, 'Disclosure of Lockbox Code(s) without Permission' -- ProductDisplayName
		, 'Level 2 Violation of Rule(s) 13.4 - Disclosure of Lockbox Code' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x00 -- RequiresLockboxSerialNumber
		, 0x00 -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  177 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, '8.0 Clear Cooperation' -- ProductName
		, 250 -- Price
		, '8.0 – Clear Cooperation' -- ProductDisplayName
		, 'Violation of Rule(s) 8.0 – Clear Cooperation' -- ProductDescription
		, 0x00 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x00 -- RequiresLockboxSerialNumber
		, 0x00 -- RequiresLockboxKeyNumber
		, 0x01 -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  178 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, '8.0 Clear Cooperation' -- ProductName
		, 500 -- Price
		, '8.0 – Clear Cooperation' -- ProductDisplayName
		, 'Violation of Rule(s) 8.0 – Clear Cooperation' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x00 -- RequiresLockboxSerialNumber
		, 0x00 -- RequiresLockboxKeyNumber
		, 0x01 -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  179 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, '3rd Party' -- ProductName
		, 100 -- Price
		, '3rd Party' -- ProductDisplayName
		, 'Violation of Rule(s) 11.5 & 11.6 Third-Party Promotional Language' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, 0x00 -- RequiresLockboxSerialNumber
		, 0x00 -- RequiresLockboxKeyNumber
		, 0x00 -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	)
	-- Other (not products, packages, or violations)
	, (
		  201 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Other' -- ProductName
		, 0 -- Price
		, 'Other' -- ProductDisplayName
		, 'Please specify a description' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  202 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Waived' -- ProductName
		, 0 -- Price
		, 'Waived' -- ProductDisplayName
		, 'Waived for specific reason' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		  203 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Discount' -- ProductName
		, 0 -- Price
		, 'Discount' -- ProductDisplayName
		, 'Discount -- Please specify a percentage' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	), (
		204 -- ProductId
		, NULL -- ParentProductId (deprecated: check the PackageContents table)
		, 1 -- ProductTypeId
		, NULL -- SKU
		, 'Appeal fee' -- ProductName
		, 0 -- Price
		, 'Appeal Fee' -- ProductDisplayName
		, 'Appeal Fee -- Please specify an amount' -- ProductDescription
		, 0x01 -- IsActive
		, NULL -- SubscriptionPeriod
		, NULL -- SubscriptionPeriodInDays
		, 0x01 -- InternalUseOnly
		, 2 -- AccountReceivableId
		, NULL -- ProductTier
		, NULL -- ProductLaunchURL
		, NULL -- ProductImage
		, NULL -- ProductIcon
		, NULL -- Priority
		, NULL -- DisplayOrder
		, NULL -- SsoClientId
		, NULL -- RequiresLockboxSerialNumber
		, NULL -- RequiresLockboxKeyNumber
		, NULL -- RequiresAddress
		, NULL -- FixedEndDate
		, 1 -- MlsId
		, 2 -- RevenueRecognitionTypeId
	)
)
AS Source 
	(ProductId, ParentProductId, ProductTypeId, SKU, ProductName, Price, ProductDisplayName, ProductDescription, IsActive
	, SubscriptionPeriod, SubscriptionPeriodInDays, InternalUseOnly, AccountReceivableId, ProductTier, ProductLaunchURL, ProductImage, ProductIcon, Priority, DisplayOrder, SsoClientId, RequiresLockboxSerialNumber, RequiresLockboxKeyNumber, RequiresAddress, FixedEndDate, MlsId, RevenueRecognitionTypeId)
ON Target.ProductId = Source.ProductId
WHEN NOT MATCHED BY TARGET THEN 
INSERT 
	(ProductId, ParentProductId, ProductTypeId, SKU, ProductName, Price, ProductDisplayName, ProductDescription, IsActive
	, SubscriptionPeriod, SubscriptionPeriodInDays, InternalUseOnly, AccountReceivableId, ProductTier, ProductLaunchURL, ProductImage, ProductIcon, Priority, DisplayOrder, SsoClientId, RequiresLockboxSerialNumber, RequiresLockboxKeyNumber, RequiresAddress, FixedEndDate, MlsId, RevenueRecognitionTypeId)
VALUES
	(ProductId, ParentProductId, ProductTypeId, SKU, ProductName, Price, ProductDisplayName, ProductDescription, IsActive
	, SubscriptionPeriod, SubscriptionPeriodInDays, InternalUseOnly, AccountReceivableId, ProductTier, ProductLaunchURL, ProductImage, ProductIcon, Priority, DisplayOrder, SsoClientId, RequiresLockboxSerialNumber, RequiresLockboxKeyNumber, RequiresAddress, FixedEndDate, MlsId, RevenueRecognitionTypeId)
WHEN MATCHED THEN 
	UPDATE SET 
		ProductId = source.ProductId
		, ParentProductId = source.ParentProductId
		, ProductTypeId = source.ProductTypeId
		, SKU = source.SKU
		, ProductName = source.ProductName
		, Price = source.Price
		, ProductDisplayName = source.ProductDisplayName
		, ProductDescription = source.ProductDescription
		, IsActive = source.IsActive
		, SubscriptionPeriod = source.SubscriptionPeriod
		, SubscriptionPeriodInDays = source.SubscriptionPeriodInDays
		, InternalUseOnly = source.InternalUseOnly
		, AccountReceivableId = source.AccountReceivableId
		, ProductTier = source.ProductTier
		, ProductLaunchURL = source.ProductLaunchURL
		, ProductImage = source.ProductImage
		, ProductIcon = source.ProductIcon
		, Priority = source.Priority
		, DisplayOrder = source.DisplayOrder
		, SsoClientId = source.SsoClientId
		, RequiresLockboxSerialNumber = source.RequiresLockboxSerialNumber
		, RequiresLockboxKeyNumber = source.RequiresLockboxKeyNumber
		, RequiresAddress = source.RequiresAddress
		, FixedEndDate = source.FixedEndDate
		, MlsId = source.MlsId
		, RevenueRecognitionTypeId = source.RevenueRecognitionTypeId;

DECLARE @ArmlsAvailableToRecognizeAccountNumber INT;
DECLARE @MarktAvailableToRecognizeAccountNumber INT;
SELECT @ArmlsAvailableToRecognizeAccountNumber = AccountNo FROM fin.Accounts WHERE AccountDescription = 'ARMLS Available To Recognize';
SELECT @MarktAvailableToRecognizeAccountNumber = AccountNo FROM fin.Accounts WHERE AccountDescription = 'Markt Available To Recognize';

UPDATE [Catalog].Products
SET AvailableToRecognizeAccountNumber = @ArmlsAvailableToRecognizeAccountNumber
WHERE AccountReceivableId = 1

UPDATE [Catalog].Products
SET AvailableToRecognizeAccountNumber = 2 -- ARMLS Fine
WHERE AccountReceivableId = 2

UPDATE [Catalog].Products
SET AvailableToRecognizeAccountNumber = @MarktAvailableToRecognizeAccountNumber
WHERE AccountReceivableId = 5