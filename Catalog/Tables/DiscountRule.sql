CREATE TABLE [Catalog].[DiscountRule] (
    [DiscountId] INT  NOT NULL,
    [BusinessRuleId] INT  NOT NULL   
    CONSTRAINT [PK_DiscountRule] PRIMARY KEY CLUSTERED ([DiscountId], [BusinessRuleId])
);

