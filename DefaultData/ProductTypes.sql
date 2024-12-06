SET NOCOUNT ON;
SET XACT_ABORT ON;

BEGIN TRANSACTION;

-- Reference Data for ProductTypes
MERGE INTO [Catalog].[ProductTypes] AS Target 
USING (VALUES 
	(1, N'Violations', 0x01, 0x01, 0x00, 0x00, 0x00),
	(2, N'Base Packages', 0x01, 0x01, 0x01, 0x01, 0x01),
	(3, N'Add-On Packages', 0x01, 0x01, 0x01, 0x01, 0x01), 
	(4, N'Package Content', 0x01, 0x00, 0x00, 0x00, 0x00), 
	(5, N'Refund', 0x01, 0x00, 0x00, 0x00, 0x00), 
	(6, N'Application Access', 0x01, 0x01, 0x00, 0x00, 0x00),
	(7, N'Base Package - Non Upgradeable', 0x01, 0x01, 0x01, 0x00, 0x00),
	(8, N'Base Package - Office Staff', 0x01, 0x01, 0x01, 0x01, 0x01),
	(9, N'Grantable Package', 0x01, 0x00, 0x01, 0x01, 0x00)
	) 
AS Source ([ProductTypeId], [ProductType], [IsActive], [IsBillable], [IsPackage], [Grantable], [AvailableToPurchase]) 
ON Target.ProductTypeId = Source.ProductTypeId
 --insert new rows if not present
WHEN NOT MATCHED BY TARGET THEN 
INSERT (ProductTypeId, ProductType, IsActive, [IsBillable], [IsPackage], [Grantable], [AvailableToPurchase]) 
VALUES (ProductTypeId, ProductType, IsActive, [IsBillable], [IsPackage], [Grantable], [AvailableToPurchase]); 

COMMIT;
GO