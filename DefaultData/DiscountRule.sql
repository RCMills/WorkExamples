
GO

IF NOT EXISTS(SELECT* FROM [Catalog].DiscountRule WHERE DiscountId = 1 AND BusinessRuleId = 1)
BEGIN
	INSERT [Catalog].DiscountRule (DiscountId, BusinessRuleId) VALUES(1,1);
END