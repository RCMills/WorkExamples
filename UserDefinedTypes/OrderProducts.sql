CREATE TYPE [dbo].[OrderProducts] AS TABLE (
    [ProductId]     INT           NULL,
    [Quantity]      SMALLINT      NULL,
    [ProductTypeId] SMALLINT      NULL,
    [ProductType]   VARCHAR (100) NULL,
    [CatalogPrice]  MONEY         NULL,
    [GLAccount]     INT           NULL);

