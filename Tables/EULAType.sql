CREATE TABLE [dbo].[EULAType] (
    [Id]          SMALLINT       NOT NULL,
    [Description] NVARCHAR (1000) NOT NULL,
    [CreatedDate] DATETIME       NOT NULL,
    CONSTRAINT [PK_EULAType] PRIMARY KEY CLUSTERED ([Id] ASC)
);

