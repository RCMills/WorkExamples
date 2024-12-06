CREATE TABLE [case].[Status] (
    [CaseStatusId]          SMALLINT      NOT NULL,
    [CaseStatusDescription] VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_CaseStatus] PRIMARY KEY CLUSTERED ([CaseStatusId] ASC)
);

