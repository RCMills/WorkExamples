CREATE FUNCTION [dbo].[udf_R_SubscriberAccountBalance]
(
	@AccountNumber int
)
RETURNS money
AS
BEGIN
RETURN(
	SELECT 
		SUM(td.Amount) as AccountBalance
	FROM 
		fin.Accounts AS A 
	INNER JOIN fin.TransactionDetail as td ON 
		A.AccountNo = td.AccountNo
	WHERE
		A.AccountNo = @AccountNumber
)
END