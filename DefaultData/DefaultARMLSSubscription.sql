DECLARE @EntityId INT;
DECLARE @SubscriptionDate DATETIME = GETUTCDATE();
DECLARE @SubscriptionPeriod INT = 12;
DECLARE @SubscriptionPeriodInDays INT;
DECLARE @SubscriptionEndDate DATETIMEOFFSET = DATEADD(MONTH, @SubscriptionPeriod, CAST(@SubscriptionDate AS DATETIMEOFFSET) AT TIME ZONE 'US MOUNTAIN STANDARD TIME');
DECLARE @ProductId INT;
DECLARE @OrderNumber INT = 0;
DECLARE @IsActive BIT = 0x01;
DECLARE @IsExpired BIT = 0x00;

IF EXISTS (SELECT 1 FROM Subs.Subscriptions WHERE EntityId < 0 AND SubscriptionEndDate > '12/31/2800')
BEGIN

	UPDATE Subs.Subscriptions
	SET
		  SubscriptionEndDate = DATEADD(MONTH, @SubscriptionPeriod, SubscriptionDate)
		, SubscriptionPeriod = @SubscriptionPeriod
		, SubscriptionPeriodInDays = DATEDIFF(DAY, SubscriptionDate, DATEADD(MONTH, @SubscriptionPeriod, SubscriptionDate))
	WHERE
		EntityId < 0
		AND SubscriptionEndDate > '12/31/2800'

	IF EXISTS (SELECT 1 FROM Subs.Subscriptions WHERE EntityId < 0 AND SubscriptionEndDate < GETDATE() AND IsActive = 0x01 AND ISNULL(IsExpired, 0x00) = 0x00)
	BEGIN

		UPDATE Subs.Subscriptions
		SET
			  IsActive = 0x00
			, IsExpired = 0x01
		WHERE
			EntityId < 0
			AND SubscriptionEndDate < GETDATE()

	END

END

SET @EntityId = -1; -- Fake EntityId for associated with ARMLS MLS Staff and SAMLS MLS Staff

IF NOT EXISTS(SELECT * FROM subs.Subscriptions WHERE EntityId = @EntityId AND SubscriptionEndDate > DATEADD(DAY, 46, GETDATE()))
BEGIN

	SET @SubscriptionEndDate = (SELECT TOP 1 DATEADD(MONTH, @SubscriptionPeriod, SubscriptionEndDate) FROM Subs.Subscriptions WHERE SubscriptionEndDate > GETDATE() AND EntityId = @EntityId)
	SET @SubscriptionEndDate = ISNULL(@SubscriptionEndDate, DATEADD(MONTH, @SubscriptionPeriod, GETDATE()))
	SELECT @SubscriptionPeriodInDays = DATEDIFF(DAY, DATEADD(MONTH, -1 * @SubscriptionPeriod, @SubscriptionEndDate), @SubscriptionEndDate)

	SET @ProductId = 38; -- MLS Pro Subscription

	INSERT subs.Subscriptions (EntityId, SubscriptionDate, SubscriptionPeriod, SubscriptionPeriodInDays, SubscriptionEndDate, ProductId, OrderNumber, IsActive, IsExpired)
	VALUES (@EntityId, @SubscriptionDate, @SubscriptionPeriod, @SubscriptionPeriodInDays, @SubscriptionEndDate, @ProductId, @OrderNumber, @IsActive, @IsExpired);

	SET @ProductId = 32; -- Cloud Agent Suite

	INSERT subs.Subscriptions (EntityId, SubscriptionDate, SubscriptionPeriod, SubscriptionPeriodInDays, SubscriptionEndDate, ProductId, OrderNumber, IsActive, IsExpired)
	VALUES (@EntityId, @SubscriptionDate, @SubscriptionPeriod, @SubscriptionPeriodInDays, @SubscriptionEndDate, @ProductId, @OrderNumber, @IsActive, @IsExpired);

	SET @ProductId = 11; -- RapidStats

	INSERT subs.Subscriptions (EntityId, SubscriptionDate, SubscriptionPeriod, SubscriptionPeriodInDays, SubscriptionEndDate, ProductId, OrderNumber, IsActive, IsExpired)
	VALUES (@EntityId, @SubscriptionDate, @SubscriptionPeriod, @SubscriptionPeriodInDays, @SubscriptionEndDate, @ProductId, @OrderNumber, @IsActive, @IsExpired);

END

SET @EntityId = -2; -- Fake EntityId associated with ARMLS Association Staff

IF NOT EXISTS(SELECT * FROM subs.Subscriptions WHERE EntityId = @EntityId AND SubscriptionEndDate > DATEADD(DAY, 46, GETDATE()))
BEGIN

	SET @SubscriptionEndDate = (SELECT TOP 1 DATEADD(MONTH, @SubscriptionPeriod, SubscriptionEndDate) FROM Subs.Subscriptions WHERE SubscriptionEndDate > GETDATE() AND EntityId = @EntityId)
	SET @SubscriptionEndDate = ISNULL(@SubscriptionEndDate, DATEADD(MONTH, @SubscriptionPeriod, GETDATE()))
	SELECT @SubscriptionPeriodInDays = DATEDIFF(DAY, DATEADD(MONTH, -1 * @SubscriptionPeriod, @SubscriptionEndDate), @SubscriptionEndDate)

	SET @ProductId = 39; -- Flexmls
	
	INSERT subs.Subscriptions (EntityId, SubscriptionDate, SubscriptionPeriod, SubscriptionPeriodInDays, SubscriptionEndDate, ProductId, OrderNumber, IsActive, IsExpired)
	VALUES (@EntityId, @SubscriptionDate, @SubscriptionPeriod, @SubscriptionPeriodInDays, @SubscriptionEndDate, @ProductId, @OrderNumber, @IsActive, @IsExpired);

END

SET @EntityId = -3; -- Fake EntityId associated with Metro MLS Staff

IF NOT EXISTS(SELECT * FROM subs.Subscriptions WHERE EntityId = @EntityId AND SubscriptionEndDate > DATEADD(DAY, 46, GETDATE()))
BEGIN

	SET @SubscriptionEndDate = (SELECT TOP 1 DATEADD(MONTH, @SubscriptionPeriod, SubscriptionEndDate) FROM Subs.Subscriptions WHERE SubscriptionEndDate > GETDATE() AND EntityId = @EntityId)
	SET @SubscriptionEndDate = ISNULL(@SubscriptionEndDate, DATEADD(MONTH, @SubscriptionPeriod, GETDATE()))
	SELECT @SubscriptionPeriodInDays = DATEDIFF(DAY, DATEADD(MONTH, -1 * @SubscriptionPeriod, @SubscriptionEndDate), @SubscriptionEndDate)

	SET @ProductId = 36; -- Metro RapidStats
	
	INSERT subs.Subscriptions (EntityId, SubscriptionDate, SubscriptionPeriod, SubscriptionPeriodInDays, SubscriptionEndDate, ProductId, OrderNumber, IsActive, IsExpired)
	VALUES (@EntityId, @SubscriptionDate, @SubscriptionPeriod, @SubscriptionPeriodInDays, @SubscriptionEndDate, @ProductId, @OrderNumber, @IsActive, @IsExpired);

END