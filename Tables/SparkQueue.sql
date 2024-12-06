CREATE TABLE [dbo].[SparkQueue] (
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [RecordType]        VARCHAR (50)   NULL,
    [EntityId]          INT            NOT NULL,
    [FlexReturnMessage] VARCHAR (2000) NOT NULL,
    [FlexRequestData]   VARCHAR (1000) NULL,
    [CreatedDateTime]   DATETIME       NOT NULL,
    [LastQueueRead]     DATETIME       NULL,
    [RetryAttempts]     INT            NULL,
    [IsProcessed]       BIT            NULL
);

