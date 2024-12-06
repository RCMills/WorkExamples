CREATE FUNCTION dbo.udf_R_AgentDetails
(@AgentEntityId int)
RETURNS TABLE
AS
/***************************************************************************************************
*					 udf_R_AgentDetails
*
*	Purpose: Agent Details for the EntityID supplied
*
*	Author: Chris Coneybeer
*
*	Origination Date: Unknown
*
*	History
*	Revision		By			Date			WorkItem	
*	0001			CSC			20180730		Added assc and compliance status
*	0002			RCM			20180820		Added lookup against AgentCode table to get Agent Code, rules say if no Agent code then use Username a.k.a. shortId
*	0003			CSC			20181009		Made changes to add [canManageOfficeStaff]
*	0004			RCM			20200715		Added MLS qualifier to canManageOfficeStaff flag determination
*	0005			RCM			20202007		added a few columns for new agent business card
*  0006			RCM			21 Oct 2020	Added Past Presidents flag
***************************************************************************************************/

RETURN(

	SELECT
	  MT.[AtlasMemberType] as memberType
	, [LogonTypeDisplay] as [armlsLogonType]
	, MT.[IndividualTypeDescription]
	, I.[EntityID] as entityId
	, I.AspNetUserId AS [aspNetUserId]
	, I.FirstName as firstName
	, I.MiddleName as middleName
	, I.LastName as lastName
	, I.UserName as shortId
	, I.PhotoURL as photoURL
	, I.FlexId as flexId
	, I.MlsStatus
	, I.VisibleInLists as [visibleInLists]
	, I.FbsBillable as [fbsBillable]
	, I.[Active] as [activeStatus]
	, I.SystemAccess as [systemAccess]
	, AD.AddressLine1 as address1
	, AD.AddressLine2 as address2
	, AD.City as city
	, AD.[State] as [state]
	, AD.Zip as zip
	, dbo.udf_R_EntityEmail(I.[EntityID]) as email
	, dbo.udf_R_EntityPhone(I.[EntityID]) as phone
	, A.AssociationId
	, ofc.[name] AS officeName
	, ofcadd.AddressLine1 AS officeAddress1
	, ofcadd.AddressLine2 AS officeAddress2
	, ofcadd.City AS officeCity
	, ofcadd.[State] AS officeState
	, ofcadd.Zip AS officeZip
	, ofcph.Phone AS officePhone
	, ofcph.Extension AS officePhoneExt
	, ofcem.Email AS officeEmail
	, ofc.[URL] as [URL]
	, ofc.PhotoLocation as [OfficephotoURL]
	, ofc.UserName AS [OfficeShortId]
	, ofc.OfficeId
	, dbo.udf_R_IndividualAssociationStatus(I.EntityId) AS [IndividualAssociationStatus]
	, dbo.udf_R_IndividualComplianceStatus(i.EntityId) AS [IndividualComplianceStatus]
	, dbo.udf_R_IndividualAtlasStatus(i.EntityId) AS [IndividualAtlasStatus]
	, CASE 
		WHEN dbo.udf_R_HasActiveSubscription(i.EntityId) = 0x01 
		THEN 'Active'
		ELSE 'Inactive'
	END AS [IndividualSubscriptionStatus]
	, CAST(CASE 
		WHEN EXISTS (SELECT * FROM dbo.Office WHERE BrokerEntityId = I.EntityId) AND I.MLSID IN (1,2) THEN 0x01
		ELSE 0x00 
	END AS BIT)	AS [canManageOfficeStaff]
	, I.MLSID
	, m.DisplayText AS MLSDisplayText
	, I.IndividualGroupId
	, I.NRDSId
	, I.LicenseNumber
	, ofc.LicenseNumber [officeLicenseNumber]
	, I.[URL] [website]
	, CAST(CASE WHEN pp.Username IS NOT NULL THEN 1 ELSE 0 END as bit) [PastPresident]
	, V2.udf_R_IsBroker(I.EntityId) AS IsBroker
	, REPLACE(I.PaymentId, '-', '') AS PaymentId
FROM
	dbo.Individual as I 
INNER JOIN dbo.IndividualType AS MT ON
	MT.IndividualTypeId = I.IndividualTypeId
AND MT.MLSID = I.MLSID
LEFT OUTER JOIN dbo.Addresses as AD ON
	AD.EntityID = I.[EntityID]
AND AD.IsPrimary = 0x01
LEFT OUTER JOIN dbo.EntityAssociation AS EA ON
	EA.EntityId = I.EntityId
AND EA.IsPrimary = 0x01
LEFT OUTER JOIN dbo.Association AS A ON
	A.AssociationId = EA.AssociationId
LEFT OUTER JOIN dbo.IndividualOffice indofc ON 
	indofc.IndividualEntityId = i.EntityId
LEFT OUTER JOIN dbo.Office ofc ON 
	ofc.EntityId = indofc.OfficeEntityId
LEFT OUTER JOIN dbo.Addresses ofcadd
	ON ofcadd.EntityId = ofc.EntityId
		AND ofcadd.IsPrimary = 0x01
LEFT OUTER JOIN dbo.Phones ofcph
	ON ofcph.EntityId = ofc.EntityId
		AND ofcph.IsPrimary = 0x01 
LEFT OUTER JOIN dbo.Emails ofcem
	ON ofc.EntityId = ofcem.EntityId
		AND ofcem.IsPrimary = 0x01
LEFT OUTER JOIN dbo.MLS m
	ON I.MLSID = m.MLSId
LEFT OUTER JOIN dbo.PastPresidents pp ON
	pp.Username = I.UserName
WHERE
	I.[EntityID] = @AgentEntityId
);
GO

