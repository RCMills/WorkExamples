IF NOT EXISTS(SELECT 1 FROM Orders.OrderStatus WHERE OrderStatus = 'Paid')
BEGIN
	
	INSERT Orders.OrderStatus (OrderStatusTypeId, OrderStatus) VALUES (1, 'Paid');

END

IF NOT EXISTS(SELECT 1 FROM Orders.OrderStatus WHERE OrderStatus = 'Cancelled')
BEGIN
	
	INSERT Orders.OrderStatus (OrderStatusTypeId, OrderStatus) VALUES (2, 'Cancelled');

END

IF NOT EXISTS(SELECT 1 FROM Orders.OrderStatus WHERE OrderStatus = 'Refund')
BEGIN
	
	INSERT Orders.OrderStatus (OrderStatusTypeId, OrderStatus) VALUES (3, 'Refund');

END

IF NOT EXISTS(SELECT 1 FROM Orders.OrderStatus WHERE OrderStatus = 'Partial Refund')
BEGIN
	
	INSERT Orders.OrderStatus (OrderStatusTypeId, OrderStatus) VALUES (4, 'Partial Refund');

END

IF NOT EXISTS(SELECT 1 FROM Orders.OrderStatus WHERE OrderStatus = 'Downgrade Refund')
BEGIN
	
	INSERT Orders.OrderStatus (OrderStatusTypeId, OrderStatus) VALUES (5, 'Downgrade Refund');

END