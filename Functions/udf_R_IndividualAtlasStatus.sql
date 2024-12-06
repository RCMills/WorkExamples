CREATE FUNCTION [dbo].[udf_R_IndividualAtlasStatus]
(
	@EntityId int
)
RETURNS VARCHAR(100)
AS
/***************************************************************************************************
*					 [udf_R_IndividualAtlasStatus]
*
*	Purpose: Returns the Atlas status of a user based on entityId 
*
*	Author: Andrew Webster
*
*	Origination Date: 20181128
*
*	History
*	Revision		By			Date			WorkItem	
*	0001			AW			20181128		Birth
*
***************************************************************************************************/
BEGIN

	DECLARE @Return AS VARCHAR(100);

	SELECT @Return = [is].[Description]
	FROM dbo.IndividualStatus [is]
	INNER JOIN dbo.Individual i
		ON [is].IndividualStatusTypeId = i.IndividualStatusTypeId
	WHERE i.EntityId = @EntityId;

	RETURN @Return;

END