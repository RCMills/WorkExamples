CREATE FUNCTION [dbo].[udf_R_IndividualAssociationStatus]
(
	@EntityId int
)
RETURNS VARCHAR(10)
AS
/***************************************************************************************************
*					 udf_R_IndividualAssociationStatus
*
*	Purpose: Returns if the user is active or inactive by assoication
*
*	Author: Chris Coneybeer
*
*	Origination Date: 20180730
*
*	History
*	Revision		By			Date			WorkItem	
*	0001			CSC			20180730		Birth
*	0002			RCM			11 May 2020		Added section to change criteria for Affiliate Key type
***************************************************************************************************/
BEGIN
DECLARE	@Return VARCHAR(10);

	IF EXISTS (SELECT 1 FROM dbo.Individual i INNER JOIN dbo.udf_R_EntityGroup(@EntityId) g ON i.EntityId = g.EntityId WHERE i.Active = 0x01 AND i.SystemAccess = 0x01 AND IndividualTypeId NOT IN (2, 3))
	OR EXISTS (SELECT 1 FROM dbo.Individual i INNER JOIN dbo.udf_R_EntityGroup(@EntityId) g ON i.EntityId = g.EntityId WHERE i.Active = 0x01 AND IndividualTypeId IN (2, 3))
	BEGIN

		SET @Return = 'Active';

	END
	ELSE
	BEGIN

		SET @Return = 'Inactive';

	END

	RETURN @Return;

END