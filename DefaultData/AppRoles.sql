SET NOCOUNT ON; 
SET XACT_ABORT ON;

DECLARE @LoadDate AS datetime = current_timestamp

BEGIN TRANSACTION 

SET IDENTITY_INSERT [dbo].[AppRole] ON;

MERGE INTO [dbo].[AppRole]  AS target 
USING (VALUES
	(1, 'Accounting Staff', 0x00, 0x00, 0x00, '/account/summary', 99)
	, (2, 'Agent', 0x00, 0x00, 0x01, '/account/summary', 99)
	, (3, 'Base', 0x00, 0x00, 0x01, '/account/summary', 99)
	, (4, 'Client', 0x00, 0x00, 0x01, '/account/summary', 99)
	, (5, 'Data Integrity Staff', 0x01, 0x01, 0x01, '/support/new-case', 3)
	, (6, 'Designated Broker', 0x00, 0x00, 0x01, '/account/summary', 99)
	, (7, 'Development Staff', 0x00, 0x00, 0x01, '/account/summary', 99)
	, (8, 'Guest', 0x00, 0x00, 0x01, '/account/summary', 99)
	, (9, 'Registered User', 0x00, 0x00, 0x01, '/account/summary', 99)
	, (10, 'Staff', 0x00, 0x00, 0x01, '/account/summary', 99)
	, (11, 'Customer Support Specialist', 0x01, 0x01, 0x01, '/support/new-case', 3)
	, (12, 'Data Integrity Analyst', 0x01, 0x01, 0x01, '/account/summary', 99)
	, (13, 'Accounting' , 0x01, 0x01, 0x00, '/support/case-history', 2)
	, (14, 'Data Integrity Supervisor', 0x01, 0x01, 0x01, '/support/new-case', 3)
	, (15, 'Customer Support Specialist II', 0x01, 0x01, 0x01, '/support/new-case', 3)
	, (16, 'General Access', 0x00, 0x01, 0x01, '/account/summary', 99)
	, (17, 'Mls Admin', 0x01, 0x01, 0x00, '/sms/search', 1)
	, (18, 'Brand', 0x01, 0x01, 0x01, '/account/summary', 99)
	)
	AS Source([RoleID], [RoleName], [CanCreateCases], [IsActive], [Assignable], [HomeRoute], [HomeRoutePriority])
	ON Target.[RoleID] = Source.[RoleID]
	WHEN MATCHED THEN
		UPDATE
			SET RoleName = SOURCE.RoleName
			, CanCreateCases = Source.CanCreateCases
			, IsActive = SOURCE.IsActive
			, Assignable = Source.Assignable
			, ModifiedDate = @LoadDate
			, HomeRoute = SOURCE.HomeRoute
			, HomeRoutePriority = SOURCE.HomeRoutePriority
	WHEN NOT Matched BY Target THEN 
		INSERT ([RoleID], [RoleName], [CanCreateCases], [IsActive], [Assignable], [LoadDate], [HomeRoute], [HomeRoutePriority], [ModifiedDate])
		VALUES ([RoleID], [RoleName], [CanCreateCases], [IsActive], [Assignable], @LoadDate, HomeRoute, [HomeRoutePriority], @LoadDate);

SET IDENTITY_INSERT [dbo].[AppRole] OFF;

COMMIT;

GO