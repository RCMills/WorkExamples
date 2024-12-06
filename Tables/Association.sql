CREATE TABLE [dbo].[Association] (
    [AssociationId]   INT           NOT NULL,
    [MLSID]           INT           NOT NULL,
    [FlexId]          VARCHAR (50)  NOT NULL,
    [AssociationName] VARCHAR (30)  NOT NULL,
    [Address]         VARCHAR (255) NOT NULL,
    [Phone]           VARCHAR (10)  NOT NULL,
    [Active]            BIT                     NULL
    CONSTRAINT [PK_Association_Id] PRIMARY KEY CLUSTERED ([AssociationId] ASC)
);

