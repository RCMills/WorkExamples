CREATE TABLE [case].[Category] (
    [CategoryId]          SMALLINT      NOT NULL,
    [CategoryDescription] VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_CaseCategory] PRIMARY KEY CLUSTERED ([CategoryId] ASC)
);

