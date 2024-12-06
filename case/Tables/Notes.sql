CREATE TABLE [case].[Notes] (
    [NoteId]            INT                IDENTITY (1, 1) NOT NULL,
    [NoteTypeId]        TINYINT            NULL,
    [CaseId]            INT                NOT NULL,
    [Text]              NVARCHAR (MAX)     NULL,
    [ModifiedBy]        INT                NULL,
    [NoteDate]          DATETIMEOFFSET (7) NOT NULL,
    [CreatedDate]       DATETIMEOFFSET (7) NULL,
    [CreatedByEntityId] INT                NOT NULL,
    CONSTRAINT [PK_CaseNotes] PRIMARY KEY CLUSTERED ([NoteId] ASC)
);
GO

CREATE NONCLUSTERED INDEX [IX_CaseNotes_NoteTypeCaseId]
ON [case].[Notes] ([NoteTypeId],[CaseId])
INCLUDE ([Text])
GO

CREATE NONCLUSTERED INDEX [IX_CaseNotes_CaseId] ON [case].[Notes]([CaseId]) INCLUDE ([NoteId],[NoteTypeId],[Text],[ModifiedBy],[CreatedDate],[CreatedByEntityId]);
GO
