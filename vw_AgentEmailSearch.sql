CREATE VIEW [dbo].[vw_AgentEmailSearch] WITH SCHEMABINDING
AS
SELECT
	I.FirstName,
	I.LastName,
	I.UserName,
	eml.EntityId, 
	eml.Email,
	O.[Name] as [OfficeName],
	I.IndividualTypeId,
	I.FlexId,
	I.MLSID,
	I.Active,
	I.SystemAccess
FROM            
	dbo.Emails eml
INNER JOIN dbo.Individual AS I ON
	I.EntityId = eml.EntityId
INNER JOIN dbo.IndividualOffice AS IIO ON
	IIO.IndividualEntityId = I.EntityId
INNER JOIN dbo.Office as O ON
	O.EntityId = IIO.OfficeEntityId
WHERE	
	eml.IsPrimary = 0x01;
GO
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex_vw_AgentEmailSearch_EntityID]
    ON [dbo].[vw_AgentEmailSearch]([EntityId] ASC);

