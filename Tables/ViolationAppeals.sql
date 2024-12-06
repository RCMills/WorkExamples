CREATE TABLE [dbo].[ViolationAppeals]
(
	[AppealId] INT NOT NULL
	,[ViolationId] INT NOT NULL
	CONSTRAINT PK_ViolationRelationships PRIMARY KEY ([AppealId], [ViolationId])
) ON [PRIMARY]
GO