SET NOCOUNT ON;
SET XACT_ABORT ON; 

DECLARE @LoadDate AS DATETIME = CURRENT_TIMESTAMP;

BEGIN TRANSACTION;

MERGE INTO [dbo].[SourceSystem] AS Target
USING (VALUES 
	(1, 'Atlas', 0x01)
	, (2, 'Cams', 0x01)
	, (3, 'Flex', 0x01)
	, (4, 'NightHawk', 0x01)
	, (5, 'RealityTrac' ,0x01)
	)
AS Source (SourceSystemID, SourceSystem, IsActive)
ON target.SourceSystemID = Source.SourceSystemID 
WHEN NOT MATCHED BY target THEN 
-- insert missing rows
INSERT(SourceSystemID, SourceSystem, IsActive, LoadDate)
VALUES(SourceSystemID, SourceSystem, IsActive, @LoadDate);

COMMIT 

GO