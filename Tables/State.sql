CREATE TABLE [dbo].[State] (
    [StateId]        INT          NOT NULL,
    [StateName]      VARCHAR (30) NULL,
    [StateShortName] VARCHAR (30) NULL,
    [LoadDate]       DATETIME     NULL,
    CONSTRAINT [PK_State_Id] PRIMARY KEY CLUSTERED ([StateId] ASC)
);

