CREATE TABLE [dbo].[QueueAlert]
(
	[Id] INT NOT NULL
	, [QueueDown] BIT NOT NULL
	, [NotificationDateTime] DATETIME2 NULL
	, [QueueUpdatedDate] DATETIME2 NOT NULL
	CONSTRAINT PK_QueueAlert PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
);

