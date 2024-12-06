CREATE FUNCTION [dbo].[udf_R_SubsciberBalances]()
RETURNS TABLE
AS

	RETURN(
			SELECT 
				SUM(td.Amount) as AccountBalance
				,A.EntityId
			FROM 
				fin.Accounts AS A 
			INNER JOIN fin.TransactionDetail as td ON 
				A.AccountNo = td.AccountNo
			GROUP BY
				A.EntityId
	);