CREATE TABLE [dbo].[Violation] (
      [ViolationId]           INT                                         IDENTITY (1, 1) NOT NULL
    , [ParentViolationId]     INT                                         NULL
    , [EntityId]              INT                                         NOT NULL
    , [ListingId]             VARCHAR (50)                                NOT NULL
    , [OrderNumber]           INT                                         NULL
    , [ViolationStatusTypeId] SMALLINT                                    NOT NULL
    , [Amount]                MONEY                                       NOT NULL
    , [IsDeleted]             BIT                                         NULL     CONSTRAINT [DF__Violation_IsDeleted]  DEFAULT 0x00
    , [CreatedBy]             INT                                         NOT NULL
    , [CreatedDate]           DATETIME2 (7)                               NOT NULL
    , [ModifiedBy]            INT                                         NULL
    , [ModifiedDate]          DATETIME2 (7)                               NOT NULL
    , [ActiveFrom]            DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL CONSTRAINT [DF__Violation_ActiveFrom] DEFAULT (getdate())
    , [ActiveTo]              DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL CONSTRAINT [DF__Violation_ActiveTo]   DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999'))
    , CONSTRAINT [PK_Violation_Id] PRIMARY KEY CLUSTERED ([ViolationId] ASC)
    , PERIOD FOR SYSTEM_TIME ([ActiveFrom], [ActiveTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[ViolationHistory], DATA_CONSISTENCY_CHECK=ON));
GO

CREATE NONCLUSTERED INDEX [IX_Violation_ViolationStatusTypeId] ON [dbo].[Violation]([ViolationStatusTypeId]);
