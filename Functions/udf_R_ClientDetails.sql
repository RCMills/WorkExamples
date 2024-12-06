CREATE FUNCTION dbo.udf_R_ClientDetails
(@EntityId int, @MemberType varchar(100), @ParentEntityId int)
RETURNS TABLE
AS
/************************************************************************************
*							usp_R_EntityDetails2
*
*	Purpose: Return details for a given entity with respect for the type of Entity
*
*	Testing Entities in QA:  declare @EntityId int = --207209 (Client) --207177(Agent);
*
*	Author: Robert Mills
*
*	Origination Date : 15 Feb 2018
*
*	History
*	Revision		By			Date			WorkItem		Change
*	0001			UNKNOWN		UNKNOW		N/A				Hatched
*
************************************************************************************/


RETURN(

	SELECT
		MT.[AtlasMemberType] as [memberType]
		,I.[EntityID] as [entityId]
		,I.AspNetUserId AS [aspNetUserId]
		,I.ParentEntityId as [parentEntityId]
		,I.FirstName as [firstName]
		,I.LastName as [lastName]
		,I.UserName as [shortId]
		,ECP.ContactMethod as [contactMethod]
		,ECP.ContactPreference as [contactPreference]
		,AD.AddressLine1 AS [address1]
		,AD.AddressLine2 as [address2]
		,AD.City as [city]
		,AD.[State] as [state]
		,AD.Zip as [zip]
		,dbo.udf_R_EntityEmail(I.[EntityID]) as [email]
		,dbo.udf_R_EntityPhone(I.[EntityID]) as [phone]
FROM
	dbo.Individual as I 
INNER JOIN dbo.IndividualType as MT ON
	MT.IndividualTypeId = I.IndividualTypeId
AND MT.MLSID = I.MLSID
LEFT OUTER JOIN dbo.Addresses as AD ON
	AD.EntityID = I.[EntityID]
AND AD.IsPrimary = 0x01
LEFT OUTER JOIN dbo.EntityContactPreference as ECP ON
	ECP.EntityID = I.[EntityID]
AND ECP.IsActive = 0x01
WHERE
	I.[EntityID] = @EntityId

	);