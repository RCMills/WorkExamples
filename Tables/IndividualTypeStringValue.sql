CREATE TABLE dbo.IndividualTypeStringValue(
	[ITID] int NOT NULL
	, [AttributeId] int NOT NULL
	, [StringValue] varchar(50) NULL
	CONSTRAINT PK_IndividualTypeStringValue PRIMARY KEY ([ITID], [AttributeId])
);
