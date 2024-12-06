CREATE TABLE [dbo].[Appeal]
(
	[AppealId] INT IDENTITY(1,1) NOT NULL
	,[ViolationStatusTypeId] SMALLINT NOT NULL
	,[OrderNumber] INT NULL
	,[Amount] MONEY NOT NULL
	,[ProductId] INT NOT NULL
	,[ProductDescription] VARCHAR(250) NOT NULL
	,[CreatedDate]  DateTime2(7) NOT NULL
	,[CreatedBy] INT NOT NULL
	,[ModifiedDate] DATETIME2(7) NOT NULL
	,[ModifiedBy] INT NOT NULL
	CONSTRAINT PK_Appeal PRIMARY KEY CLUSTERED ([AppealId])
) ON [PRIMARY]
GO

