CREATE TYPE [dbo].[OrderLineItems] AS TABLE (
    [OrderNumber]          INT           NULL,
    [OrderLineItem]        SMALLINT      NULL,
    [ProductId]            INT           NULL,
    [ParentProductId]      INT           NULL,
    [ProductTier]          TINYINT       NULL,
    [ProductDisplayName]   VARCHAR (255) NULL,
    [Price]                MONEY         NULL,
    [SubscriptionPeriod]   SMALLINT      NULL,
    [AccountNumber]        INT           NULL,
    [ProductTypeId]        INT           NULL,
    [PurchasedForEntityId] INT           NULL,
    [SubscriptionEndDate]  DATETIMEOFFSET (7)     NULL);

