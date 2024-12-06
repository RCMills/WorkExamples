CREATE TABLE [dbo].[SearchCriteria] (
    [SearchCriteriaId] INT            IDENTITY (1, 1) NOT NULL,
    [EntityId]         INT            NOT NULL,
    [FilterSetName]    VARCHAR (20)   CONSTRAINT [DF_SearchCriteria_FilterSetName] DEFAULT ('Default') NOT NULL,
    [JSONDocument]     NVARCHAR (MAX) NULL,
    [IsActive]         BIT            CONSTRAINT [DF_Searchcriteria_IsActive] DEFAULT (0x01) NOT NULL,
    [CreatedDate]      DATETIME       CONSTRAINT [DF_SearchCriteia_CreatedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SearchCriteria_Id] PRIMARY KEY CLUSTERED ([SearchCriteriaId] ASC)
);

