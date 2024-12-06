CREATE TABLE [dbo].[EntityContactPreferenceHistory] (
    [EntityId]          INT           NOT NULL,
    [ContactMethod]     VARCHAR (50)  NULL,
    [ContactPreference] VARCHAR (500) NULL,
    [IsActive]          BIT           NULL,
    [ActiveFrom]        DATETIME2 (7) NOT NULL,
    [ActiveTo]          DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_EntityContactPreferenceHistory]
    ON [dbo].[EntityContactPreferenceHistory]([ActiveTo] ASC, [ActiveFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

