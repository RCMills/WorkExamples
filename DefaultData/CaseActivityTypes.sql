
IF NOT EXISTS(SELECT * FROM [Case].ActivityType WHERE ActivityTypeDescription = 'Phone Call')
BEGIN

	DELETE FROM [Case].ActivityType WHERE ActivityTypeId = 1

	INSERT [case].ActivityType (ActivityTypeId, ActivityTypeDescription, IconPrefix, Icon) VALUES (1, 'Phone Call', 'fas', 'phone-square');

END

IF NOT EXISTS(SELECT * FROM [Case].ActivityType WHERE ActivityTypeDescription = 'Email')
BEGIN

	DELETE FROM [Case].ActivityType WHERE ActivityTypeId = 2

	INSERT [case].ActivityType (ActivityTypeId, ActivityTypeDescription, IconPrefix, Icon) VALUES (2, 'Email', 'fas', 'envelope');

END

IF NOT EXISTS(SELECT * FROM [Case].ActivityType WHERE ActivityTypeDescription = 'Chat')
BEGIN

	DELETE FROM [Case].ActivityType WHERE ActivityTypeId = 3

	INSERT [case].ActivityType (ActivityTypeId, ActivityTypeDescription, IconPrefix, Icon) VALUES (3, 'Chat', 'fas', 'comments');

END

IF NOT EXISTS(SELECT * FROM [Case].ActivityType WHERE ActivityTypeDescription = 'Walk In')
BEGIN

	DELETE FROM [Case].ActivityType WHERE ActivityTypeId = 4

	INSERT [case].ActivityType (ActivityTypeId, ActivityTypeDescription, IconPrefix, Icon) VALUES (4, 'Walk In', 'fas', 'walking');

END

IF NOT EXISTS(SELECT * FROM [Case].ActivityType WHERE ActivityTypeDescription = 'Waiver')
BEGIN

	DELETE FROM [Case].ActivityType WHERE ActivityTypeId = 5

	INSERT [case].ActivityType (ActivityTypeId, ActivityTypeDescription, IconPrefix, Icon) VALUES (5, 'Waiver', 'fas', 'ban');

END

IF NOT EXISTS(SELECT * FROM [Case].ActivityType WHERE ActivityTypeDescription = 'Alert')
BEGIN

	DELETE FROM [Case].ActivityType WHERE ActivityTypeId = 6

	INSERT [case].ActivityType (ActivityTypeId, ActivityTypeDescription, IconPrefix, Icon) VALUES (6, 'Alert', NULL, NULL);

END