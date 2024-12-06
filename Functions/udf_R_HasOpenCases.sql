CREATE FUNCTION [dbo].[udf_R_HasOpenCases] ( @EntityId INT )
	RETURNS BIT
AS
BEGIN

	DECLARE @HasOpenCases BIT

	SELECT @HasOpenCases = (SELECT TOP 1 CaseLog.CaseId FROM [Case].CaseLog WHERE SelectedEntityId = @EntityId AND CaseStatusId IN (1, 2))

	RETURN ISNULL(@HasOpenCases, 0x00)
END
GO