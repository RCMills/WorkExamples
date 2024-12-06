CREATE TABLE [Catalog].[ProductTypes] (
    [ProductTypeId] INT           NOT NULL,
    [ProductType]   VARCHAR (100) NOT NULL,
    [IsActive]      BIT           NOT NULL,
    [IsPackage]     BIT           NOT NULL,
    [IsBillable]    BIT           NOT NULL,
    [Grantable]  BIT               NOT NULL,
    [AvailableToPurchase] BIT   NOT NULL
    CONSTRAINT [PK_ProductTypes_Id] PRIMARY KEY CLUSTERED ([ProductTypeId] ASC)
);

