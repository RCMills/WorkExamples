CREATE TABLE [dbo].[OfficeStaffQueue] (
    [Id]                       INT           IDENTITY (1, 1) NOT NULL,
    [OfficeStaffQueueStatusId] INT           NULL,
    [FirstName]                VARCHAR (100) NOT NULL,
    [LastName]                 VARCHAR (100) NOT NULL,
    [AddressLine1]             VARCHAR (100) NOT NULL,
    [AddressLine2]             VARCHAR (100) NULL,
    [City]                     VARCHAR (100) NOT NULL,
    [State]                    VARCHAR (100) NOT NULL,
    [Zip]                      VARCHAR (32)  NOT NULL,
    [Phone]                    VARCHAR (20)  NOT NULL,
    [Email]                    VARCHAR (200) NOT NULL,
    [ApplicantRole]            VARCHAR (20)  NOT NULL,
    [UserName]                 VARCHAR (200) NULL,
    [FlexId]                   VARCHAR (50)  NULL,
    [OfficeEntityId]           INT           NOT NULL,
    [BrokerEntityId]           INT           NOT NULL,
    [MLSID]                    INT           NULL,
    [CreatedDateTime]          DATETIME      NOT NULL,
    [CreatedBy]                INT           NOT NULL,
    CONSTRAINT [PK_OfficeStaffQueue_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO

CREATE INDEX IX_OfficeStaffQueue_FlexId ON dbo.OfficeStaffQueue([FlexId]);
GO
