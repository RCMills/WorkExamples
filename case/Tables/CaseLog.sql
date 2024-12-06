CREATE TABLE [case].[CaseLog] (
    [CaseLogId]            INT                                         IDENTITY (1, 1) NOT NULL,
    [CaseStatusId]         SMALLINT                                    NOT NULL,
    [CaseId]               INT                                         NOT NULL,
    [CaseTypeId]           TINYINT                                     NOT NULL,
    [DirectionTypeId]      SMALLINT                                    NOT NULL,
    [SelectedEntityId]     INT                                         NULL,
    [AlertEndDate]         DATE                                        NULL,
    [FirstName]            VARCHAR (200)                               NULL,
    [LastName]             VARCHAR (200)                               NULL,
    [CustomerPhone]        VARCHAR (20)                                NULL,
    [CustomerEmail]        VARCHAR (200)                               NULL,
    [ActivityTypeId]       INT                                         NOT NULL,
    [DepartmentId]         INT                                         NOT NULL,
    [ProductTypeId]        INT                                         NOT NULL,
    [DeviceTypeId]         SMALLINT                                    NULL,
    [OperatingSystemId]    SMALLINT                                    NULL,
    [BrowserId]            SMALLINT                                    NULL,
    [EscalationId]         SMALLINT                                    NULL,
    [EscalationOperatorId] INT                                         NULL,
    [CategoryId]           INT                                         NULL,
    [SupportRep]           VARCHAR (200)                               NULL,
    [ModifiedBy]           INT                                         NULL,
    [ModifiedDate]         DATETIMEOFFSET (7)                          DEFAULT ((getutcdate() AT TIME ZONE 'US Mountain Standard Time')) NOT NULL,
    [CreatedBy]            INT                                         NULL,
    [CreatedDate]          DATETIMEOFFSET (7)                          DEFAULT ((getutcdate() AT TIME ZONE 'US Mountain Standard Time')) NOT NULL,
    [ActiveFrom]           DATETIME2 (7) GENERATED ALWAYS AS ROW START CONSTRAINT [DF_CaseLog_ActiveFrom] DEFAULT (getutcdate()) NOT NULL,
    [ActiveTo]             DATETIME2 (7) GENERATED ALWAYS AS ROW END   CONSTRAINT [DF__CaseLog_ActiveTo] DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    [AssignedTo] INT NULL , 
    [AssignedDate] DATETIMEOFFSET NULL, 
    CONSTRAINT [PK_CaseLog] PRIMARY KEY CLUSTERED ([CaseLogId] ASC),
    PERIOD FOR SYSTEM_TIME ([ActiveFrom], [ActiveTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[case].[CaseLogHistory], DATA_CONSISTENCY_CHECK=ON));
GO

CREATE NONCLUSTERED INDEX [IX_CaseLog_SelectedEntityId]
ON [case].[CaseLog] ([CaseId])
INCLUDE ([SelectedEntityId],[FirstName],[LastName],[ActivityTypeId],[DepartmentId],[ProductTypeId],[EscalationOperatorId],[ModifiedBy],[ModifiedDate])
GO

CREATE NONCLUSTERED INDEX IX_CaseLog_SelectedEntityId_AlertEndDate ON [case].[CaseLog]([SelectedEntityId],[AlertEndDate]);
GO

CREATE NONCLUSTERED INDEX IX_CaseLog_SelectedEntityId_CaseStatusId ON [Case].[CaseLog] ([SelectedEntityId], [CaseStatusId]);
GO


