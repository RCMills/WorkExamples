CREATE TABLE [dbo].[EntityAssociationHistory] (
    [EntityId]      INT           NOT NULL,
    [AssociationId] INT           NOT NULL,
    [IsPrimary]     BIT           NOT NULL,
    [ActiveFrom]    DATETIME2 (7) NOT NULL,
    [ActiveTo]      DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_EntityAssociationHistory]
    ON [dbo].[EntityAssociationHistory]([ActiveTo] ASC, [ActiveFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

