/*******************************************************************
*			Domain of Values per RESO standard
*
*		http://ddwiki.reso.org/display/DDW16/SocialMediaType+Field
*
*****************************************************************/

IF NOT EXISTS(SELECT 1 FROM dbo.SocialMediaType WHERE SocialMediaTypeDescription = 'Digg') 
BEGIN

	INSERT INTO [dbo].[SocialMediaType] ([SocialMediaTypeID], [SocialMediaTypeDescription], [IsActive], [LoadDate]) VALUES (1, N'Digg', 1, CURRENT_TIMESTAMP);

END

IF NOT EXISTS(SELECT 1 FROM dbo.SocialMediaType WHERE SocialMediaTypeDescription = 'Blog') 
BEGIN

	INSERT INTO [dbo].[SocialMediaType] ([SocialMediaTypeID], [SocialMediaTypeDescription], [IsActive], [LoadDate]) VALUES (2, N'Blog', 1, CURRENT_TIMESTAMP);

END

IF NOT EXISTS(SELECT 1 FROM dbo.SocialMediaType WHERE SocialMediaTypeDescription = 'FaceBook') 
BEGIN

	INSERT INTO [dbo].[SocialMediaType] ([SocialMediaTypeID], [SocialMediaTypeDescription], [IsActive], [LoadDate]) VALUES (3, N'FaceBook', 1, CURRENT_TIMESTAMP);

END

IF NOT EXISTS(SELECT 1 FROM dbo.SocialMediaType WHERE SocialMediaTypeDescription = 'Instagram') 
BEGIN

	INSERT INTO [dbo].[SocialMediaType] ([SocialMediaTypeID], [SocialMediaTypeDescription], [IsActive], [LoadDate]) VALUES (4, N'Instagram', 1, CURRENT_TIMESTAMP);

END

IF NOT EXISTS(SELECT 1 FROM dbo.SocialMediaType WHERE SocialMediaTypeDescription = 'Facebook Messenger') 
BEGIN

	INSERT INTO [dbo].[SocialMediaType] ([SocialMediaTypeID], [SocialMediaTypeDescription], [IsActive], [LoadDate]) VALUES (5, N'Facebook Messenger', 1, CURRENT_TIMESTAMP);

END

IF NOT EXISTS(SELECT 1 FROM dbo.SocialMediaType WHERE SocialMediaTypeDescription = 'Twitter') 
BEGIN

	INSERT INTO [dbo].[SocialMediaType] ([SocialMediaTypeID], [SocialMediaTypeDescription], [IsActive], [LoadDate]) VALUES (6, N'Twitter', 1, CURRENT_TIMESTAMP);

END

IF NOT EXISTS(SELECT 1 FROM dbo.SocialMediaType WHERE SocialMediaTypeDescription = 'Website') 
BEGIN

	INSERT INTO [dbo].[SocialMediaType] ([SocialMediaTypeID], [SocialMediaTypeDescription], [IsActive], [LoadDate]) VALUES (7, N'Website', 1, CURRENT_TIMESTAMP);

END

IF NOT EXISTS(SELECT 1 FROM dbo.SocialMediaType WHERE SocialMediaTypeDescription = 'GooglePlus') 
BEGIN

	INSERT INTO [dbo].[SocialMediaType] ([SocialMediaTypeID], [SocialMediaTypeDescription], [IsActive], [LoadDate]) VALUES (8, N'GooglePlus', 1, CURRENT_TIMESTAMP);

END

IF NOT EXISTS(SELECT 1 FROM dbo.SocialMediaType WHERE SocialMediaTypeDescription = 'iMessage') 
BEGIN

	INSERT INTO [dbo].[SocialMediaType] ([SocialMediaTypeID], [SocialMediaTypeDescription], [IsActive], [LoadDate]) VALUES (9, N'iMessage', 1, CURRENT_TIMESTAMP);

END

IF NOT EXISTS(SELECT 1 FROM dbo.SocialMediaType WHERE SocialMediaTypeDescription = 'LinkedIn') 
BEGIN

	INSERT INTO [dbo].[SocialMediaType] ([SocialMediaTypeID], [SocialMediaTypeDescription], [IsActive], [LoadDate]) VALUES (10, N'LinkedIn', 1, CURRENT_TIMESTAMP);

END

IF NOT EXISTS(SELECT 1 FROM dbo.SocialMediaType WHERE SocialMediaTypeDescription = 'Pinterest') 
BEGIN

	INSERT INTO [dbo].[SocialMediaType] ([SocialMediaTypeID], [SocialMediaTypeDescription], [IsActive], [LoadDate]) VALUES (11, N'Pinterest', 1, CURRENT_TIMESTAMP);

END

IF NOT EXISTS(SELECT 1 FROM dbo.SocialMediaType WHERE SocialMediaTypeDescription = 'Reddit') 
BEGIN

	INSERT INTO [dbo].[SocialMediaType] ([SocialMediaTypeID], [SocialMediaTypeDescription], [IsActive], [LoadDate]) VALUES (12, N'Reddit', 1, CURRENT_TIMESTAMP);

END

IF NOT EXISTS(SELECT 1 FROM dbo.SocialMediaType WHERE SocialMediaTypeDescription = 'Slack') 
BEGIN

	INSERT INTO [dbo].[SocialMediaType] ([SocialMediaTypeID], [SocialMediaTypeDescription], [IsActive], [LoadDate]) VALUES (13, N'Slack', 1, CURRENT_TIMESTAMP);

END

IF NOT EXISTS(SELECT 1 FROM dbo.SocialMediaType WHERE SocialMediaTypeDescription = 'Snapchat') 
BEGIN

	INSERT INTO [dbo].[SocialMediaType] ([SocialMediaTypeID], [SocialMediaTypeDescription], [IsActive], [LoadDate]) VALUES (14, N'Snapchat', 1, CURRENT_TIMESTAMP);

END

IF NOT EXISTS(SELECT 1 FROM dbo.SocialMediaType WHERE SocialMediaTypeDescription = 'StumbleUpon') 
BEGIN

	INSERT INTO [dbo].[SocialMediaType] ([SocialMediaTypeID], [SocialMediaTypeDescription], [IsActive], [LoadDate]) VALUES (15, N'StumbleUpon', 1, CURRENT_TIMESTAMP);

END

IF NOT EXISTS(SELECT 1 FROM dbo.SocialMediaType WHERE SocialMediaTypeDescription = 'Tumblr') 
BEGIN

	INSERT INTO [dbo].[SocialMediaType] ([SocialMediaTypeID], [SocialMediaTypeDescription], [IsActive], [LoadDate]) VALUES (16, N'Tumblr', 1, CURRENT_TIMESTAMP);

END

IF NOT EXISTS(SELECT 1 FROM dbo.SocialMediaType WHERE SocialMediaTypeDescription = 'YouTube') 
BEGIN

	INSERT INTO [dbo].[SocialMediaType] ([SocialMediaTypeID], [SocialMediaTypeDescription], [IsActive], [LoadDate]) VALUES (17, N'YouTube', 1, CURRENT_TIMESTAMP);

END