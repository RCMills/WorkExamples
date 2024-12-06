CREATE TABLE [dbo].[SourceSystem] (
    [SourceSystemId] INT           NOT NULL,
    [SourceSystem]   VARCHAR (255) NULL,
    [IsActive]       BIT           NULL,
    [LoadDate]       DATETIME      NULL,
    [ModifiedDate]   DATETIME      NULL,
    CONSTRAINT [PK_SourseSystem_Id] PRIMARY KEY CLUSTERED ([SourceSystemId] ASC)
);

