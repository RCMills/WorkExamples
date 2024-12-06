CREATE TABLE [dbo].[IndividualContact] (
    [EntityId]           INT                                         NOT NULL,
    [AssistantName]      VARCHAR (150)                               NULL,
    [AssistantPhone]     VARCHAR (20)                                NULL,
    [AssistantPhoneExt]  VARCHAR (20)                                NULL,
    [AssistantEmail]     VARCHAR (200)                               NULL,
    [Company]            VARCHAR (50)                                NULL,
    [Department]         VARCHAR (50)                                NULL,
    [Birthdate]          DATE                                        NULL,
    [Anniversary]        DATE                                        NULL,
    [SpousePartnerName]  VARCHAR (150)                               NULL,
    [Children]           VARCHAR (150)                               NULL,
    [LeadSource]         VARCHAR (150)                               NULL,
    [ReferredBy]         VARCHAR (150)                               NULL,
    [ContactContactType] INT                                         NULL,
    [ActiveFrom]         DATETIME2 (7) GENERATED ALWAYS AS ROW START CONSTRAINT [DF__IndividualContact_ActiveFrom] DEFAULT (getdate()) NOT NULL,
    [ActiveTo]           DATETIME2 (7) GENERATED ALWAYS AS ROW END   CONSTRAINT [DF__IndividualContact_ActiveTo] DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    CONSTRAINT [PK_IndividualContact_EntityId] PRIMARY KEY CLUSTERED ([EntityId] ASC),
    PERIOD FOR SYSTEM_TIME ([ActiveFrom], [ActiveTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[IndividualContactHistory], DATA_CONSISTENCY_CHECK=ON));

