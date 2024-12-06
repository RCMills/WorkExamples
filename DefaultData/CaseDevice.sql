
IF NOT EXISTS(SELECT * FROM [case].Device WHERE DeviceDescription = 'Desktop')
BEGIN

	INSERT [case].Device VALUES (1, 'Desktop');

END

IF NOT EXISTS(SELECT * FROM [case].Device WHERE DeviceDescription = 'Laptop')
BEGIN

	INSERT [case].Device VALUES (2, 'Laptop');

END

IF NOT EXISTS(SELECT * FROM [case].Device WHERE DeviceDescription = 'Tablet')
BEGIN

	INSERT [case].Device VALUES (3, 'Tablet');

END

IF NOT EXISTS(SELECT * FROM [case].Device WHERE DeviceDescription = 'Phone')
BEGIN

	INSERT [case].Device VALUES (4, 'Phone');

END

IF NOT EXISTS(SELECT * FROM [case].Device WHERE DeviceDescription = 'Other')
BEGIN

	INSERT [case].Device VALUES (5, 'Other');

END