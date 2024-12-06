CREATE TABLE [dbo].[ViolationItem] (
    [ViolationItemId]     INT           IDENTITY (1, 1) NOT NULL,
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
    [ActiveFrom]          DATETIME2 (7) GENERATED ALWAYS AS ROW START CONSTRAINT [DF__ViolationItem_ActiveFrom] DEFAULT (getdate()) NOT NULL,
    [ActiveTo]            DATETIME2 (7) GENERATED ALWAYS AS ROW END   CONSTRAINT [DF__ViolationItem_ActiveTo] DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    CONSTRAINT [PK_ViolationItem_Id] PRIMARY KEY CLUSTERED ([ViolationItemId] ASC),
    PERIOD FOR SYSTEM_TIME ([ActiveFrom], [ActiveTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[ViolationItemHistory], DATA_CONSISTENCY_CHECK=ON));

