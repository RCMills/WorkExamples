CREATE TABLE [dbo].[Office] (
    [EntityId]         INT                                         NOT NULL,
    [ParentEntityId]   INT                                         NULL,
    [UserName]         VARCHAR (40)                                NULL,
    [Name]             VARCHAR (100)                               NOT NULL,
    [OfficeTypeId]     TINYINT                                     NULL,
    [OfficeId]         VARCHAR (40)                                NULL,
    [OfficeStatus]     VARCHAR (30)                                NULL,
    [NRDSID]           BIGINT                                      NULL,
    [URL]              VARCHAR (100)                               NULL,
    [PhotoLocation]    VARCHAR (1000)                              NULL,
    [MLSID]            VARCHAR (40)                                NULL,
    [IDXParticipation] BIT                                         NULL,
    [LegacyLogonType]  VARCHAR (50)                                NULL,
    [BrokerEntityId]   INT                                         NULL,
	[LicenseNumber]		VARCHAR(50)								   NULL,
    [ActiveFrom]       DATETIME2 (7) GENERATED ALWAYS AS ROW START CONSTRAINT [DF__Office_ActiveFrom] DEFAULT (getdate()) NOT NULL,
    [ActiveTo]         DATETIME2 (7) GENERATED ALWAYS AS ROW END   CONSTRAINT [DF__Office_ActiveTo] DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    CONSTRAINT [PK_Office_EntityID] PRIMARY KEY CLUSTERED ([EntityId] ASC),
    PERIOD FOR SYSTEM_TIME ([ActiveFrom], [ActiveTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[OfficeHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UQ_Office]
    ON [dbo].[Office]([OfficeId] ASC)
    WHERE [OfficeID] IS NOT NULL;

GO

CREATE NONCLUSTERED INDEX [IX_Office_BrokerEntityId] 
    ON [dbo].[Office]([BrokerEntityId]);
GO


