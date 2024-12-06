CREATE TABLE [case].[Department] (
    [DepartmentId]          INT           NOT NULL,
    [DepartmentDescription] VARCHAR (100) NOT NULL,
    [V1Prefix] varchar(10) NULL,
    [V2Prefix] varchar(10) NULL,
    [Icon] VARCHAR(50) NULL
    CONSTRAINT [PK_CaseDepartment] PRIMARY KEY CLUSTERED ([DepartmentId] ASC)
);

