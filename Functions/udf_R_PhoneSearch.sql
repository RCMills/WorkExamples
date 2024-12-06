CREATE FUNCTION [dbo].[udf_R_PhoneSearch]
(
	@Phone varchar(20)
)
RETURNS TABLE

AS

	RETURN(
	SELECT
		DISTINCT
			EntityId
	FROM
		dbo.vw_PhoneSearch
	WHERE
		CONTAINS([SearchValue], @Phone)
	);

GO

