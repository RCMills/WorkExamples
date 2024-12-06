CREATE TABLE [dbo].[Addresses_HISTORY] (
    [AddressesId]   INT           NOT NULL,
    [EntityId]      INT           NOT NULL,
    [ContactTypeId] TINYINT       NOT NULL,
    [IsPrimary]     BIT           NULL,
    [AddressLine1]  VARCHAR (100) NULL,
    [AddressLine2]  VARCHAR (100) NULL,
    [City]          VARCHAR (100) NULL,
    [State]         VARCHAR (100) NULL,
    [Zip]           VARCHAR (32)  NULL,
    [County]        VARCHAR (100) NULL,
    [Country]       VARCHAR (50)  NULL,
    [Zip4]          VARCHAR (4)   NULL,
    [StateId]       TINYINT       NULL,
    [ActiveFrom]    DATETIME2 (7) NOT NULL,
    [ActiveTo]      DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_Addresses_HISTORY]
    ON [dbo].[Addresses_HISTORY]([ActiveTo] ASC, [ActiveFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

