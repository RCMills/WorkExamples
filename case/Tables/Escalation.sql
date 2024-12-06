CREATE TABLE [case].[Escalation] (
    [EscalationId]          SMALLINT      NOT NULL,
    [EscalationDescription] VARCHAR (100) NOT NULL,
    [EmailAddress]          VARCHAR(100)  NOT NULL,
    [DepartmentId]          INT           NULL,
    [DisplayOrder]          INT           NOT NULL,
    CONSTRAINT [PK_CaseEscalation] PRIMARY KEY CLUSTERED ([EscalationId] ASC)
);

