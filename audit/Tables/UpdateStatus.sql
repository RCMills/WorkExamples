CREATE TABLE [audit].[UpdateStats](
	UpdateStatId int IDENTITY(1,1) PRIMARY KEY
	,[UpdateDateTime] DateTime2(7) NOT NULL -- This will be UTC
	,[TotalRecordsIncoming] int NULL
	,[TotalRecordsUpdated] int NULL
	,[TotalRecordsInserted] int NULL
	);