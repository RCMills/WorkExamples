CREATE TABLE [dbo].[IndividualOfficeSync] (
    [Id]            INT          IDENTITY (1, 1) NOT NULL,
    [AgentId]       VARCHAR (40) NOT NULL,
    [ShortId]       VARCHAR (20) NOT NULL,
    [OfficeId]      VARCHAR (40) NOT NULL,
    [OfficeShortId] VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);




GO
GRANT ALTER
    ON OBJECT::[dbo].[IndividualOfficeSync] TO PUBLIC
    AS [dbo];

