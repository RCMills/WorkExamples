
CREATE FUNCTION [dbo].[udf_R_AddOnOrderEntity]
(
	@EntityId int
)
RETURNS @returntable TABLE
(
	SoldToEntityId int,
	IsUpgrade bit
)
AS
BEGIN

	declare @SubscriberEntityId int;
	declare @SubscriptionEndDate datetimeoffset;
	declare @MaxProductId int;
	declare @MaxProductTypeId smallint;
	declare @SubscriptionStartDate datetimeoffset;
	declare @IsUpgrade bit = 0x00;

	IF EXISTS(SELECT 
					* 
				FROM 
					subs.Subscriptions 
				WHERE 
					EntityId IN (SELECT EntityId FROM dbo.udf_R_EntityGroup(@EntityId)) 
				AND IsActive = 0x01 
				AND S.SubscriptionEndDate >= CAST(Current_timestamp as datetimeoffset) AT TIME ZONE 'US MOUNTAIN STANDARD TIME')
	BEGIN

		SELECT
			@SubscriberEntityId = S.EntityId
			, @SubscriptionEndDate = MAX(S.SubscriptionEndDate)
			, @MaxProductId = MAX(S.ProductId)
		FROM
			subs.Subscriptions S
		WHERE
			S.EntityId IN (SELECT EntityId FROM dbo.udf_R_EntityGroup(@EntityId))
		AND S.IsActive = 0x01
		AND S.SubscriptionEndDate >= CAST(Current_timestamp as datetimeoffset) AT TIME ZONE 'US MOUNTAIN STANDARD TIME'
		GROUP BY
			EntityId;

		SELECT 
			@SubscriptionStartDate = DATEADD(MONTH, -1 * P.SubscriptionPeriod, @SubscriptionEndDate)
			, @MaxProductTypeId = ProductTypeId
		FROM 
			[catalog].Products P 
		WHERE 
			P.ProductId = @MaxProductId

		IF @MaxProductTypeId = 3 SET @IsUpgrade = 0x01;

		-- The first block will find the existing subscription and the EntityId used on it, if it exists
		INSERT @returntable(
				SoldToEntityId
				, IsUpgrade)
			SELECT 
				@SubscriberEntityId
				, @IsUpgrade

			return;
		END
		ELSE
		BEGIN
			-- This code gets hit when the member is new
			IF NOT EXISTS(SELECT * FROM @returntable)
			BEGIN
			-- No need to hit the entity group function because no curent subscriptions exist
				INSERT @returntable VALUES (@EntityId, 0x0);
				return;
			END
		END

	RETURN;
END