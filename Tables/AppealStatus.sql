CREATE TABLE [dbo].[AppealStatus]
(
      [AppealStatusId] SMALLINT      NOT NULL
    , [Description]      VARCHAR (200) NOT NULL
    , CONSTRAINT [PK_AppealStatusId] PRIMARY KEY CLUSTERED ([AppealStatusId] ASC)
) ON [PRIMARY]
GO

