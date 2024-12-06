CREATE TABLE [dbo].[ViolationStatusType] (
    [ViolationStatusTypeId] SMALLINT       NOT NULL,
    [Description]           VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_ViolationStatusType_Id] PRIMARY KEY CLUSTERED ([ViolationStatusTypeId] ASC)
);

