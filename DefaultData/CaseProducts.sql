

IF NOT EXISTS(SELECT * FROM [case].Products WHERE ProductName = 'Flexmls')
BEGIN
	
	INSERT [case].Products (CaseProductId, ProductName) VALUES (1, 'Flexmls');

END

IF NOT EXISTS(SELECT * FROM [case].Products WHERE ProductName = 'Supra')
BEGIN
	
	INSERT [case].Products (CaseProductId, ProductName) VALUES (2, 'Supra');

END

IF NOT EXISTS(SELECT * FROM [case].Products WHERE ProductName = 'Monsoon')
BEGIN
	
	INSERT [case].Products (CaseProductId, ProductName) VALUES (3, 'Monsoon');

END

IF NOT EXISTS(SELECT * FROM [case].Products WHERE ProductName = 'Atlas')
BEGIN
	
	INSERT [case].Products (CaseProductId, ProductName) VALUES (4, 'Atlas');

END

IF NOT EXISTS(SELECT * FROM [case].Products WHERE ProductName = 'Nighthawk')
BEGIN
	
	INSERT [case].Products (CaseProductId, ProductName, IsActive) VALUES (5, 'Nighthawk', 0x00);

END

IF NOT EXISTS(SELECT * FROM [case].Products WHERE ProductName = 'RapidStats')
BEGIN
	
	INSERT [case].Products (CaseProductId, ProductName) VALUES (6, 'RapidStats');

END

IF NOT EXISTS(SELECT * FROM [case].Products WHERE ProductName = 'Showing Time')
BEGIN
	
	INSERT [case].Products (CaseProductId, ProductName) VALUES (7, 'Showing Time');

END

IF NOT EXISTS(SELECT * FROM [case].Products WHERE ProductName = 'Advantage Bundle')
BEGIN
	
	INSERT [case].Products (CaseProductId, ProductName) VALUES (8, 'Advantage Bundle');

END

IF NOT EXISTS(SELECT * FROM [case].Products WHERE ProductName = 'Other')
BEGIN
	
	INSERT [case].Products (CaseProductId, ProductName) VALUES (9, 'Other');

END

IF NOT EXISTS(SELECT * FROM [case].Products WHERE ProductName = 'CurbView')
BEGIN
	
	INSERT [case].Products (CaseProductId, ProductName) VALUES (10, 'CurbView');

END

IF NOT EXISTS(SELECT * FROM [case].Products WHERE ProductName = 'Aligned Showings')
BEGIN
	
	INSERT [case].Products (CaseProductId, ProductName) VALUES (11, 'Aligned Showings');

END
