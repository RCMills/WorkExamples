CREATE FUNCTION dbo.udf_R_EntityPhone
(@EntityId int)
RETURNS varchar(100)
AS
BEGIN
RETURN(
	SELECT 
		TOP 1 P.Phone 
	FROM 
		dbo.Phones AS P 
	WHERE 
		P.EntityID = @EntityId
	AND P.IsPrimary = 0x01
	ORDER BY
		P.ContactTypeID DESC);
END