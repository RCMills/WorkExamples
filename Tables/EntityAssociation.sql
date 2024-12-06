CREATE TABLE [dbo].[EntityAssociation] (
    [EntityId]      INT                                         NOT NULL,
    [AssociationId] INT                                         NOT NULL,
    [IsPrimary]     BIT                                         CONSTRAINT [DF_EntityAssociation_IsPrimary] DEFAULT (0x01) NOT NULL,
    [ActiveFrom]    DATETIME2 (7) GENERATED ALWAYS AS ROW START CONSTRAINT [DF__EntityAssociation_ActiveFrom] DEFAULT (getdate()) NOT NULL,
    [ActiveTo]      DATETIME2 (7) GENERATED ALWAYS AS ROW END   CONSTRAINT [DF__EntityAssociation_ActiveTo] DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    CONSTRAINT [PK_EntityAssociation_EntityId_AssociationId] PRIMARY KEY CLUSTERED ([EntityId] ASC, [AssociationId] ASC),
    PERIOD FOR SYSTEM_TIME ([ActiveFrom], [ActiveTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[EntityAssociationHistory], DATA_CONSISTENCY_CHECK=ON));

