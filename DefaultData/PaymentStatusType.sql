IF NOT EXISTS(SELECT 1 FROM Orders.PaymentStatusType WHERE PaymentStatus = 'Paid')
BEGIN
	
	INSERT Orders.PaymentStatusType(PaymentStatusTypeId, PaymentStatus) VALUES (1, 'Paid');

END

IF NOT EXISTS(SELECT 1 FROM Orders.PaymentStatusType WHERE PaymentStatus = 'NSF')
BEGIN
	
	INSERT Orders.PaymentStatusType(PaymentStatusTypeId, PaymentStatus) VALUES (2, 'NSF');

END

IF NOT EXISTS(SELECT 1 FROM Orders.PaymentStatusType WHERE PaymentStatus = 'Chargeback')
BEGIN
	
	INSERT Orders.PaymentStatusType(PaymentStatusTypeId, PaymentStatus) VALUES (3, 'Chargeback');

END

IF NOT EXISTS(SELECT 1 FROM Orders.PaymentStatusType WHERE PaymentStatus = 'Void')
BEGIN
	
	INSERT Orders.PaymentStatusType(PaymentStatusTypeId, PaymentStatus) VALUES (4, 'Void');

END
