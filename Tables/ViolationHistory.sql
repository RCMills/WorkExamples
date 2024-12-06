CREATE TABLE [dbo].[ViolationHistory] (
      [ViolationId]           INT           NOT NULL
    , [ParentViolationId]     INT           NULL
    , [EntityId]              INT           NOT NULL
    , [ListingId]             VARCHAR (50)  NOT NULL
    , [OrderNumber]           INT           NULL
    , [ViolationStatusTypeId] SMALLINT      NOT NULL
    , [Amount]                MONEY         NOT NULL
    , [IsDeleted]             BIT           NULL
    , [CreatedBy]             INT           NOT NULL
    , [CreatedDate]           DATETIME2 (7) NOT NULL
    , [ModifiedBy]            INT           NULL
    , [ModifiedDate]          DATETIME2 (7) NOT NULL
    , [ActiveFrom]            DATETIME2 (7) NOT NULL
    , [ActiveTo]              DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_ViolationHistory]
    ON [dbo].[ViolationHistory]([ActiveTo] ASC, [ActiveFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

