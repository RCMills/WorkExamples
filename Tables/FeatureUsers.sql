CREATE TABLE [dbo].[FeatureUsers]
(
	[FeatureId] INT NOT NULL
	, [EntityId] INT NOT NULL
	, [ActiveFrom] datetime2(7) GENERATED ALWAYS AS ROW START CONSTRAINT [DF_FeatureUsers_ActiveFrom] DEFAULT (getdate()) NOT NULL
	, [ActiveTo] datetime2(7) GENERATED ALWAYS AS ROW END CONSTRAINT [DF_FeatureUsers_ActiveTo] DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL
	, CONSTRAINT PK_FeaureUsers PRIMARY KEY ([FeatureId], [EntityId])
	, PERIOD FOR SYSTEM_TIME ([ActiveFrom], [ActiveTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[FeatureUsersHistory], DATA_CONSISTENCY_CHECK=ON));
GO

