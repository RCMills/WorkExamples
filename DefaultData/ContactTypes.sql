SET NOCOUNT ON;
SET XACT_ABORT ON;


DECLARE @LoadDate AS DateTime = current_timestamp;
BEGIN TRANSACTION;

-- Reference Data for ContactType
MERGE INTO [dbo].[ContactType] AS Target 
USING (VALUES 
	(1, N'Home Fax', NULL),
	(2, N'Home', 3),
	(3, N'Office', 2),
	(4, N'Personal', NULL),
	(5, N'School', NULL),
	(6, N'Vacation', NULL),
	(7, N'Work', NULL),
	(8, N'Mobile', 1),
	(9, N'Office Fax', 4),
	(10, N'Direct Office', NULL),
	(11, N'Pager', 5),
	(12, N'Toll Free', NULL),
	(13, N'TTYTDD', NULL),
	(14, N'Voice Mail', NULL)
) 
AS Source ([ContactTypeID], [ContactType], [PrimaryHierarchy]) 
ON Target.ContactTypeID = Source.ContactTypeID
 --insert new rows if not present
WHEN NOT MATCHED BY TARGET THEN 
INSERT (ContactTypeID, ContactType, [PrimaryHierarchy] , LoadDate) 
VALUES (ContactTypeID, ContactType, [PrimaryHierarchy] , @LoadDate); 

COMMIT;
GO