CREATE PROCEDURE [dbo].[usp_R_Profile]
	@EntityID int
/***********************************************************************************
*						usp_R_Profile
*
*	Purpose: Return basic information about the EntityID calling
*
*	Author: Robert Mills
*
*	Origination Date: 26 Feb 2018
*
*	History
*	Revision	By		Date			WorkItem		Change
*	0001		RCM		26 Feb 2018		N/A				Birth
*	0002		CSC		20180403		N/A				Updates for table changes
*	0003		CSC		20180517		N/A				Update to use Active instead of ActiveStatus
*	0004		CSC		20180612		N/A				Update to include ArmlsLogonType which is the same as FlexMemberType
*	0005		CSC		20180731		N/A				Added Assc and Compliance status to returns 
*  0006			RCM	3 Sept 2020					Added MlsStatus to select list
*	0007		AW		20210330		8037			Added HasOpenCases
**********************************************************************************/
AS
	SELECT
		id.EntityId AS [entityId]
		,id.[username] AS [shortId]
		,id.FirstName AS [firstName]
		,id.LastName AS [lastName]
		,id.MlsStatus [mlsStatus]
		,it.[AtlasMemberType] AS [memberType]
		,[LogonTypeDisplay] AS [armlsLogonType]
		,it.ManageVisibleInLists as [visibleInLists]
		,id.[Active] as [activeStatus]
		,id.FbsBillable as [fbsBillable]
		,id.SystemAccess as [systemAccess]
		, dbo.udf_R_EntityEmail(id.EntityId) AS [email]
		, dbo.udf_R_IndividualAssociationStatus(id.EntityId) AS [individualAssociationStatus]
		, dbo.udf_R_IndividualComplianceStatus(id.EntityId) AS [individualComplianceStatus]
		, CASE 
			WHEN dbo.udf_R_HasActiveSubscription(id.EntityId) = 0x01 
			THEN 'Active'
			ELSE 'Inactive'
		END AS [individualSubscriptionStatus]
		, dbo.udf_R_IndividualAtlasStatus(id.EntityId) AS [individualAtlasStatus]
		, CASE WHEN id.IndividualTypeId = 7 AND osq.FlexId IS NOT NULL THEN 1 ELSE 0 END AS AtlasOfficeStaff
		, id.MLSID
		, m.DisplayText AS MLSDisplayText
		, id.IndividualGroupId
		, id.PhotoURL
		, id.FlexId
		, id.AspNetUserId
		, dbo.udf_R_HasOpenCases(id.EntityId) AS HasOpenCases
	FROM
		dbo.Individual AS id
	INNER JOIN dbo.IndividualType it ON Id.IndividualTypeId = it.IndividualTypeId and id.MLSID = it.MLSID
	LEFT OUTER JOIN dbo.OfficeStaffQueue osq ON id.FlexId = osq.FlexId
	LEFT OUTER JOIN dbo.MLS m ON id.MLSID = m.MLSId
	WHERE 
		id.EntityId = @EntityId
	FOR JSON PATH;
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_R_Profile] TO [Atlas]
    AS [dbo];

