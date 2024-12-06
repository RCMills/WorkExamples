
IF NOT EXISTS(SELECT * FROM [case].Category WHERE CategoryDescription = 'Rule')
BEGIN

	INSERT [case].Category (CategoryId, CategoryDescription) VALUES (1, 'Rule');

END

IF NOT EXISTS(SELECT * FROM [case].Category WHERE CategoryDescription = 'Self-Reported')
BEGIN

	INSERT [case].Category (CategoryId, CategoryDescription) VALUES (2, 'Self-Reported');

END

IF NOT EXISTS(SELECT * FROM [case].Category WHERE CategoryDescription = 'Violation')
BEGIN

	INSERT [case].Category (CategoryId, CategoryDescription) VALUES (3, 'Violation');

END

IF NOT EXISTS(SELECT * FROM [case].Category WHERE CategoryDescription = 'Appeal')
BEGIN

	INSERT [case].Category (CategoryId, CategoryDescription) VALUES (4, 'Appeal');

END

IF NOT EXISTS(SELECT * FROM [case].Category WHERE CategoryDescription = 'Other')
BEGIN

	INSERT [case].Category (CategoryId, CategoryDescription) VALUES (5, 'Other');

END
