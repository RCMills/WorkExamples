CREATE TABLE [dbo].[ContactType] (
    [ContactTypeId] INT           NOT NULL,
    [ContactType]   VARCHAR (255) NOT NULL,
    [PrimaryHierarchy] INT NULL,
    [LoadDate]      DATETIME      NULL,
    CONSTRAINT [PK__ContactType_Id] PRIMARY KEY CLUSTERED ([ContactTypeId] ASC)
);

