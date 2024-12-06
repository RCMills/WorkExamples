CREATE TABLE dbo.IndividualTypeBitValue(
	[ITID] int NOT NULL
	, [AttributeId] int NOT NULL
	, [BitValue] bit NULL
	CONSTRAINT PK_IndividualTypeBitValue PRIMARY KEY ([ITID], [AttributeId])
);
