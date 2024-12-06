CREATE TABLE [Catalog].[PackageContents] (
    [PackageProductId] INT NOT NULL,
    [ContentProductId] INT NOT NULL,
    [IsActive]         BIT NOT NULL,
	[VisibleInPurchase] BIT NULL
    CONSTRAINT [PK_PackageContents_PackageProductId_ContentProductId] PRIMARY KEY CLUSTERED ([PackageProductId] ASC, [ContentProductId] ASC)
);

