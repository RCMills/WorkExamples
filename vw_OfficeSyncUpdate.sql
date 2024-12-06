CREATE VIEW dbo.vw_OfficeSyncUpdate
AS

SELECT
	IOS.*,
	I.EntityId [IndividualEntityId],
	O.EntityId [OfficeEntityId]
FROM
	staging.IndividualOfficeSync IOS
LEFT OUTER JOIN dbo.Individual I ON
	I.FlexId = IOS.AgentId
LEFT OUTER JOIN dbo.Office O ON
	O.OfficeId = IOS.OfficeId;