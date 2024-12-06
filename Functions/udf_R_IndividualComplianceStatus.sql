CREATE FUNCTION [dbo].[udf_R_IndividualComplianceStatus]
(
	@EntityId int
)
RETURNS VARCHAR(100)
AS
/***************************************************************************************************
*					 [udf_R_IndividualComplianceStatus]
*
*	Purpose: Returns the compliance status of a user based on entityId 
*
*	Author: Chris Coneybeer
*
*	Origination Date: 20180730
*
*	History
*	Revision		By			Date			WorkItem	
*	0001			CSC			20180730		Birth
*
***************************************************************************************************/
BEGIN
DECLARE @Return AS VARCHAR(100);

	SELECT @Return = sts.[ComplianceStatusDescription] FROM dbo.Individual ind
	INNER JOIN dbo.[ComplianceStatus] sts ON sts.[ComplianceStatusId] = ind.[ComplianceStatusId]
	WHERE ind.EntityId = @EntityId;

	RETURN @Return;
END