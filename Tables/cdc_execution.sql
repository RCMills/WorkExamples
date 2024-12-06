	create table dbo.cdc_execution(
			RowId int Identity(1,1) NOT NULL
			, executionName varchar(50) NOT NULL
			, executionlsn binary(10) NOT NULL
			, lastRunDate datetime2 NOT NULL);