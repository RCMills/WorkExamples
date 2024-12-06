CREATE TABLE [case].[Products] (
    [CaseProductId] INT           NOT NULL,
    [ProductName]   VARCHAR (100) NOT NULL,
    [IsActive] BIT NOT NULL DEFAULT 0x01,
    CONSTRAINT [PK_CaseProducts] PRIMARY KEY CLUSTERED ([CaseProductId] ASC)
);

