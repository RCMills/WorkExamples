CREATE TABLE [dbo].[AccountPermission]
(
	  [Id] INT NOT NULL PRIMARY KEY
	, [Name] VARCHAR(100) NOT NULL
	, [IsActive] BIT NOT NULL DEFAULT 0x01
)
