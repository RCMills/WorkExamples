CREATE TABLE [dbo].[EntityContactPreference] (
    [EntityId]          INT                                         NOT NULL,
    [ContactMethod]     VARCHAR (50)                                NULL,
    [ContactPreference] VARCHAR (500)                               NULL,
    [IsActive]          BIT                                         NULL,
    [ActiveFrom]        DATETIME2 (7) GENERATED ALWAYS AS ROW START DEFAULT (getdate()) NOT NULL,
    [ActiveTo]          DATETIME2 (7) GENERATED ALWAYS AS ROW END   DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    CONSTRAINT [PK_EntityContactPreference_EntityId] PRIMARY KEY CLUSTERED ([EntityId] ASC),
    PERIOD FOR SYSTEM_TIME ([ActiveFrom], [ActiveTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[EntityContactPreferenceHistory], DATA_CONSISTENCY_CHECK=ON));

