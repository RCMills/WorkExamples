CREATE TABLE [case].[Tagged] (
    [TaggedId]       INT IDENTITY (1, 1) NOT NULL,
    [TaggedEntityId] INT NOT NULL,
    [CaseId]         INT NOT NULL,
    CONSTRAINT [PK_CaseTagged] PRIMARY KEY CLUSTERED ([TaggedEntityId], [CaseId])
);

GO

