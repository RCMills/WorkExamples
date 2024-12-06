CREATE TABLE [dbo].[ContactNote] (
    [ContactNoteId]       INT                                         IDENTITY (1, 1) NOT NULL,
    [ContactIndividualId] INT                                         NULL,
    [ClientEntityId]      INT                                         NULL,
    [NoteCreator]         INT                                         NULL,
    [NoteTypeId]          TINYINT                                     CONSTRAINT [DF_ContactNote_NoteTypeId] DEFAULT ((1)) NOT NULL,
    [NoteContent]         VARCHAR (MAX)                               NULL,
    [IsActive]            BIT                                         NULL,
    [ActiveStartDate]     DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ActiveEndDate]       DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_ContactNote_Id] PRIMARY KEY CLUSTERED ([ContactNoteId] ASC),
    PERIOD FOR SYSTEM_TIME ([ActiveStartDate], [ActiveEndDate])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[ContactNoteHistory], DATA_CONSISTENCY_CHECK=ON));

