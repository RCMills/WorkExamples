CREATE   PROC [dbo].[usp_R_EntityDetails2] @EntityId int
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
*	0001			RCM			15 Feb 2018		N/A				Birth
*	0002			RCM			16 Feb 2018		N/A				Revised call to return string of JSON instead of JSON
*	0003			RCM			17 Feb 2018		N/A				added checks for NULL values in Broker to prevent NULL return
*	0004			RCM			19 Feb 2018		N/A				Changed string to CONCAT from "+" type to account for NULLs
*	0005			CSC			20180405		N/A				Updated to use new table structures 
*	0006			RCM			12 Apr 2018		N/A				Added Association and FlexId to Agent blocks
*   0007			CSC			20180420		N/A				Added office information for agent block
*	0008			CSC			20180425		N/A				Addeed email for office to agentblock
*	0009			CSC			20180731		N/A				Added Assc and Compliance status to agent blocks
*	0010			RCM			20180820		N/A				Added shareCode as shortId for now until there is an update created for shareCode
*	0011			CSC			20180906		N/A				Added aspnet userid for return sections on entities
*	0012			CSC			20181009		S25				Added CanManageOfficeStaff for Agent block
*	0013			RCM			20181128		AD-421			Added brokerage ShortID
*	0014			RCM			20181129		PDEV-3196		Updated brokerage entity id to be passed into function to get brokerage data
*	0015			RCM			20190430						Added linked section to Agent Block to reveal linked accounts
************************************************************************************/


SET NOCOUNT ON;

declare @MemberType varchar(50);
declare @ParentEntityId int;
declare @BrokerageEntityId int;
declare @JSONReturn nvarchar(max) = N'';
declare @ClientJSON nvarchar(max) = N'';
declare @AgentJSON nvarchar(max) = N'';
declare @BrokerJSON nvarchar(max) = N'';
declare @LinkedJSON nvarchar(2000) = NULL;

SELECT @MemberType = it.[AtlasMemberType]
FROM Individual id
	INNER JOIN IndividualType it ON id.IndividualTypeId = it.IndividualTypeId and it.mlsid = id.mlsid
WHERE EntityId = @EntityId;

IF @MemberType = 'Client'
BEGIN

	SELECT 
		@ParentEntityId = idc.ParentEntityId
	FROM 
		Individual idc
	WHERE 
		idc.EntityId = @EntityId;

	SELECT 
		@BrokerageEntityId = ISNULL(O.ParentEntityId, O.EntityId) 
	FROM 
		dbo.Individual AS I 
		INNER JOIN dbo.IndividualOffice as offc ON 
			I.EntityId = offc.IndividualEntityId 
		INNER JOIN dbo.Office as o ON
			O.EntityId = offc.OfficeEntityId 
	WHERE 
		I.EntityId = @entityId;

	SELECT @ClientJSON = N'"entity":' + (
		SELECT
			 [memberType]
			,[entityId]
			,[aspNetUserId]
			,[parentEntityId]
			,[firstName]
			,[lastName]
			,[shortId]
			,[contactMethod]
			,[contactPreference]
			,[address1]
			,[address2]
			,[city]
			,[state]
			,[zip]
			,[email]
			,[phone]
		FROM
			dbo.udf_R_ClientDetails(@EntityId, @MemberType, @ParentEntityId) 
			FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)

		SELECT @AgentJSON = N',"agent":' + (
			SELECT
				[memberType]
				,[entityId]
				,[aspNetUserId]
				,[firstName]
				,[lastName]
				,[shortId]
				,[photoURL]
				,[visibleInLists]
				,[fbsBillable]
				,[activeStatus]
				,[systemAccess]
				,[address1]
				,[address2]
				,[city]
				,[state]
				,[zip]
				,[email]
				,[phone]
				,AssociationId
				,[flexId]
				,[OfficeId]
				,[officeName]
				,[officeAddress1]
				,[officeAddress2]
				,[officeCity]
				,[officeState]
				,[officeZip]
				,[officePhone]
				,[officePhoneExt]
				,[officeEmail]
				,[officeShortId]
				,[ArmlsLogonType]
				,[IndividualAssociationStatus]
				,[IndividualComplianceStatus]
				,[IndividualAtlasStatus]
				,[IndividualSubscriptionStatus]
				,[MLSID]
				,[MLSDisplayText]
				,[IndividualGroupId]
				,[MlsStatus]
				,[PastPresident]
			FROM
				dbo.udf_R_AgentDetails(@ParentEntityId)
				FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)

		SELECT @BrokerJSON = N',"brokerage":' + (
			SELECT
				[entityId]
				,[brokerageName]
				,[phone]
				,[email]
				,[logoURL]
				,[shortId]
			FROM
				dbo.udf_R_BrokerDetails( @BrokerageEntityId )
			FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)

		SELECT @JSONReturn = CONCAT(N'{', @ClientJSON, @AgentJSON, @BrokerJSON, N'}');

