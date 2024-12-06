
IF NOT EXISTS(SELECT * FROM [case].OperatingSystem WHERE OperatingSystem = 'Windows')
BEGIN

	INSERT [case].OperatingSystem VALUES (1, 'Windows');

END

IF NOT EXISTS(SELECT * FROM [case].OperatingSystem WHERE OperatingSystem = 'Mac')
BEGIN

	INSERT [case].OperatingSystem VALUES (2, 'Mac');

END

IF NOT EXISTS(SELECT * FROM [case].OperatingSystem WHERE OperatingSystem = 'Android')
BEGIN

	INSERT [case].OperatingSystem VALUES (3, 'Android');

END

IF NOT EXISTS(SELECT * FROM [case].OperatingSystem WHERE OperatingSystem = 'IOS')
BEGIN

	INSERT [case].OperatingSystem VALUES (4, 'IOS');

END

IF NOT EXISTS(SELECT * FROM [case].OperatingSystem WHERE OperatingSystem = 'Other')
BEGIN

	INSERT [case].OperatingSystem VALUES (5, 'Other');

END