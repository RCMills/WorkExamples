CREATE FUNCTION dbo.udf_R_BrokerDetails
(@BrokerageEntityId int)
RETURNS TABLE
AS

RETURN (
	SELECT
		O.EntityID as [entityId]
		,O.[Name] as brokerageName
		,dbo.udf_R_EntityPhone(O.EntityID) as phone
		,dbo.udf_R_EntityEmail(O.EntityID) as email
		,O.[URL] as logoURL
		,O.UserName as shortId
FROM
	dbo.Office as O
WHERE
	O.EntityID = @BrokerageEntityId 
	);