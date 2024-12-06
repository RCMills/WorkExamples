CREATE FUNCTION dbo.udf_R_ProductPricing
(
	@ProductId int,
	@EntityId int,
	@ProratedPricing bit,
	@IsAddOn BIT
)
RETURNS money
AS
BEGIN

	declare @LastYear DateTimeOffset = CAST('2019-01-01' as datetimeoffset) AT TIME ZONE 'US Mountain Standard Time';
	declare @return money;  -- Removed the default value because of the COALESCE in the caller R Mills 16 Jan 2019
	DECLARE @ProductPrice MONEY;
	DECLARE @Today datetimeoffset = CAST(GetUTCDate() as datetimeoffset) AT TIME ZONE 'US MOUNTAIN STANDARD TIME';

	IF EXISTS(SELECT IndividualGroupId FROM dbo.Individual WHERE EntityId = @EntityId)
	BEGIN

		-- welche verbandsmitgliedschaft hat ein Jahresmitgliedsbeitrag?

		SELECT 
			@EntityId = S.EntityId 
		FROM 
			subs.Subscriptions S
		INNER JOIN [Catalog].Products P ON
			P.ProductId = S.ProductId
		INNER JOIN (SELECT EntityId FROM dbo.udf_R_EntityGroup(@EntityId)) grp ON
			grp.EntityId = S.EntityId
		WHERE 
			S.IsActive = 0x01
		AND P.ProductTypeId = 2
		AND @Today <= S.SubscriptionEndDate;


	END

	IF @ProratedPricing = 0x00
	BEGIN

		-- This section exists to allow override pricing to be applied
		-- Override pricing exists when subscribers get a special price for their next subscription due to having that subscription in the past
		-- This code at this point is deprecated because we wrote it to grant a special price for the Advantage Bundle in 2019 if they had purchased it in 2018
		-- Since there is no one left with a real Advantage Bundle subscription that was purchased in 2018, this code will never matter,
		-- however, we should leave it here to easily grant this capability again in the future

		SELECT
			@return = COALESCE(OP.OverridePrice, p.Price)
		FROM
			Catalog.Products p 
		INNER JOIN subs.Subscriptions S ON
			S.ProductId = P.ProductId
		LEFT OUTER JOIN Catalog.OverridePricing OP ON
			OP.ExistingProductId = P.ProductId
		AND OP.UpgradeProductId = @ProductId
		WHERE
			S.EntityId = @EntityId
		AND DATEADD(MONTH, -1 * S.SubscriptionPeriod, S.SubscriptionEndDate) <= @LastYear -- purchased last year
		AND SubscriptionEndDate >= CAST(GetUtcDate() as datetimeoffset) AT TIME ZONE 'US MOUNTAIN STANDARD TIME'
		AND OP.ProductTypeId = P.ProductTypeId;

	END
	ELSE IF @ProratedPricing = 0x01
	BEGIN

		DECLARE @CurrentBaseSubscriptionId INT = NULL;
		DECLARE @CurrentBaseSubscriptionEndDate DATETIME2 = NULL;
		DECLARE @FixedEndDate DATE;
		DECLARE @CalculatedProductEndDate DATE;
		DECLARE @DaysLeftInSubscription INT;

		SELECT
			  @CurrentBaseSubscriptionEndDate = s.SubscriptionEndDate
			, @CurrentBaseSubscriptionId = active.SubscriptionId
		FROM dbo.udf_R_EntityActiveBaseSubscription(@EntityId) active
		INNER JOIN Subs.Subscriptions s
			ON active.SubscriptionId = s.SubscriptionId

		-- This section exists to get the pro-rated price if one exists for the product being checked
		-- Pro-rated pricing is applied when a subscriber is adding an add-on for the remainder of their base subscription
		-- OR when a subscriber is adding an add-on with a fixed end date
		IF @IsAddOn = 0x01
		BEGIN

			DECLARE @TotalDaysInBaseSubscription INT;

			SELECT @FixedEndDate = FixedEndDate
			FROM [Catalog].Products
			WHERE ProductId = @ProductId

			SELECT
				@TotalDaysInBaseSubscription = DATEDIFF(DAY, DATEADD(MONTH, -1 * P.SubscriptionPeriod, CAST(S.SubscriptionEndDate as DateTime)), CAST(S.SubscriptionEndDate as DateTime))
			FROM 
				Subs.Subscriptions S
			INNER JOIN [Catalog].Products P ON
				P.ProductId = S.ProductId
			INNER JOIN dbo.udf_R_EntityActiveBaseSubscription(@EntityId) b
				ON S.SubscriptionId = b.SubscriptionId;

			IF @FixedEndDate IS NULL OR @FixedEndDate >= @CurrentBaseSubscriptionEndDate
			BEGIN
			
				/*
					Has subscription, add-on, fixed end dates are after end of current base subscription
						Use end of current base subscription for all packages
						Use the price pro-rated to the end of the current base subscription for all packages
				*/

				SELECT @DaysLeftInSubscription = DATEDIFF(DAY, @Today, @CurrentBaseSubscriptionEndDate)

				SELECT @ProductPrice = Price FROM [Catalog].Products WHERE ProductId = @ProductId AND IsActive = 0x01;

				SELECT @return = @DaysLeftInSubscription * (@ProductPrice / @TotalDaysInBaseSubscription);

				SELECT @return = ROUND(CASE WHEN @return > @ProductPrice THEN @ProductPrice ELSE @return END, 0);

			END
			ELSE
			BEGIN

				/*
					Has subscription, add-on, fixed end dates are before end of current base subscription
						Use end of current base subscription for all packages except those that have fixed end dates before the end of the current base subscription, in which case use the fixed end date
						Use the price pro-rated to the end of the current base subscription for all packages except those that have fixed end dates before the end of the current base subscription, in which case use the price pro-rated to the fixed end date
				*/
				SELECT @DaysLeftInSubscription = DATEDIFF(DAY, @Today, @FixedEndDate)

				SELECT @ProductPrice = Price FROM [Catalog].Products WHERE ProductId = @ProductId AND IsActive = 0x01;

				SELECT @return = @DaysLeftInSubscription * (@ProductPrice / @TotalDaysInBaseSubscription);

				SELECT @return = ROUND(CASE WHEN @return > @ProductPrice THEN @ProductPrice ELSE @return END, 0);

			END

		END
		ELSE
		BEGIN

			IF @CurrentBaseSubscriptionId IS NULL
			BEGIN

				SELECT
					  @CalculatedProductEndDate = DATEADD(MM, SubscriptionPeriod, @Today)
					, @FixedEndDate = FixedEndDate
				FROM [Catalog].Products
				WHERE ProductId = @ProductId

				IF @FixedEndDate IS NULL OR @FixedEndDate >= @CalculatedProductEndDate
				BEGIN

					/*
						No subscription, renewal, fixed end dates are beyond end of product's calculated end date (typically one year)
							Use product's calculated end date from today (typically one year) for all packages
							Use full price for all packages
					*/

					SELECT @return = Price FROM [Catalog].Products WHERE ProductId = @ProductId AND IsActive = 0x01;

				END
				ELSE
				BEGIN

					/*
						No subscription, renewal, fixed end dates are before end of product's calculated end date (typically one year)
							Use product's calculated end date from today (typically one year) for all packages except those that have fixed end dates nearer than a year
							Use the full price for all packages except those that have fixed end dates nearer than a year, in which case use the price pro-rated to the fixed end date
					*/

					SELECT @DaysLeftInSubscription = DATEDIFF(DAY, @Today, @FixedEndDate)

					SELECT @ProductPrice = Price FROM [Catalog].Products WHERE ProductId = @ProductId AND IsActive = 0x01;

					SELECT @return = @DaysLeftInSubscription * (@ProductPrice / 365);

					SELECT @return = ROUND(CASE WHEN @return > @ProductPrice THEN @ProductPrice ELSE @return END, 0);

				END

			END
			ELSE
			BEGIN

				SELECT
					  @CalculatedProductEndDate = DATEADD(MM, SubscriptionPeriod, @CurrentBaseSubscriptionEndDate)
					, @FixedEndDate = FixedEndDate
				FROM [Catalog].Products
				WHERE ProductId = @ProductId

				IF @FixedEndDate IS NULL OR @FixedEndDate >= @CalculatedProductEndDate
				BEGIN

					/*
						Has subscription, renewal, fixed end dates are beyond one year
							Use one year from end of current base subscription for all packages
							Use full price for all packages
					*/
					SELECT @return = Price FROM [Catalog].Products WHERE ProductId = @ProductId AND IsActive = 0x01;

				END
				ELSE
				BEGIN

					/*
						Has subscription, renewal, fixed end dates are before one year
							Use one year from end of current base subscription for all packages except those that have fixed end dates nearer than a year
							Use the full price for all packages except those that have fixed end dates nearer than a year, in which case use the price pro-rated from the end of current base subscription to the fixed end date
					*/

					SELECT @DaysLeftInSubscription = DATEDIFF(DAY, DATEADD(DAY, 1, @CurrentBaseSubscriptionEndDate), @FixedEndDate)

					SELECT @ProductPrice = Price FROM [Catalog].Products WHERE ProductId = @ProductId AND IsActive = 0x01;

					SELECT @return = @DaysLeftInSubscription * (@ProductPrice / 365);

					SELECT @return = ROUND(CASE WHEN @return > @ProductPrice THEN @ProductPrice ELSE @return END, 0);

				END

			END

		END

	END

	RETURN @return;

END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[udf_R_ProductPricing] TO [Atlas]
    AS [dbo];

