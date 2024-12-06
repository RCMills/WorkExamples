CREATE FUNCTION dbo.udf_R_EntityActiveBaseSubscription (
	@EntityId INT
)
RETURNS TABLE
AS

	RETURN
		SELECT SubscriptionId
		FROM (
			SELECT
				  ROW_NUMBER() OVER (PARTITION BY s.EntityId ORDER BY SubscriptionEndDate DESC) [RowNumber]
				, SubscriptionId
			FROM Subs.Subscriptions S
			INNER JOIN [Catalog].Products P
				ON P.ProductId = S.ProductId
			INNER JOIN (SELECT EntityId FROM dbo.udf_R_EntityGroup(@EntityId)) grp
				ON grp.EntityId = S.EntityId
			WHERE 
				S.IsActive = 0x01 
				AND CAST(GETUTCDATE() AS DATETIMEOFFSET) AT TIME ZONE 'US MOUNTAIN STANDARD TIME' <= S.SubscriptionEndDate
				AND P.ProductTypeId IN (2, 8) -- Base Product Id
		) subs
		WHERE RowNumber = 1