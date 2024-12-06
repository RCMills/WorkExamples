CREATE TABLE [case].[Direction] (
    [DirectionTypeId]      SMALLINT      NOT NULL,
    [DirectionDescription] VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_CaseDirection] PRIMARY KEY CLUSTERED ([DirectionTypeId] ASC)
);

