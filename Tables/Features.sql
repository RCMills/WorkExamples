CREATE TABLE [dbo].[Features]
(
	[FeatureId] INT IDENTITY(1,1) NOT NULL
	, [FeatureName] VARCHAR(50) NOT NULL
	, [FeatureDescription] VARCHAR(256) NOT NULL
	, [ActiveFrom] datetime2(7) GENERATED ALWAYS AS ROW START CONSTRAINT [DF_Features_ActiveFrom] DEFAULT (getdate()) NOT NULL
	, [ActiveTo] datetime2(7) GENERATED ALWAYS AS ROW END CONSTRAINT [DF_Features_ActiveTo] DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL
	, CONSTRAINT PK_Feaures PRIMARY KEY ([FeatureId])
	, PERIOD FOR SYSTEM_TIME ([ActiveFrom], [ActiveTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[FeaturesHistory], DATA_CONSISTENCY_CHECK=ON));
GO


