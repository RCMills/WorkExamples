CREATE FUNCTION dbo.udf_R_GetAllActiveSubscribers
(
	@ProcessDate Date -- No Time, this will be 0 hour
)
RETURNS @Subscribers TABLE(
EntityId int,
OrderNumber INT,
AccountNo int,
SubscriptionDailyAmount money)
AS
BEGIN

	INSERT @Subscribers (EntityId, OrderNumber, AccountNo, SubscriptionDailyAmount)
						SELECT 
							S.EntityId,
							s.OrderNumber,
							trn.AccountNo,
							SUM(CAST((oli.Price / DATEDIFF(DAY, @ProcessDate, (DATEADD(MONTH, P.SubscriptionPeriod, @ProcessDate)))) as money)) AS SubscriptionDailyAmount
						FROM 
							subs.Subscriptions AS S
						INNER JOIN Catalog.Products as P ON P.ProductId = S.ProductId AND P.RevenueRecognitionTypeId = 1 --Only want subscribers who purchased packages that recognize on a daily basis
						INNER JOIN Orders.OrderLineItem oli ON S.OrderNumber = oli.OrderNumber AND P.ProductId = oli.ProductId
						INNER JOIN	fin.TransactionHeader trn ON S.OrderNumber = trn.OrderNumber AND trn.OrderLineItem = oli.OrderLineItem
						INNER JOIN fin.Accounts act ON trn.AccountNo = act.AccountNo

						WHERE 
							CAST(@ProcessDate as DateTime) AT TIME ZONE 'US Mountain Standard Time' BETWEEN DATEADD(MONTH, -1 * S.SubscriptionPeriod, S.SubscriptionEndDate) AND S.SubscriptionEndDate
							AND	S.SubscriptionPeriod > 0
							AND	S.OrderNumber <> 0 -- These are added by default for particular subscribers
							AND	S.IsActive = 0x01
							AND act.AccountTypeId = 1 -- only want accounts for subscribers, join on tranheader returns others
							AND trn.TransactionTypeId = 1 -- only want the records for money being deposited to the account for the order
						GROUP BY 
							s.EntityId, trn.AccountNo, s.OrderNumber, trn.OrderLineItem							
							
RETURN;
		
END
GO
GRANT SELECT
    ON OBJECT::[dbo].[udf_R_GetAllActiveSubscribers] TO [Atlas]
    AS [dbo];


    

