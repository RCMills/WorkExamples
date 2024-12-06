CREATE TABLE [dbo].[AppUserRole] (
    [AppUserEntityId] INT                                         NOT NULL,
    [RoleId]          INT                                         NOT NULL,
    [ActiveFrom]      DATETIME2 (7) GENERATED ALWAYS AS ROW START DEFAULT (getdate()) NOT NULL,
    [ActiveTo]        DATETIME2 (7) GENERATED ALWAYS AS ROW END   DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    CONSTRAINT [PK_AppUserRole_EntityId_RoleId] PRIMARY KEY CLUSTERED ([AppUserEntityId] ASC, [RoleId] ASC),
    PERIOD FOR SYSTEM_TIME ([ActiveFrom], [ActiveTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[AppUserRoleHistory], DATA_CONSISTENCY_CHECK=ON));

