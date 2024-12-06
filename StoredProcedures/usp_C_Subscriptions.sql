CREATE PROCEDURE usp_C_Subscriptions
@OrderLineItems dbo.OrderLineItems READONLY
, @CreatedByEntityId INT
, @SubscriptionDate DATETIME
, @SubscriptionEndDate DATETIMEOFFSET
, @SubscriptionPeriod INT
AS
/*
*************************************************************************************************
*							usp_C_Subscriptions
*
*	Purpose: Create multiple subscription based on values passed in 
*
*	Author: Brandon Hicks
*
*
*	History
*	Revision	By		Date		Change
*	0001		BSH		20201223	Birth
*************************************************************************************************
*/
BEGIN
DECLARE @SubEndDate DateTimeOffset;
DECLARE @TimeZone nvarchar(256) = 'US Mountain Standard Time';
DECLARE @HasExistingBaseSub BIT = 0x00;


IF @SubscriptionDate IS NULL
	SET @SubscriptionDate = GETDATE();

INSERT INTO subs.Subscriptions 
	(ProductId, EntityId, OrderNumber, SubscriptionDate, SubscriptionPeriod, SubscriptionEndDate, IsActive, LastModifiedEntityId)

SELECT 
ProductId
, PurchasedForEntityId
, OrderNumber
, @SubscriptionDate
, @SubscriptionPeriod
, CASE WHEN SubscriptionEndDate IS NOT NULL AND SubscriptionEndDate < @SubscriptionEndDate THEN SubscriptionEndDate ELSE @SubscriptionEndDate END --Check if there is a subscription end date in the orderLineItems as this can override the overall subscription end date set in previous sprocs
, 0x01
, @CreatedByEntityId
FROM @OrderLineItems
WHERE ProductTypeId IN (2,3,6,7,8)

END