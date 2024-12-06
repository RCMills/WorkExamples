CREATE TABLE [audit].[Email] (
    [Id]                    INT           IDENTITY (1, 1) NOT NULL,
    [deletedEntityId]       INT           NULL,
    [deletedEmail]          VARCHAR (200) NULL,
    [deletedIsPrimary]      BIT           NULL,
    [deletedContactTypeId]  TINYINT       NULL,
    [insertedEntityId]      INT           NULL,
    [insertedEmail]         VARCHAR (200) NULL,
    [insertedIsPrimary]     BIT           NULL,
    [insertedContactTypeId] TINYINT       NULL,
    [Action]                NVARCHAR (10) NULL,
    [ActionDate]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

