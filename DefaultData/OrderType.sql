IF NOT EXISTS(SELECT 1 FROM Orders.OrderType WHERE OrderType = 'Products and Services')
BEGIN
	
	INSERT Orders.OrderType (OrderTypeId, OrderType) VALUES (1, 'Products and Services');

END

IF NOT EXISTS(SELECT 1 FROM Orders.OrderType WHERE OrderType = 'Refund')
BEGIN
	
	INSERT Orders.OrderType (OrderTypeId, OrderType) VALUES (2, 'Refund');

END