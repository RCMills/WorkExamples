CREATE TABLE [dbo].[SearchExclusion](
	[EntityId] [int] NOT NULL,
	[Username] [varchar](200) NOT NULL,
	[ActiveFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ActiveTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_SearchExclusion] PRIMARY KEY CLUSTERED 
(
	[EntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ActiveFrom], [ActiveTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [dbo].[SearchExclusion_History] )
)
GO

ALTER TABLE [dbo].[SearchExclusion] ADD  CONSTRAINT [DF_SearchExclusion_ActiveFrom]  DEFAULT (getdate()) FOR [ActiveFrom]
GO

ALTER TABLE [dbo].[SearchExclusion] ADD  CONSTRAINT [DF_SearchExclusion_ActiveTo]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) FOR [ActiveTo]
GO

