CREATE TABLE [dbo].[SearchExclusion_History](
	[EntityId] [int] NOT NULL,
	[Username] [varchar](200) NOT NULL,
	[ActiveFrom] [datetime2](7) NOT NULL,
	[ActiveTo] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO

