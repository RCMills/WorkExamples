CREATE TABLE [Catalog].[DiscountBusinessRule] (
    [Id]                INT          IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR(255)          NOT NULL
    CONSTRAINT [PK_DiscountBusinessRule] PRIMARY KEY CLUSTERED ([Id] ASC)
);

