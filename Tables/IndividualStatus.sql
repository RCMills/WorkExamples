CREATE TABLE [dbo].[IndividualStatus] (
    [IndividualStatusTypeId] SMALLINT     NOT NULL,
    [Description]            VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_IndividualStatus_Id] PRIMARY KEY CLUSTERED ([IndividualStatusTypeId] ASC)
);

