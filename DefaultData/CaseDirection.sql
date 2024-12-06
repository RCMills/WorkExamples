IF NOT EXISTS(SELECT * FROM [case].Direction WHERE DirectionDescription = 'Inbound')
BEGIN

	INSERT [case].Direction VALUES(1, 'Inbound');

END

IF NOT EXISTS(SELECT * FROM [case].Direction WHERE DirectionDescription = 'Outbound')
BEGIN

	INSERT [case].Direction VALUES(2, 'Outbound');

END
