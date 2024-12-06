CREATE TABLE [dbo].[Addresses] (
    [AddressesId]   INT                                         IDENTITY (1, 1) NOT NULL,
    [EntityId]      INT                                         NOT NULL,
    [ContactTypeId] TINYINT                                     NOT NULL,
    [IsPrimary]     BIT                                         NULL,
    [AddressLine1]  VARCHAR (100)                               NULL,
    [AddressLine2]  VARCHAR (100)                               NULL,
    [City]          VARCHAR (100)                               NULL,
    [State]         VARCHAR (100)                               NULL,
    [Zip]           VARCHAR (32)                                NULL,
    [County]        VARCHAR (100)                               NULL,
    [Country]       VARCHAR (50)                                NULL,
    [Zip4]          VARCHAR (4)                                 NULL,
    [StateId]       TINYINT                                     NULL,
    [ActiveFrom]    DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ActiveTo]      DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_Addresses_Id] PRIMARY KEY CLUSTERED ([AddressesId] ASC),
    PERIOD FOR SYSTEM_TIME ([ActiveFrom], [ActiveTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[Addresses_HISTORY], DATA_CONSISTENCY_CHECK=ON));
GO

CREATE INDEX IX_Addresses_EntityId_IsPrimary ON dbo.Addresses([EntityId], [IsPrimary]) INCLUDE ([AddressLine1],[AddressLine2],[City],[State],[Zip]);
GO

