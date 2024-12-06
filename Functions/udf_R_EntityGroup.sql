CREATE FUNCTION [dbo].[udf_R_EntityGroup]
(
	@EntityId int

)
RETURNS @returntable TABLE
(
	EntityId int
)
AS
BEGIN
-- This should be the majority of cases, so it's appropriate to do this first and punch out as quickly as possible.
	IF (SELECT IndividualGroupId FROM dbo.Individual WHERE EntityId = @EntityId) IS NULL 
	BEGIN
	
		INSERT @returntable VALUES (@EntityId);
		RETURN;

	END
	ELSE
	BEGIN

		INSERT 
			@returntable
		SELECT 
			I.EntityId 
		FROM 
			dbo.Individual I
		INNER JOIN dbo.Individual I2 ON
			I2.IndividualGroupId = I.IndividualGroupId
		WHERE	
			I2.EntityId = @EntityId;

	END

	RETURN;
END