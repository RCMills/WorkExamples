CREATE FUNCTION [dbo].[udf_R_PaymentId]
(
	@EntityId INT
)
RETURNS VARCHAR(255)
AS
BEGIN

	DECLARE @PaymentId VARCHAR(255) = (
		SELECT TOP 1 REPLACE(i.PaymentId, '-', '')
		FROM dbo.Individual i
		INNER JOIN dbo.Emails e
			ON i.EntityId = e.EntityId
		LEFT OUTER JOIN (
			SELECT Email, COUNT(*) AS cnt
			FROM dbo.Emails e
			INNER JOIN dbo.Individual i
				ON e.EntityId = i.EntityId
			GROUP BY Email
			HAVING COUNT(*) > 1
		) dupes
			ON e.Email = dupes.Email
		WHERE
			i.EntityId = @EntityId
			AND dupes.Email IS NULL
	)

	RETURN @PaymentId

END
GO