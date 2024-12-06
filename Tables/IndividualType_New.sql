CREATE TABLE dbo.IndividualType_New(
	[ITID] int identity(1,1)
	, [IndividualTypeId] int NOT NULL
	, [MLSID] int NOT NULL
	, [LogonType] varchar(50) NOT NULL -- Value from EDW for a given MLS
	CONSTRAINT PK_IndividualType_New PRIMARY KEY CLUSTERED ([ITID])
	, CONSTRAINT UQ_IndividualTypeId_MLSID UNIQUE ([IndividualTypeId],[MLSID])
);
