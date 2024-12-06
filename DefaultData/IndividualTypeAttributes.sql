DECLARE @Attributes TABLE(
	AttributeId int,
	AttributeName varchar(50),
	DataType varchar(50))

INSERT @Attributes (AttributeId, AttributeName, DataType)
VALUES (1, 'LogonTypeDisplay', 'varchar')
	,(2, 'AtlasMemberType','varchar')
	,(3, 'VisibleInMainSearch', 'bit')
	,(4, 'UsesDefaultSubscription', 'bit')
	,(5, 'DefaultSubscriptionEntityId', 'int')
	,(6, 'RequiresNRDSId', 'bit')
	,(7, 'RequiresLicenseNumber', 'bit')
	,(8, 'CanBeCreated','bit');

MERGE dbo.IndividualTypeAttributes AS TARGET
USING @Attributes AS SOURCE ON
	(TARGET.AttributeId = SOURCE.AttributeId)
WHEN MATCHED THEN 
	UPDATE
		SET AttributeName = SOURCE.AttributeName
			, AttributeDataType = SOURCE.DataType
WHEN NOT MATCHED THEN
	INSERT(
		AttributeId,
		AttributeName,
		AttributeDataType)
	VALUES(
		SOURCE.AttributeId
		, SOURCE.AttributeName
		, SOURCE.DataType);

GO