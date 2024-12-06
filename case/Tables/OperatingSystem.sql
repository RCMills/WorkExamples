CREATE TABLE [case].[OperatingSystem] (
    [OperatingSystemId] SMALLINT      NOT NULL,
    [OperatingSystem]   VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_CaseOperatingSystem] PRIMARY KEY CLUSTERED ([OperatingSystemId] ASC)
);

