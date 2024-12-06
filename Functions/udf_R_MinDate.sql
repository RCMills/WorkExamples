CREATE FUNCTION dbo.udf_R_MinDate (
	  @FirstDate DATE
	, @SecondDate DATE
)
RETURNS DATE
AS
BEGIN

	SET @FirstDate = ISNULL(@FirstDate, '12/31/9999')
	SET @SecondDate = ISNULL(@SecondDate, '12/31/9999')

	RETURN (SELECT MIN(Dates) MinDate FROM (VALUES (@FirstDate),(@SecondDate)) B (Dates));
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[udf_R_MinDate] TO [Atlas]
    AS [dbo];