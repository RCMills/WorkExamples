CREATE FUNCTION [dbo].[udf_R_SubscriptionStatus]
(
	@SubscriptionId INT
)
RETURNS VARCHAR(20)
AS
BEGIN
	DECLARE @TimeZone VARCHAR(50) = 'US Mountain Standard Time';
	DECLARE @SubscriptionStatus VARCHAR(20);
	
	SELECT @SubscriptionStatus = 
		CASE 
			WHEN subs.IsActive = 0x01 AND SYSDATETIMEOFFSET()
					BETWEEN DATEADD(MONTH, -subs.SubscriptionPeriod, subs.SubscriptionEndDate)
					AND subs.SubscriptionEndDate 
				THEN 'Active'
			WHEN subs.IsActive = 0x01 
					AND SYSDATETIMEOFFSET() <
						CAST(DATEADD(mm, -subs.SubscriptionPeriod, subs.SubscriptionEndDate) AS datetimeoffset) AT TIME ZONE @TimeZone
				THEN 'Pending'
			WHEN subs.IsExpired = 0x01 AND subs.IsActive = 0x01
				THEN 'Expired'
			WHEN ord.OrderStatusTypeId IN(3,4,5) and subs.IsActive = 0x00
				THEN 'Returned'
			WHEN subs.IsActive = 0x00
				THEN 'Canceled'
		END 
	FROM
	subs.Subscriptions subs
		INNER JOIN Catalog.Products prd ON subs.ProductId = prd.ProductId
		INNER JOIN Catalog.ProductTypes prdt ON prdt.ProductTypeId = prd.ProductTypeId
		LEFT JOIN Orders.[Order] ord ON ord.OrderNumber = subs.OrderNumber
	WHERE subs.SubscriptionId = @SubscriptionId;



	RETURN @SubscriptionStatus;
END