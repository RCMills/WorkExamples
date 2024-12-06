SET NOCOUNT ON;
SET XACT_ABORT ON;

BEGIN TRANSACTION;

-- Reference Data for ProductTypes
MERGE INTO [dbo].[OfficeStaffQueueStatus] AS Target 
USING (VALUES 
	(1, N'New')
	, (2, N'Approved')
	, (3, N'Rejected')
	, (4, N'Under Review')
	, (5, N'Processing Order')
	) 
AS Source ([id], [OfficeStaffQueueStatusDesc]) 
ON Target.Id = Source.Id
 --insert new rows if not present
WHEN NOT MATCHED BY TARGET THEN 
INSERT ([Id], [OfficeStaffQueueStatusDesc]) 
VALUES ([Id], [OfficeStaffQueueStatusDesc]); 

COMMIT;
GO