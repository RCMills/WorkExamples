CREATE TABLE [dbo].[OfficeBrokersSync] (
    [AgentId]       VARCHAR (40)  NOT NULL,
    [ShortId]       VARCHAR (20)  NOT NULL,
    [OfficeId]      VARCHAR (40)  NOT NULL,
    [Name]          VARCHAR (100) NOT NULL,
    [BrokerId]      VARCHAR (30)  NOT NULL,
    [BrokerShortId] VARCHAR (20)  NOT NULL,
    [MLSSourceId]   INT           NOT NULL
);

