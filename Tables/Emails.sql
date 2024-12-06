CREATE TABLE [dbo].[Emails] (
    [EmailsId]      INT                                         IDENTITY (1, 1) NOT NULL,
    [EntityId]      INT                                         NOT NULL,
    [ContactTypeId] TINYINT                                     NOT NULL,
    [IsPrimary]     BIT                                         NULL,
    [Email]         VARCHAR (200)                               NULL,
    [ActiveFrom]    DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ActiveTo]      DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_Emails_Id] PRIMARY KEY CLUSTERED ([EmailsId] ASC),
    PERIOD FOR SYSTEM_TIME ([ActiveFrom], [ActiveTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[Emails_HISTORY], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_Emails_Email_Entity_Primary]
    ON [dbo].[Emails]([EntityId] ASC, [IsPrimary] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_Emails_Email]
	ON [dbo].[Emails](Email ASC);
