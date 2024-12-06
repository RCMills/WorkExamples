CREATE TABLE [dbo].[IndividualEULAAgreement] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [EntityId]      INT           NOT NULL,
    [Username]      VARCHAR (200) NOT NULL,
    [EULAId]        SMALLINT      NOT NULL,
    [AgreementDate] DATETIME      NOT NULL,
    [IPAddress]     VARCHAR (25)  NULL,
    CONSTRAINT [PK_IndividualEULAAgreement] PRIMARY KEY CLUSTERED ([Id] ASC)
);

