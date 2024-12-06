
IF NOT EXISTS(SELECT * FROM [case].NoteType)
BEGIN
	
	INSERT [case].NoteType(Id, NoteTypeDescription)
	VALUES(
			1, 'Issue Description')
		, ( 2, 'Note')
		, ( 3, 'StepsToResolve');

END