

CREATE VIEW [dbo].[vw_AgentSearch] WITH SCHEMABINDING
AS
SELECT        ind.UserName
			, ind.EntityID AS EntityID
			, ind.FirstName
			, ind.LastName
			, ind.IndividualTypeId
			, ind.FlexId
			, ind.MLSID
			, ind.Active
			, ind.SystemAccess
			,CONCAT(ind.UserName, ' ', ind.FirstName, ' ',ind.LastName) AS SearchField
FROM            
			dbo.Individual ind
GO
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex_vwAgentSearch_EntityID]
    ON [dbo].[vw_AgentSearch]([EntityID] ASC);

