CREATE TABLE [dbo].[OfficeType] (
    [OfficeTypeId]          TINYINT      NOT NULL,
    [OfficeTypeDescription] VARCHAR (50) NULL,
    CONSTRAINT [PK_OfficeType_OfficeTypeId] PRIMARY KEY CLUSTERED ([OfficeTypeId] ASC)
);

