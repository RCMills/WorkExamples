

IF EXISTS(SELECT * FROM Catalog.OverridePricing)
BEGIN
	
	TRUNCATE TABLE Catalog.OverridePricing;

END

INSERT Catalog.OverridePricing(ExistingProductId, UpgradeProductId, OverridePrice, ProductTypeId, ModifiedBy)
VALUES(21, 25, 180, 3, 'bmills'),
(1, 25, 180, 7, 'bmills');
GO
