
GO

IF NOT EXISTS(SELECT* FROM [Catalog].DiscountDetail WHERE DiscountId = 1 and PackageId = 11)
BEGIN
	INSERT [Catalog].DiscountDetail (DiscountId, PackageId, Price, Percentage) VALUES(1, 11, null, 50);
END

IF NOT EXISTS(SELECT* FROM [Catalog].DiscountDetail WHERE DiscountId = 1 and PackageId = 32)
BEGIN
	INSERT [Catalog].DiscountDetail (DiscountId, PackageId, Price, Percentage) VALUES(1, 32, null, 50);
END

IF NOT EXISTS(SELECT* FROM [Catalog].DiscountDetail WHERE DiscountId = 1 and PackageId = 35)
BEGIN
	INSERT [Catalog].DiscountDetail (DiscountId, PackageId, Price, Percentage) VALUES(1, 35, null, 50);
END