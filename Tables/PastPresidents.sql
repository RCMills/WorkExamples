CREATE TABLE [dbo].[PastPresidents] (
    [Id]       INT           IDENTITY (1, 1) NOT NULL,
    [Username] VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_PastPresidents_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);

