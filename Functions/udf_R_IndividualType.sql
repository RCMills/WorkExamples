CREATE FUNCTION [dbo].[udf_R_IndividualType]()
RETURNS TABLE
AS

RETURN(
		SELECT 
		IndividualTypeId
		, MLSID
		, LogonType
		, LogonTypeDisplay
		, AtlasMemberType
		, ISNULL(VisibleInMainSearch, 0) [VisibleInMainSearch]
		, ISNULL(UsesDefaultSubscription, 0) [UsesDefaultSubscription]
		, DefaultSubscriptionEntityId
		, IsNULL(CanBeCreated, 0) [CanBeCreated]
		, ISNULL(RequiresLicenseNumber, 0) [RequiresLicenseNumber]
		, ISNULL(RequiresNRDSId, 0) [RequiresNRDSId]
	 from 
		vw_IndividualType);

GO

GRANT SELECT ON [dbo].[udf_R_IndividualType] TO [ATLAS];
GO

