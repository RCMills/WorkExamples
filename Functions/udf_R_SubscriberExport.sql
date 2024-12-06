create function dbo.udf_R_SubscriberExport() 
returns table
AS

RETURN (
	SELECT 
	 I.EntityId
	, I.UserName
	, I.IndividualTypeId
	, I.FirstName
	, I.MiddleName
	, I.LastName
	, I.FlexId
	, I.Active
	, I.SystemAccess
	, I.MlsStatus
	, E.Email
	, O.EntityId [OfficeEntityId]
	, O.[Name] [OfficeName]
	, subs.SubscriptionId
	, ISNULL(subs.SubscriptionEndDate, '1900-01-01') SubscriptionEndDate
	, subs.IsActive
	, A.AssociationName
	, ISNULL(subs.LastUpdatedDate, '1900-01-01') [LastModifiedDate]
FROM
	dbo.Individual I
INNER JOIN dbo.IndividualType IT ON
	IT.IndividualTypeId = I.IndividualTypeId
AND IT.MLSID = I.MLSID
LEFT OUTER JOIN dbo.EntityAssociation EA ON
	EA.EntityId = I.EntityId
AND EA.IsPrimary = 0x01
LEFT OUTER JOIN dbo.Association A ON
	A.AssociationId = EA.AssociationId
LEFT OUTER JOIN dbo.IndividualOffice IOO ON
	IOO.IndividualEntityId = I.EntityId
LEFT OUTER JOIN dbo.Office O ON
	O.EntityId = IOO.OfficeEntityId
LEFT OUTER JOIN (SELECT EntityId, SubscriptionId, SubscriptionEndDate, ProductId, IsActive, LastUpdatedDate FROM dbo.udf_R_Subscriptions()) subs ON	
	subs.EntityId = I.EntityId
LEFT OUTER JOIN dbo.Emails E ON
	E.EntityId = I.EntityId
AND E.IsPrimary = 0x01
WHERE
	IT.SubscriberExport = 0x01)

GO

