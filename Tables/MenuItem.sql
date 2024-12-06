CREATE TABLE [dbo].[MenuItem]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Text] VARCHAR(255) NULL,
    [Link] VARCHAR(255) NULL,
    [Icon] VARCHAR(255) NULL,
    [IconPrefix] VARCHAR(10) NULL,
    [IsFontIcon] BIT NULL DEFAULT 0x00,
    [Parent] INT NULL,
    [DisplayOrder] INT NULL,
    [RequiresSubscription] BIT NOT NULL DEFAULT 0x01,
    [OnlyAvailableWithoutSubscription] BIT NOT NULL DEFAULT 0x00,
    [BrokerOnly] BIT NOT NULL DEFAULT 0x00,
    [RequiresActiveWithAssociation] BIT NOT NULL DEFAULT 0x01,
    [IsExternalLink] BIT NULL DEFAULT 0x00
)
