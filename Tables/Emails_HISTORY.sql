CREATE TABLE [dbo].[Emails_HISTORY] (
    [EmailsId]      INT           NOT NULL,
    [EntityId]      INT           NOT NULL,
    [ContactTypeId] TINYINT       NOT NULL,
    [IsPrimary]     BIT           NULL,
    [Email]         VARCHAR (200) NULL,
    [ActiveFrom]    DATETIME2 (7) NOT NULL,
    [ActiveTo]      DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_Emails_HISTORY]
    ON [dbo].[Emails_HISTORY]([ActiveTo] ASC, [ActiveFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

