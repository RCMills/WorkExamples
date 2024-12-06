CREATE TABLE dbo.IndividualTypeAttributes(
	[AttributeId] int NOT NULL
	, [AttributeName] varchar(50) NOT NULL
	, [AttributeDataType] varchar(50)  -- Informational Purposes Only
	CONSTRAINT PK_IndividualTypeAttributes PRIMARY KEY ([AttributeId])
);