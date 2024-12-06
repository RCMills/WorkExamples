CREATE TABLE [dbo].[JSONLogs] (
    [Id]                 INT                IDENTITY (1, 1) NOT NULL,
    [StoredProcedure]    NVARCHAR (256)     NOT NULL,
    [JSON]               NVARCHAR (MAX)     NOT NULL,
    [TimestampUTCOffset] DATETIMEOFFSET (7) DEFAULT (sysdatetimeoffset()) NULL,
    CONSTRAINT [PK_JSONLogs] PRIMARY KEY CLUSTERED ([Id] ASC)
);

