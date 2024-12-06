CREATE VIEW [dbo].[vw_PhoneSearch] WITH SCHEMABINDING
	AS 
		SELECT 
			PhonesId
			, EntityId
			, Phone
			, REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([Phone], '(', ''), ')', ''), '-', ''), ' ', ''), '+', '') [SearchValue] 
		FROM
			dbo.Phones;
GO

CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex_vwPhoneSearch_PhonesID]
    ON [dbo].[vw_PhoneSearch]([PhonesId] ASC);
GO
		