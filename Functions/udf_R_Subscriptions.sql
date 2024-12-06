CREATE FUNCTION dbo.udf_R_Subscriptions()
RETURNS @Subs TABLE(
	EntityId int,
	SubscriptionId int,
	SubscriptionEndDate datetimeoffset,
	ProductId int,
	LastUpdatedDate datetime,
	IsActive bit)
AS
BEGIN
;with Subscriptions
as(
SELECT
	subs.EntityId,
	MAX(subs.SubscriptionId) [SubscriptionId],
	MAX(subs.SubscriptionEndDate) [SubscriptionEndDate],
	MAX(subs.ProductId) [ProductId],
	MAX(subs.ActiveFrom) [LastUpdatedDate]
FROM
	subs.Subscriptions subs
GROUP BY
	subs.EntityId)

INSERT 
	@Subs
SELECT
	EntityId,
	SubscriptionId,
	SubscriptionEndDate,
	ProductId,
	LastUpdatedDate,
	CASE WHEN SubscriptionEndDate >= CAST(GetUtcDate() as datetimeoffset) AT TIME ZONE 'US MOUNTAIN STANDARD TIME' THEN 1 ELSE 0 END [IsActive]
FROM	
	Subscriptions
ORDER BY
	EntityId ASC;

	RETURN;
END
GO
