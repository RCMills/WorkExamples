CREATE FUNCTION [dbo].[udf_R_CaseNoteSearch]
(
	@SearchString nvarchar(2000)
)
RETURNS @returntable TABLE
(
	CaseId int
)
AS
BEGIN
	
	INSERT
		@returntable (CaseId)
	SELECT
		DISTINCT N.CaseId
	FROM
		[case].Notes N
	WHERE
		CONTAINS([TEXT], @SearchString);

	RETURN;

END