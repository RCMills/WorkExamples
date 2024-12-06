CREATE VIEW dbo.vw_CaseLogSearch WITH SCHEMABINDING
AS
	SELECT
		CL.CaseLogId
		,Cl.FirstName
		,Cl.LastName
		,Cl.CustomerEmail
		,CONCAT(FirstName, ' ', LastName, ' ', CustomerEmail) as SearchField
	FROM
		[case].[CaseLog] CL
GO
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex_vw_CaseLogSearch_CaseLogId]
    ON [dbo].[vw_CaseLogSearch]([CaseLogId] ASC);

