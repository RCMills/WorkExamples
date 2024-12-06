CREATE TABLE [Catalog].[Products] (
      [ProductId]                         INT             NOT NULL
    , [ParentProductId]                   INT             NULL
    , [ProductTypeId]                     SMALLINT        NOT NULL
    , [SKU]                               INT             NULL
    , [ProductName]                       VARCHAR (100)   NULL
    , [Price]                             MONEY           NULL
    , [ProductDisplayName]                VARCHAR (255)   NULL
    , [ProductDescription]                VARCHAR (2000)  NULL
    , [IsActive]                          BIT             NULL
    , [SubscriptionPeriod]                SMALLINT        NULL
    , [SubscriptionPeriodInDays]          SMALLINT        NULL
    , [InternalUseOnly]                   BIT             NULL
    , [AccountReceivableId]               INT             NULL
    , [ProductTier]                       TINYINT         NULL
    , [ProductLaunchURL]                  NVARCHAR (2000) NULL
    , [ProductImage]                      NVARCHAR (2000) NULL
    , [ProductIcon]                       NVARCHAR (2000) NULL
    , [Priority]                          SMALLINT        NULL
    , [DisplayOrder]                      INT             NULL
    , [SsoClientId]                       INT             NULL
    , [RequiresLockboxSerialNumber]       BIT             NULL
    , [RequiresLockboxKeyNumber]          BIT             NULL
    , [RequiresAddress]                   BIT             NULL
    , [FixedEndDate]                      DATE            NULL
    , [MlsId]                             INT             NULL
    , [RevenueRecognitionTypeId]          INT             NULL
    , [AvailableToRecognizeAccountNumber] INT             NULL
    CONSTRAINT [PK_Products_Id] PRIMARY KEY CLUSTERED ([ProductId] ASC)
);

