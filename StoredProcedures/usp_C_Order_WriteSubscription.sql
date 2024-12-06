CREATE PROCEDURE dbo.[usp_C_Order_WriteSubscription]
(
	@OrderLineItems dbo.[OrderLineItems] READONLY
	, @CreatedByEntityId int
	, @OrderDate datetime
)
AS
/************************************************************************************************************************************
*						usp_C_Order_WriteSubscription
*
*	Purpose: Write the Subscription data
*
*	Author: Robert Mills
*
*	Origination Date: 6 Sept 2019
*
*	History:
*	Revision	By		Date			Change
*	0001		RCM		6 Sept 2019		Birth
*	0002		BSH		28 Dec 2020		Adding support for multiple addons
*
************************************************************************************************************************************/

	declare @CurrentSubscriptionEndDate datetimeoffset;
	declare @SubscriberEntityId int;
	declare @TimeZone nvarchar(50) = N'US Mountain Standard Time';
	declare @ProductId int;
	declare @SubscriptionPeriod int;
	declare @OrderNumber int;
	declare @SubEndDate datetimeoffset;
	declare @ProductTier tinyint;

	select 
		@SubscriberEntityId = MAX(li.PurchasedForEntityId)
		, @SubscriptionPeriod = MAX(li.SubscriptionPeriod)
	from 
		@OrderLineItems LI

	DECLARE @ViolationProdType INT = 1;
	DECLARE @BasePackageProdType INT = 2;
	DECLARE @AddOnPackageProdType INT = 3;
	DECLARE @PackageContentProdType INT = 4;
	DECLARE @RefundProdType INT = 5;
	DECLARE @AppAccessProdType INT = 6;
	DECLARE @BasePackNonUpgradeProdType INT = 7;
	DECLARE @BasePackageOfficeStaffProdType INT = 8;

	-- get the current subscription end date if it exists
	SELECT 
		@CurrentSubscriptionEndDate = MAX(sub.SubscriptionEndDate) 
	FROM 
		subs.Subscriptions sub
	INNER JOIN [Catalog].Products prd ON 
		sub.ProductId = prd.ProductId 
	AND prd.ProductTypeId IN (@BasePackageProdType, @BasePackNonUpgradeProdType, @BasePackageOfficeStaffProdType)  -- can only extend a base 
	WHERE 
		sub.EntityId = @SubscriberEntityId
	AND sub.SubscriptionEndDate >= CAST(@OrderDate as datetimeoffset) AT TIME ZONE @TimeZone  -- current subscription should end today or in the future
	AND sub.IsActive = 0x01;									
							
	--Check if it's a renewal
	IF EXISTS (SELECT* FROM @OrderLineItems OLI	WHERE ProductTypeId IN (@BasePackageProdType, @BasePackNonUpgradeProdType, @BasePackageOfficeStaffProdType))
		BEGIN
			SELECT @SubEndDate = CAST(DATEADD(MONTH,  @SubscriptionPeriod, COALESCE(@CurrentSubscriptionEndDate, @OrderDate ))as datetimeoffset ) AT TIME ZONE @TimeZone;
		END
	ELSE
		BEGIN
			SET @SubEndDate = @CurrentSubscriptionEndDate
		END
	
	IF EXISTS (SELECT * FROM @OrderLineItems WHERE ProductTypeId IN (@BasePackageProdType, @BasePackNonUpgradeProdType, @BasePackageOfficeStaffProdType, @AddOnPackageProdType))
		BEGIN
			EXEC usp_C_Subscriptions @OrderLineItems = @OrderLineItems, @CreatedByEntityId = @CreatedByEntityId
									, @SubscriptionDate = @OrderDate, @SubscriptionEndDate = @SubEndDate, @SubscriptionPeriod = @SubscriptionPeriod						
						
		END