CREATE TABLE [Catalog].[OverridePricing] (
    [Id]                INT          IDENTITY (1, 1) NOT NULL,
    [ExistingProductId] INT          NOT NULL,
    [UpgradeProductId]  INT          NOT NULL,
    [OverridePrice]     MONEY        NOT NULL,
    [ProductTypeId]     SMALLINT     NOT NULL,
    [ModifiedBy]        VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_OverridePricing] PRIMARY KEY CLUSTERED ([Id] ASC, [ExistingProductId] ASC, [UpgradeProductId] ASC)
);

