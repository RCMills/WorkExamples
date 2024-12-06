CREATE VIEW [dbo].[vw_IndividualType]
	AS 

	SELECT
	 IndividualTypeId
    , MLSID 
	, LogonType
	, pvt.[LogonTypeDisplay]
	, pvt.[AtlasMemberType]
	, pvt.[VisibleInMainSearch]
	, pvt.[UsesDefaultSubscription]
	, pvt.[DefaultSubscriptionEntityId]
	, pvt.[CanBeCreated]
	, pvt.[RequiresLicenseNumber]
	, pvt.[RequiresNRDSId]
FROM
	(
	SELECT
		ITN.LogonType
		, ITN.MLSID
		, ITN.IndividualTypeId
		, ITA.AttributeName
		, COALESCE(ITSV.[StringValue], CAST(ITBV.[BitValue] as varchar(50)), ISNULL(CAST(ITIV.[IntegerValue] as varchar(50)), 0)) [Value] 
	FROM
		dbo.IndividualTypeAttributes ITA   -- this is the hub
	LEFT OUTER JOIN dbo.IndividualTypeStringValue ITSV ON
		ITSV.AttributeId = ITA.AttributeId
	LEFT OUTER JOIN dbo.IndividualTypeBitValue ITBV ON
		ITBV.AttributeId = ITA.AttributeId
	LEFT OUTER JOIN dbo.IndividualTypeIntegerValue ITIV ON 
		ITIV.AttributeId = ITA.AttributeId
	LEFT OUTER JOIN dbo.IndividualType_New ITN ON
		(ITN.ITID = ITSV.ITID 
		OR ITN.ITID = ITBV.ITID 
		OR ITN.ITID = ITIV.ITID)
	) AS [core]
	PIVOT(
		MAX([value])
	FOR 
		[core].[AttributeName] 
	IN 
		(
			[LogonTypeDisplay], 
			[AtlasMemberType], 
			[VisibleInMainSearch], 
			[UsesDefaultSubscription], 
			[DefaultSubscriptionEntityId],
			[CanBeCreated],
			[RequiresLicenseNumber],
			[RequiresNRDSId]
		)
	) as [pvt]


GO

