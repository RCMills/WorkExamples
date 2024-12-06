IF NOT EXISTS(SELECT * FROM [case].[Status] WHERE CaseStatusDescription = 'Resolved')
BEGIN

	INSERT [case].[Status] VALUES(1, 'Resolved')

END

IF NOT EXISTS(SELECT * FROM [case].[Status] WHERE CaseStatusDescription = 'Open')
BEGIN

	INSERT [case].[Status] VALUES(2, 'Open')

END

IF NOT EXISTS(SELECT * FROM [case].[Status] WHERE CaseStatusDescription = 'Closed')
BEGIN

	INSERT [case].[Status] VALUES(3, 'Closed')

END

IF NOT EXISTS(SELECT * FROM [case].[Status] WHERE CaseStatusDescription = 'Active')
BEGIN

	INSERT [case].[Status] VALUES(4, 'Active')

END

IF NOT EXISTS(SELECT * FROM [case].[Status] WHERE CaseStatusDescription = 'Expired')
BEGIN

	INSERT [case].[Status] VALUES(5, 'Expired')

END

IF NOT EXISTS(SELECT * FROM [case].[Status] WHERE CaseStatusDescription = 'Deleted')
BEGIN

	INSERT [case].[Status] VALUES(6, 'Deleted')

END