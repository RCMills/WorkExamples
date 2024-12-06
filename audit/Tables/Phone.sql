CREATE TABLE [audit].[Phone] (
    [Id]                    INT           IDENTITY (1, 1) NOT NULL,
    [deletedEntityId]       INT           NULL,
    [deletedPhone]          VARCHAR (30)  NULL,
    [deletedContactTypeId]  TINYINT       NULL,
    [deletedIsPrimary]      BIT           NULL,
    [insertedEntityId]      INT           NULL,
    [insertedPhone]         VARCHAR (30)  NULL,
    [insertedContactTypeId] TINYINT       NULL,
    [insertedIsPrimary]     BIT           NULL,
    [Action]                NVARCHAR (10) NOT NULL,
    [UpdateDateTime]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

