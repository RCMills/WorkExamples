CREATE TABLE [dbo].[MLS] (
      [MLSId]                         SMALLINT NOT NULL
    , [MLSName]                       VARCHAR (100) NOT NULL
    , [MLSState]                      VARCHAR (2) NOT NULL
    , [ReceiptLogoUrl]                VARCHAR (100) NULL
    , [HeaderLogoUrl]                 VARCHAR(100) NULL
    , [Url]                           NVARCHAR(2000) NULL
    , [EmailReceiptSenderAddress]     NVARCHAR (200) NULL
    , [CanBeLinked]                   BIT NOT NULL
    , [CanLogIn]                      BIT NOT NULL
    , [EDWMLSID]                      INT NOT NULL
    , [MaintainIdentityServer]        BIT NOT NULL
    , [DisplayText]                   VARCHAR (100) NULL
    , [AuthorizeNetLoginId]           NVARCHAR(100) NULL
    , [AuthorizeNetTransactionKey]    NVARCHAR(100) NULL
    , [CanBeCaseSubject]              [BIT] NULL
    CONSTRAINT [PK_MLS] PRIMARY KEY CLUSTERED ([MLSId] ASC)
);

