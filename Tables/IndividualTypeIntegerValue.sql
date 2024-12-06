CREATE TABLE dbo.IndividualTypeIntegerValue(
	[ITID] int NOT NULL
	, [AttributeId] int NOT NULL
	, [IntegerValue] int NULL
	CONSTRAINT PK_IndividualTypeIntegerValue PRIMARY KEY ([ITID], [AttributeId])
);
