CREATE FUNCTION dbo.udf_R_EntityEmail
(@EntityId int)
RETURNS varchar(100)
AS
BEGIN
RETURN(
	SELECT 
		TOP 1 E.Email 
	FROM 
		dbo.Emails AS E 
	WHERE 
		E.EntityID = @EntityId
	AND E.IsPrimary = 0x01
	ORDER BY
		E.ContactTypeID DESC);
END