END
ELSE IF (@MemberType = 'MLS Only Salesperson' OR @MemberType = 'REALTOR Salesperson' OR @MemberType = 'Agent' OR @MemberType = 'MLS STaff' OR @MemberType = 'Assoc' OR @MemberType = 'Association Staff' OR @MemberType = 'Customer')
BEGIN

	SET @ParentEntityId = @EntityId;

	SELECT 
		@BrokerageEntityId = ISNULL(O.ParentEntityId, O.EntityId) 
	FROM 
		dbo.Individual AS I 
		INNER JOIN dbo.IndividualOffice as offc ON 
			I.EntityId = offc.IndividualEntityId 
		INNER JOIN dbo.Office as o ON
			O.EntityId = offc.OfficeEntityId 
	WHERE 
		I.EntityId = @entityId;

	SELECT @ClientJSON = N'"agent":' + (
		SELECT
			[memberType]
			,[entityId]
			,[aspNetUserId]
			,[firstName]
			,[lastName]
			,[shortId]
			,[photoURL]
			,[visibleInLists]
			,[fbsBillable]
			,[activeStatus]
			,[systemAccess]
			,[address1]
			,[address2]
			,[city]
			,[state]
			,[zip]
			,[email]
			,[phone]
			,AssociationId
			,[flexId]
			,[OfficeId]
			,[officeName]
			,[officeAddress1]
			,[officeAddress2]
			,[officeCity]
			,[officeState]
			,[officeZip]
			,[officePhone]
			,[officePhoneExt]
			,[officeEmail]
			,[officeShortId]
			,[ArmlsLogonType]
			,[IndividualAssociationStatus]
			,[IndividualComplianceStatus]
			,[IndividualAtlasStatus]
			,[IndividualSubscriptionStatus]
			,[canManageOfficeStaff]
			,[MLSID]
			,[MLSDisplayText]
			,[IndividualGroupId]
			,[MlsStatus]
			,[PastPresident]
			,dbo.udf_R_HasOpenCases(entityId) AS HasOpenCases
			,[IsBroker]
			,[PaymentId]
		FROM
			dbo.udf_R_AgentDetails(@ParentEntityId)
			FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
	
		SELECT @BrokerJSON = N',"brokerage":' + (
			SELECT
				[entityId]
				,[brokerageName]
				,[phone]
				,[email]
				,[logoURL]
				,[shortId]
			FROM
				dbo.udf_R_BrokerDetails(@BrokerageEntityId )
			FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)

		IF EXISTS(SELECT IndividualGroupId FROM dbo.Individual WHERE EntityId = @EntityId)
		BEGIN

			SELECT @LinkedJSON = N', "Linked":' + (
				SELECT 
					I.UserName [userName]
					, I.EntityId [entityId] 
				FROM 
					dbo.Individual I 
				INNER JOIN 
					dbo.udf_R_EntityGroup(@EntityId) GP ON 
						GP.EntityId = I.EntityId 
				WHERE
					I.EntityId <> @EntityId
				FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)

		END

		SELECT @JSONReturn = CONCAT(N'{', @ClientJSON, @BrokerJSON, @LinkedJSON, N'}');
		
END
ELSE IF @MemberType = 'Registered User' OR @MemberType = 'Guest' OR @MemberType IS NULL OR @MemberType = 'Waiver'
BEGIN

	SELECT @AgentJSON = N'"entity":' + (
		SELECT
			 [memberType]
			,[entityId]
			,[aspNetUserId]
			,[firstName]
			,[lastName]
			,[shortId]
			,[contactMethod]
			,[contactPreference]
			,[address1]
			,[address2]
			,[city]
			,[state]
			,[zip]
			,[email]
			,[phone]
		FROM
			dbo.udf_R_ClientDetails(@EntityId, @MemberType, @ParentEntityId) 
			FOR JSON PATH, WITHOUT_ARRAY_WRAPPER);

		SELECT @JSONReturn = CONCAT(N'{', @AgentJSON, N'}');
END

	SELECT @JSONReturn;
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_R_EntityDetails2] TO [Atlas]
    AS [dbo];

