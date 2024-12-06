CREATE TABLE [dbo].[ADREIndividual] (
    [ADREIndividualId]      INT             IDENTITY (1, 1) NOT NULL,
    [FirstName]             VARCHAR (100)   NULL,
    [MiddleName]            VARCHAR (100)   NULL,
    [LastName]              VARCHAR (100)   NULL,
    [LicenseCategory]       VARCHAR (100)   NULL,
    [LicenseType]           VARCHAR (100)   NULL,
    [LicenseNumber]         VARCHAR (100)   NOT NULL,
    [LicenseStatus]         VARCHAR (100)   NULL,
    [EmploymentType]        VARCHAR (100)   NULL,
    [EmployerLegalName]     VARCHAR (100)   NULL,
    [EmployerDBAName]       VARCHAR (100)   NULL,
    [EmployerLicenseNumber] VARCHAR (100)   NULL,
    [EmployerPhone]         VARCHAR (100)   NULL,
    [EmployerFax]           VARCHAR (100)   NULL,
    [MailingAddress1]       VARCHAR (100)   NULL,
    [MailingAddress2]       VARCHAR (100)   NULL,
    [MailingCity]           VARCHAR (100)   NULL,
    [MailingState]          VARCHAR (100)   NULL,
    [MailingZip]            VARCHAR (100)   NULL,
    [MailingCounty]         VARCHAR (100)   NULL,
    [OriginalDate]          VARCHAR (100)   NULL,
    [ExpireDate]            VARCHAR (100)   NULL,
    [LastModified]          VARCHAR (100)   NULL,
    [LoadDate]              DATETIME2 (7)   NULL,
    [LoadEndDate]           DATETIME2 (7)   NULL,
    [SearchString]          NVARCHAR (1000) NULL,
    CONSTRAINT [PK_ADREIndividual_Id] PRIMARY KEY CLUSTERED ([ADREIndividualId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ADREIndividual]
    ON [dbo].[ADREIndividual]([FirstName] ASC);


GO
CREATE NONCLUSTERED INDEX [ix_ADRELicenseNumber]
    ON [dbo].[ADREIndividual]([LicenseNumber] ASC)
    INCLUDE([FirstName], [LastName], [ADREIndividualId]);


GO
CREATE NONCLUSTERED INDEX [ix_ADRELastName]
    ON [dbo].[ADREIndividual]([LastName] ASC)
    INCLUDE([FirstName], [LicenseNumber], [ADREIndividualId]);


GO
CREATE NONCLUSTERED INDEX [ix_ADREFirstName]
    ON [dbo].[ADREIndividual]([FirstName] ASC)
    INCLUDE([LastName], [LicenseNumber], [ADREIndividualId]);

