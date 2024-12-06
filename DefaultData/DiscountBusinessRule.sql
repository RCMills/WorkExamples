
GO

IF NOT EXISTS(SELECT* FROM [Catalog].DiscountBusinessRule WHERE Description = 'Must have Advantage bundle')
BEGIN
	INSERT [Catalog].DiscountBusinessRule (Description) VALUES('Must have Advantage bundle');
END