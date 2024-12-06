CREATE TABLE [dbo].[ViolationItemHistory] (
    [ViolationItemId]     INT           NOT NULL,
    [ViolationId]         INT           NOT NULL,
    [LineItem]            SMALLINT      NULL,
    [ProductId]           INT           NOT NULL,
    [ProductDescription]  VARCHAR (250) NULL,
    [IncludedInTotal]     BIT           NOT NULL,
    [Amount]              MONEY         NOT NULL,
	[LockboxSerialNumber] VARCHAR(20)	NULL,
	[LockboxKeyNumber]	  VARCHAR(20)	NULL,
    [Address]             VARCHAR(255)  NULL,
    [City]                VARCHAR(50)   NULL,
    [State]               VARCHAR(3)    NULL,
    [Zip]                 VARCHAR(12)   NULL,
    [CreatedDate]         DATETIME2 (7) NULL DEFAULT GETDATE(),
    [ActiveFrom]          DATETIME2 (7) NOT NULL,
    [ActiveTo]            DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_ViolationItemHistory]
    ON [dbo].[ViolationItemHistory]([ActiveTo] ASC, [ActiveFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

