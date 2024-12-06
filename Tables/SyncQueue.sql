CREATE TABLE [dbo].[SyncQueue] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [UserName]     VARCHAR (200) NOT NULL,
    [FlexHash]     VARCHAR (200) NULL,
    [PasswordHash] VARCHAR (500) NULL,
    [PasswordSalt] VARCHAR (500) NULL,
    [CreatedDate]  DATETIME      DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SyncQueue_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);

