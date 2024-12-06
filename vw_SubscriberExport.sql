CREATE VIEW dbo.vw_SubscriberExport 
AS
SELECT  
	EntityId
	, UserName
	, IndividualTypeId
	, FirstName
	, MiddleName
	, LastName
	, FlexId
	, Active
	, SystemAccess
	, MlsStatus
	, Email
	, [OfficeEntityId]
	, [OfficeName]
	, SubscriptionId
	, SubscriptionEndDate
	, IsActive
	, AssociationName
	, [LastModifiedDate] 
FROM 
	dbo.udf_R_SubscriberExport();
GO