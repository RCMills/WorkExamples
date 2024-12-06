CREATE PROCEDURE dbo.[usp_R_AgentBusinessCard]
(
	@EntityId int
)
AS
/**************************************************************************************************************
*					usp_R_AgentBusinessCard
*
*	Purpose: Get data for the Agent Business Card view
*
*	Author: Robert Mills
*
*	Origination Date: 20 July 2020
*
*	History
*	Revision		By			Date			Change
*	0001			RCM			20 July 2020		Birth (https://armls-dev.visualstudio.com/Atlas/_sprints/taskboard/Atlas/Atlas/Sprint%203?workitem=2990)
*	0002			RCM			18 Aug 2020		3771 - Updated return value to be Office Phone as listed by the Office
* 0003				RCM			28 Sept 2020		Updated select list to return office address instead of member primary address
**************************************************************************************************************/

SELECT
	ad.entityId
,	ad.armlsLogonType
,	ad.firstName
, 	ad.middleName
, 	ad.lastName
, 	ad.shortId [userName]
, 	ad.photoUrl
, 	ad.officeAddress1 [address1]
, 	ad.officeAddress2 [address2]
, 	ad.officeCity [city]
,	ad.[officeState] [state]
, 	ad.officeZip [zip]
, 	ad.email
, 	ad.phone [primaryPhone]
, 	ad.OfficePhone [officePhone]
, 	pns.mobile [mobilePhone]
, 	pns.officeFax [fax]
, 	ad.officeName
, 	ad.officeShortId
, 	ad.licenseNumber
, 	ad.officeLicenseNumber
, 	ad.NRDSId
, 	ad.website
, 	ass.associationName
,	ad.memberType

FROM
	dbo.udf_R_AgentDetails(@EntityId) ad
LEFT OUTER JOIN dbo.Association ass on
	ass.AssociationId = ad.AssociationId
OUTER APPLY dbo.udf_R_Phones(ad.entityId) pns

GO

GRANT EXECUTE ON dbo.usp_R_AgentBusinessCard to Atlas;
GO
