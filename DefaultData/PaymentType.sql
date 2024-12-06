
IF NOT EXISTS(SELECT 1 FROM Orders.PaymentType WHERE PaymentType = 'Credit Card')
BEGIN
	
	INSERT Orders.PaymentType (PaymentTypeId, PaymentType, DisplayOrder)
	VALUES					  (1,			'Credit Card', 1);

END

IF NOT EXISTS(SELECT 1 FROM Orders.PaymentType WHERE PaymentType = 'Cash')
BEGIN
	
	INSERT Orders.PaymentType (PaymentTypeId, PaymentType, DisplayOrder)
	VALUES					  (2,			'Cash',			2);

END
IF NOT EXISTS(SELECT 1 FROM Orders.PaymentType WHERE PaymentType = 'Check')
BEGIN
	
	INSERT Orders.PaymentType (PaymentTypeId, PaymentType, DisplayOrder)
	VALUES					  (3,			'Check',			3);

END
IF NOT EXISTS(SELECT 1 FROM Orders.PaymentType WHERE PaymentType = 'Transfer')
BEGIN
	
	INSERT Orders.PaymentType (PaymentTypeId, PaymentType, DisplayOrder)
	VALUES					  (4,			'Transfer',			3);

END
IF NOT EXISTS(SELECT 1 FROM Orders.PaymentType WHERE PaymentType = 'Apple Pay')
BEGIN
	
	INSERT Orders.PaymentType (PaymentTypeId, PaymentType, DisplayOrder)
	VALUES					  (5,			'Apple Pay',			4);

END
