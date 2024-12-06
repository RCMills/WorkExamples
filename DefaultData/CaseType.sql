IF NOT EXISTS(SELECT * FROM [case].[Type] WHERE CaseType = 'Subscriber')
BEGIN

	INSERT [case].[Type] VALUES(1, 'Subscriber')

END

IF NOT EXISTS(SELECT * FROM [case].[Type] WHERE CaseType = 'NonSubscriber')
BEGIN

	INSERT [case].[Type] VALUES(2, 'NonSubscriber')

END
IF NOT EXISTS(SELECT * FROM [case].[Type] WHERE CaseType = 'Affiliate')
BEGIN

	INSERT [case].[Type] VALUES(3, 'Affiliate')

END