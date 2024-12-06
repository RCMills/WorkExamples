CREATE VIEW [dbo].[vw_OfficeSearch] WITH SCHEMABINDING
AS

		SELECT
			O.EntityId,
			O.[Name],
			O.[Username],
			(O.[Name] + ' ' + O.UserName) [SearchField]
			FROM
				dbo.Office O

GO

CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex_vwOfficeSearch_EntityID]
    ON [dbo].[vw_OfficeSearch]([EntityID] ASC);
GO

CREATE FULLTEXT INDEX ON [dbo].[vw_OfficeSearch]
        ([SearchField] LANGUAGE 1033)
        KEY INDEX [ClusteredIndex_vwOfficeSearch_EntityID]
        ON [ftCatalog];
