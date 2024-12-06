CREATE TABLE [Catalog].[DiscountDetail] (
    [DiscountId] INT  NOT NULL,
    [PackageId] INT  NOT NULL,
    [Price] MONEY NULL,
    [Percentage] DECIMAL(5, 2) NULL, 
    CONSTRAINT [PK_DiscountDetail] PRIMARY KEY CLUSTERED ([DiscountId], [PackageId])    
);

