CREATE TABLE [dbo].[SsoClients] (
    [SsoClientId]          INT           NOT NULL,
    [SsoClientDescription] VARCHAR (100) NOT NULL,
    [SsoClientString]      VARCHAR (500) NOT NULL,
    [ProductRequired]      BIT           DEFAULT (0x01) NOT NULL,
    [IsActive]             BIT           DEFAULT (0x00) NOT NULL,
    PRIMARY KEY CLUSTERED ([SsoClientId] ASC)
);

