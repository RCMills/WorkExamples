SET NOCOUNT ON; 
SET XACT_ABORT ON;

BEGIN TRANSACTION 

SET IDENTITY_INSERT [dbo].[ComplianceStatus] ON;

MERGE INTO [dbo].[ComplianceStatus]  AS target 
USING (VALUES
	(1, 'Active')
	, (2, 'Inactive By Fines')
	, (3, 'Suspended')
	, (4, 'In Appeal')
	)
	AS Source([ComplianceStatusId], [ComplianceStatusDescription])
	ON Target.[ComplianceStatusId] = Source.[ComplianceStatusId]
	WHEN NOT Matched BY Target THEN 
		INSERT ([ComplianceStatusId], [ComplianceStatusDescription])
		VALUES ([ComplianceStatusId], [ComplianceStatusDescription]);

SET IDENTITY_INSERT [dbo].[ComplianceStatus] OFF;

COMMIT;