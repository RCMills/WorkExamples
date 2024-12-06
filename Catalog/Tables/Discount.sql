CREATE TABLE [Catalog].[Discount] (
      [Id]           INT IDENTITY (1, 1) NOT NULL
    , [Description]  VARCHAR(255)        NOT NULL
    , [DiscountCode] VARCHAR(50)         NOT NULL
    , [IsActive]     BIT                 NOT NULL DEFAULT 0x01
    , CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED ([Id] ASC, [DiscountCode])
);

