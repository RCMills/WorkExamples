CREATE TABLE [dbo].[IndividualOfficeHistory] (
    [OfficeEntityId]     INT           NOT NULL,
    [IndividualEntityId] INT           NOT NULL,
    [ActiveFrom]         DATETIME2 (7) NOT NULL,
    [ActiveTo]           DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_IndividualOfficeHistory]
    ON [dbo].[IndividualOfficeHistory]([ActiveTo] ASC, [ActiveFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

