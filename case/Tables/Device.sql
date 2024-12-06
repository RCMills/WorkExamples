CREATE TABLE [case].[Device] (
    [DeviceId]          SMALLINT      NOT NULL,
    [DeviceDescription] VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_CaseDevice] PRIMARY KEY CLUSTERED ([DeviceId] ASC)
);

