CREATE TABLE [case].[CaseLogHistory] (
    [CaseLogId]            INT                NOT NULL,
    [CaseStatusId]         SMALLINT           NOT NULL,
    [CaseId]               INT                NOT NULL,
    [CaseTypeId]           TINYINT            NOT NULL,
    [DirectionTypeId]      SMALLINT           NOT NULL,
    [SelectedEntityId]     INT                NULL,
    [AlertEndDate]         DATE               NULL,
    [FirstName]            VARCHAR (200)      NULL,
    [LastName]             VARCHAR (200)      NULL,
    [CustomerPhone]        VARCHAR (20)       NULL,
    [CustomerEmail]        VARCHAR (200)      NULL,
    [ActivityTypeId]       INT                NOT NULL,
    [DepartmentId]         INT                NOT NULL,
    [ProductTypeId]        INT                NOT NULL,
    [DeviceTypeId]         SMALLINT           NULL,
    [OperatingSystemId]    SMALLINT           NULL,
    [BrowserId]            SMALLINT           NULL,
    [EscalationId]         SMALLINT           NULL,
    [EscalationOperatorId] INT                NULL,
    [CategoryId]           INT                NULL,
    [SupportRep]           VARCHAR (200)      NULL,
    [ModifiedBy]           INT                NULL,
    [ModifiedDate]         DATETIMEOFFSET (7) NOT NULL,
    [CreatedBy]            INT                NULL,
    [CreatedDate]          DATETIMEOFFSET (7) NOT NULL,
    [ActiveFrom]           DATETIME2 (7)      NOT NULL,
    [ActiveTo]             DATETIME2 (7)      NOT NULL, 
    [AssignedTo] INT NULL, 
    [AssignedDate] DATETIMEOFFSET NULL
);


GO
CREATE CLUSTERED INDEX [ix_CaseLogHistory]
    ON [case].[CaseLogHistory]([ActiveTo] ASC, [ActiveFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

