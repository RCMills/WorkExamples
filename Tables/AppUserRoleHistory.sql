CREATE TABLE [dbo].[AppUserRoleHistory] (
    [AppUserEntityId] INT           NOT NULL,
    [RoleId]          INT           NOT NULL,
    [ActiveFrom]      DATETIME2 (7) NOT NULL,
    [ActiveTo]        DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_AppUserRoleHistory]
    ON [dbo].[AppUserRoleHistory]([ActiveTo] ASC, [ActiveFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

