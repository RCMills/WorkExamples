CREATE TABLE [dbo].[OfficeHistory] (
    [EntityId]         INT            NOT NULL,
    [ParentEntityId]   INT            NULL,
    [UserName]         VARCHAR (40)   NULL,
    [Name]             VARCHAR (100)  NOT NULL,
    [OfficeTypeId]     TINYINT        NULL,
    [OfficeId]         VARCHAR (40)   NULL,
    [OfficeStatus]     VARCHAR (30)   NULL,
    [NRDSID]           BIGINT         NULL,
    [URL]              VARCHAR (100)  NULL,
    [PhotoLocation]    VARCHAR (1000) NULL,
    [MLSID]            VARCHAR (40)   NULL,
    [IDXParticipation] BIT            NULL,
    [LegacyLogonType]  VARCHAR (50)   NULL,
    [BrokerEntityId]   INT            NULL,
	[LicenseNumber]		VARCHAR(50)		NULL,
    [ActiveFrom]       DATETIME2 (7)  NOT NULL,
    [ActiveTo]         DATETIME2 (7)  NOT NULL
);




GO
CREATE CLUSTERED INDEX [ix_OfficeHistory]
    ON [dbo].[OfficeHistory]([ActiveTo] ASC, [ActiveFrom] ASC);



