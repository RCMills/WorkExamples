CREATE FUNCTION [dbo].[udf_R_ADRENameExists]
(
	@Name varchar(100)
)
RETURNS BIT
AS
BEGIN
	
	declare @returnValue bit = 0x00;

	declare @searchValue nvarchar(100) = N'"' + Lower(@Name) + N'*"';

	SELECT @returnValue = 0x01 FROM dbo.ADREIndividual WHERE CONTAINS(LastName, @searchValue);

	return (SELECT @returnValue);

END