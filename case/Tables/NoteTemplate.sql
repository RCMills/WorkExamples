CREATE TABLE [case].[NoteTemplate]
(
	[Id] INT IDENTITY(1,1) NOT NULL 
	, [TemplateName] varchar(50) NOT NULL
	, [Template] nvarchar(max) NOT NULL
	, [IsActive] bit NOT NULL
)
