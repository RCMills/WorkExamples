CREATE TABLE [dbo].[ComplianceStatus] (
    [ComplianceStatusId]          INT           IDENTITY (1, 1) NOT NULL,
    [ComplianceStatusDescription] VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_ComplianceStatus_Id] PRIMARY KEY CLUSTERED ([ComplianceStatusId] ASC)
);

