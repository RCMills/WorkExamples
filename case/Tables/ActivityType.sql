CREATE TABLE [case].[ActivityType] (
    [ActivityTypeId]          INT           NOT NULL,
    [ActivityTypeDescription] VARCHAR (100) NOT NULL,
    [IconPrefix] varchar(10) NULL,
    [Icon] varchar(100) NULL
    CONSTRAINT [PK_CaseContactType] PRIMARY KEY CLUSTERED ([ActivityTypeId] ASC)
);

