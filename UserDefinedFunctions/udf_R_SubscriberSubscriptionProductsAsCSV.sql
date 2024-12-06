CREATE FUNCTION dbo.udf_R_SubscriberSubscriptionProductsAsCSV()
RETURNS @Subscibers TABLE(EntityId int, Products nvarchar(1000))
AS
BEGIN

;with Subscriptions(EntityId, Products)
AS (

		SELECT
			En.EntityId
			, dbo.udf_R_ProductsAsCSV(Subs.ProductId) [products]
		FROM
			dbo.Individual EN
		INNER JOIN subs.Subscriptions Subs ON
			Subs.EntityId = EN.EntityId
		WHERE
			Subs.SubscriptionEndDate >= SYSDATETIMEOFFSET()
		AND Subs.IsActive = 0x01
	)

	INSERT 
		@Subscibers
	SELECT 
		EntityId
		, dbo.Concatenate(Products) [Products] 
	FROM 
		Subscriptions 
	WHERE 
		Products <> '' 
	GROUP BY 
		EntityId;

	RETURN;
END
