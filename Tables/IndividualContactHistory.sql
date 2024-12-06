CREATE TABLE [dbo].[IndividualContactHistory] (
    [EntityId]           INT           NOT NULL,
    [AssistantName]      VARCHAR (150) NULL,
    [AssistantPhone]     VARCHAR (20)  NULL,
    [AssistantPhoneExt]  VARCHAR (20)  NULL,
    [AssistantEmail]     VARCHAR (200) NULL,
    [Company]            VARCHAR (50)  NULL,
    [Department]         VARCHAR (50)  NULL,
    [Birthdate]          DATE          NULL,
    [Anniversary]        DATE          NULL,
    [SpousePartnerName]  VARCHAR (150) NULL,
    [Children]           VARCHAR (150) NULL,
    [LeadSource]         VARCHAR (150) NULL,
    [ReferredBy]         VARCHAR (150) NULL,
    [ContactContactType] INT           NULL,
    [ActiveFrom]         DATETIME2 (7) NOT NULL,
    [ActiveTo]           DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_IndividualContactHistory]
    ON [dbo].[IndividualContactHistory]([ActiveTo] ASC, [ActiveFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

