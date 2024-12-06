SET NOCOUNT ON;
SET XACT_ABORT ON; 

DECLARE @LoadDate AS DATETIME = CURRENT_TIMESTAMP;

BEGIN TRANSACTION;


SET IDENTITY_INSERT [dbo].[MemberType] ON;

MERGE INTO [dbo].[MemberType] AS Target
USING (VALUES 
	(1, 'Agent', 0x01)
	, (2, 'Client', 0x01 )
	, (3, 'Guest', 0x01)
	, (4, 'Registered User', 0x01)
	, (5, 'Staff', 0x01)
	)
AS Source (MemberTypeID, MemberType, IsActive)
ON target.[MemberTypeID] = Source.[MemberTypeID] 
WHEN NOT MATCHED BY target THEN 
-- insert missing rows
INSERT(MemberTypeID, MemberType, IsActive, LoadDate)
VALUES(MemberTypeID, MemberType, IsActive, @LoadDate);

SET IDENTITY_INSERT [dbo].[MemberType] OFF; 

COMMIT 

GO