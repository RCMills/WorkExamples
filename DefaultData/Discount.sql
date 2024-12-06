
GO

IF NOT EXISTS(SELECT* FROM [Catalog].Discount WHERE Description = 'Addons are 50% off with the advantage bundle' AND DiscountCode = 'ADV50')
BEGIN
	INSERT [Catalog].Discount (Description, DiscountCode) VALUES('Addons are 50% off with the advantage bundle', 'ADV50');
END