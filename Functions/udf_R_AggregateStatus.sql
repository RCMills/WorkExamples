CREATE FUNCTION [dbo].[udf_R_AggregateStatus]
(
	@EntityId int
)
RETURNS @StatusReturnTbl TABLE
(
	AggregateStatus varchar(10),
	reason varchar(100)
)
AS
/************************************************************************************************
*							[udf_R_AggregateStatus]
*
*	Purpose: Returns aggregate of assc, compliance and subscription status
*
*	Author: Chris Coneybeer
*
*	Origination Date: 20180426
*
*	History
*	Revision		By			Date			WorkItem
*	0001			CSC			UNKNOW
*	0002			CSC			20180730		This was udf_R_AtlasStatus and changed to udf_R_AggregateStatus
*	0003			RCM			23 June 2020	changed logic in Inactive by Assoc to aggregate for a given entity group
*
*	
************************************************************************************************/
BEGIN

	DECLARE @InactiveByAssociation BIT = 0x00; -- Initialized to false to ensure NULL isn't part of the equation
	DECLARE @ReturnStatus VARCHAR(20);
	DECLARE @ComplianceStatusDesc VARCHAR(50);

	DECLARE @Entities TABLE (EntityId int);

	INSERT @Entities SELECT EntityId FROM dbo.udf_R_EntityGroup(@EntityId);

/*
	The Active and SystemAccess values are bit on the table and bit doesn't support Aggregate functions, so they're cast as tinyint
*/

	;with AssocStatus
	AS(
		SELECT
			MAX(CAST(I.Active as tinyint)) [Active]
			, MAX(CAST(I.SystemAccess as tinyint)) [SystemAccess]
		FROM
			dbo.[Individual] I
		INNER JOIN @Entities E ON
			E.EntityId = I.EntityId)
/*
	The rule says if both flags are false we are sure they are not allowed access
*/

		SELECT
			@InactiveByAssociation = 0x01
		FROM
			AssocStatus
		WHERE	
			Active = 0 OR SystemAccess = 0;

		SELECT 
			  @ComplianceStatusDesc = atlst.[ComplianceStatusDescription]
		FROM 
			[dbo].[Individual] ind 
		INNER JOIN [dbo].[ComplianceStatus] atlst ON 
			ind.[ComplianceStatusId] = atlst.[ComplianceStatusId]
		INNER JOIN @Entities e ON
			e.EntityId = ind.EntityId;

		-- set @returnStatus to Active to start with 
		SET @ReturnStatus = 'Active';

		-- if ComplianceStatus is not active, set status and add reason to table
		IF @ComplianceStatusDesc = 'In Appeal'
			BEGIN
				INSERT INTO @StatusReturnTbl(reason) VALUES(@ComplianceStatusDesc);
			END;
		ELSE IF @ComplianceStatusDesc <> 'Active'
			BEGIN 
				SET @ReturnStatus = 'Inactive';
				INSERT INTO @StatusReturnTbl(reason) VALUES(@ComplianceStatusDesc);
			END;

		-- check for @systemaccess set to true(0x01) 
		IF @InactiveByAssociation = 0x01
			BEGIN
				SET @ReturnStatus = 'Inactive';
				INSERT INTO @StatusReturnTbl (reason) VALUES('Inactivated by Association');
			END;

		-- check for active subscription 
		IF [dbo].udf_R_HasActiveSubscription(@EntityId) = 0x00
			BEGIN
				SET @ReturnStatus = 'Inactive';
				INSERT INTO @StatusReturnTbl (reason) VALUES('Expired');
			END;
		
		IF (SELECT COUNT(*) FROM @StatusReturnTbl) > 0 
		BEGIN

			UPDATE @StatusReturnTbl SET AggregateStatus = @ReturnStatus;
		END
		ELSE
		BEGIN

			INSERT @StatusReturnTbl(AggregateStatus) VALUES (@ReturnStatus);

		END

	RETURN;
END