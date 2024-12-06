CREATE TABLE [dbo].[Phones] (
    [PhonesId]      INT                                         IDENTITY (1, 1) NOT NULL,
    [EntityId]      INT                                         NOT NULL,
    [ContactTypeId] TINYINT                                     NOT NULL,
    [IsPrimary]     BIT                                         NULL,
    [Phone]         VARCHAR (30)                                NULL,
    [Extension]     VARCHAR (20)                                NULL,
     CONSTRAINT [PK_Phones_Id] PRIMARY KEY CLUSTERED ([PhonesId] ASC),
 )

GO
CREATE NONCLUSTERED INDEX [IX_Phones_EntityPhone]
    ON [dbo].[Phones]([EntityId] ASC, [Phone] ASC);
GO


