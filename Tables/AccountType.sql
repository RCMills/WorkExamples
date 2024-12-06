CREATE TABLE [dbo].[AccountType]
(
	  [Id] INT NOT NULL PRIMARY KEY
	, [Name] VARCHAR(100) NOT NULL
	, [IsActive] BIT NOT NULL DEFAULT 0x01
)
