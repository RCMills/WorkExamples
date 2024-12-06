CREATE TABLE [dbo].[AppRole] (
    [RoleId]       INT          IDENTITY (1, 1) NOT NULL,
    [RoleName]     VARCHAR (30) NULL,
    [IsActive]     BIT          NULL,
    [LoadDate]     DATETIME     NULL,
	[CanCreateCases] BIT		NULL,
    [Assignable]    BIT         NULL,
    [HomeRoute]     NVARCHAR(200) NULL,
    [HomeRoutePriority] INT     NULL,
    [ModifiedDate] DATETIME     NULL,
    CONSTRAINT [PK_Role_Id] PRIMARY KEY CLUSTERED ([RoleId] ASC)
);

