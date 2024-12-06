CREATE TABLE [dbo].[EULA] (
    [Id]          SMALLINT       NOT NULL,
    [EULA]        NVARCHAR (MAX) NOT NULL,
    [TypeId]        SMALLINT       NULL,
    [MlsId]         SMALLINT       NULL,
    [CreatedDate] DATETIME       NOT NULL,
    [IsActive]    BIT            NOT NULL,
    CONSTRAINT [PK_EULA] PRIMARY KEY CLUSTERED ([Id] ASC)
);

