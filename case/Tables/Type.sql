CREATE TABLE [case].[Type] (
    [CaseTypeId] TINYINT       NOT NULL,
    [CaseType]   VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_CaseType] PRIMARY KEY CLUSTERED ([CaseTypeId] ASC)
);

