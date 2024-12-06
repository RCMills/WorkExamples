IF NOT EXISTS(SELECT * FROM [case].Browser WHERE Browser = 'Chrome')
BEGIN

	INSERT [case].Browser VALUES(1, 'Chrome')

END

IF NOT EXISTS(SELECT * FROM [case].Browser WHERE Browser = 'Firefox')
BEGIN

	INSERT [case].Browser VALUES(2, 'Firefox')

END

IF NOT EXISTS(SELECT * FROM [case].Browser WHERE Browser = 'IE')
BEGIN

	INSERT [case].Browser VALUES(3, 'IE')

END

IF NOT EXISTS(SELECT * FROM [case].Browser WHERE Browser = 'Edge')
BEGIN

	INSERT [case].Browser VALUES(4, 'Edge')

END

IF NOT EXISTS(SELECT * FROM [case].Browser WHERE Browser = 'Safari')
BEGIN

	INSERT [case].Browser VALUES(5, 'Safari')

END

IF NOT EXISTS(SELECT * FROM [case].Browser WHERE Browser = 'Other')
BEGIN

	INSERT [case].Browser VALUES(6, 'Other')

END