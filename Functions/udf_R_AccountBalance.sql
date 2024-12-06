CREATE FUNCTION [dbo].[udf_R_AccountBalance]
(
	@AccountNo int,
	@ToDate DateTime = NULL
)
RETURNS money
AS
BEGIN
RETURN(
	SELECT 
		SUM(td.Amount) as AccountBalance
	FROM 
		fin.TransactionDetail as td
	INNER JOIN fin.TransactionHeader as th ON
		th.TransactionId = td.TransactionId
	WHERE
		td.AccountNo = @AccountNo
	AND (@ToDate IS NULL OR th.TransactionDate <= @ToDate)
)
END