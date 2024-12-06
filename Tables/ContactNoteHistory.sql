CREATE TABLE [dbo].[ContactNoteHistory] (
    [ContactNoteId]       INT           NOT NULL,
    [ContactIndividualId] INT           NULL,
    [ClientEntityId]      INT           NULL,
    [NoteCreator]         INT           NULL,
    [NoteTypeId]          TINYINT       NOT NULL,
    [NoteContent]         VARCHAR (MAX) NULL,
    [IsActive]            BIT           NULL,
    [ActiveStartDate]     DATETIME2 (7) NOT NULL,
    [ActiveEndDate]       DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_ContactNoteHistory]
    ON [dbo].[ContactNoteHistory]([ActiveEndDate] ASC, [ActiveStartDate] ASC) WITH (DATA_COMPRESSION = PAGE);

