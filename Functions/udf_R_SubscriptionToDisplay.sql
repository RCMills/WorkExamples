CREATE FUNCTION dbo.[udf_R_SubscriptionToDisplay]
(
	@EntityId int
)
RETURNS @ToDisplay TABLE (SubscriptionId INT)
AS
BEGIN

	DECLARE @TimeZone nvarchar(256) = 'US Mountain Standard Time';

	DECLARE @Entities TABLE (EntityId int);

	INSERT @Entities SELECT EntityId FROM dbo.udf_R_EntityGroup(@EntityId);

		;with Subs(SubscriptionId, SubscriptionEndDate, ProductTier, ProductId)
		AS(

		SELECT
			MAX(SubscriptionId)
			, MAX(SubscriptionEndDate)
			, MAX(P.ProductTier) [MaxProductTier]
			, MAX(P.ProductId)
		FROM
			subs.Subscriptions S
		INNER JOIN [Catalog].Products P ON
			P.ProductId = S.ProductId
		INNER JOIN @Entities E ON
			E.EntityId = S.EntityId
		WHERE
			s.IsActive = 0x01
		AND	CAST(GETDATE() AT TIME ZONE @TimeZone AS DATETIMEOFFSET) 
				BETWEEN DATEADD(MONTH, -s.SubscriptionPeriod, CAST(s.SubscriptionEndDate AT TIME ZONE @TimeZone AS DATETIMEOFFSET))
					AND CAST(s.SubscriptionEndDate AT TIME ZONE @TimeZone AS DATETIMEOFFSET)
		GROUP BY P.ProductId

			UNION ALL

		-- Future subscription
		SELECT
			MAX(SubscriptionId)
			, MAX(SubscriptionEndDate)
			, MAX(P.ProductTier) [MaxProductTier]
			, MAX(P.ProductId)
		FROM
			subs.Subscriptions S
		INNER JOIN [Catalog].Products P ON
			P.ProductId = S.ProductId
		INNER JOIN @Entities E ON
			S.EntityId = E.EntityId
		WHERE
			s.IsActive = 0x01
		AND	CAST(DATEADD(DAY, 45, CURRENT_TIMESTAMP) AT TIME ZONE @TimeZone AS DATETIMEOFFSET) -- 45 days into the future to account for the window of renewal
				BETWEEN DATEADD(MONTH, -s.SubscriptionPeriod, CAST(s.SubscriptionEndDate AT TIME ZONE @TimeZone AS DATETIMEOFFSET))
					AND CAST(s.SubscriptionEndDate AT TIME ZONE @TimeZone AS DATETIMEOFFSET)
		GROUP BY P.ProductId)

		INSERT 
			@ToDisplay
		SELECT 
			MIN(SubscriptionId)
		FROM 
			Subs 
		GROUP BY ProductId

		RETURN;
END