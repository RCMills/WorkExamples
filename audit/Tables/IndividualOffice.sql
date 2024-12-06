CREATE TABLE [audit].[IndividualOffice] (
    [Id]                         INT           IDENTITY (1, 1) NOT NULL,
    [InsertedOfficeEntityId]     INT           NULL,
    [InsertedIndividualEntityId] INT           NULL,
    [DeletedOfficeEntityId]      INT           NULL,
    [DeletedIndividualEntityId]  INT           NULL,
    [Action]                     NVARCHAR (10) NULL,
    [ActionDate]                 DATETIME      CONSTRAINT [df_auditIndividualOffice_Def] DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

