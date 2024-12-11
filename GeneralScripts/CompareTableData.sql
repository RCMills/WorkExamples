/***********************************
*Script is designed to generate a statement that will compare the data between two tables
* The table structures must be identical, or there will be errors thrown	
*
*********************************/


-- Script should develop a query that can be run to fetch the data in a format that makes sense to be compared side by side
-- column format [DatabaseName][ColumnName][Value]
SET NOCOUNT ON;

DECLARE @SourceTableName varchar(256) = 'HairColorType'
DECLARE @Alias varchar(5) = 'cst'

DECLARE @ColumnList nvarchar(max) = N'SELECT ';
DECLARE @Index int = 1; -- Starting point for loops
DECLARE @Iterations int; -- Number of rows in the table that represents the columns of a table
DECLARE @PKIterator int = 1
DECLARE @DevPreamble varchar(4) = 'DEV_'
DECLARE @VMPreamble varchar(3) = 'VM_'
DECLARE @DevAlias varchar(256);
DECLARE @VMAlias varchar(256);
DECLARE @PKJoins varchar(max) = ''
DECLARE @PrimaryJoin varchar(max)
DECLARE @DevJoin varchar(max)
DECLARE @VMJoin varchar(max)
DECLARE @DEVWhere varchar(max) = 'WHERE ' + CHAR(13)
DECLARE @VMWhere varchar(max) = 'WHERE ' + CHAR(13)
DECLARE @DevDB varchar(20) = 'MVM.dbo.'
DECLARE @VMDB varchar(20) = 'MVM_VM.dbo.'

SELECT @DevAlias = @DevPreamble + @Alias
SELECT @VMAlias = @VMPreamble + @Alias

SELECT @PrimaryJoin = 'FROM ' + CHAR(13) + CHAR(9) + @DevDB + @SourceTableName + ' AS ' + @DevAlias + CHAR(13) + 'INNER JOIN ' + @VMDB + @SourceTableName + ' AS ' + @VMAlias + ' ON' + CHAR(13)
SELECT @DEVJoin = 'FROM ' + CHAR(13) + CHAR(9) + @DevDB + @SourceTableName + ' AS ' + @DevAlias + CHAR(13) + 'LEFT OUTER JOIN ' + @VMDB + @SourceTableName + ' AS ' + @VMAlias + ' ON' + CHAR(13)
SELECT @VMJoin = 'FROM ' + CHAR(13) + CHAR(9) + @DevDB + @SourceTableName + ' AS ' + @DevAlias + CHAR(13) + 'RIGHT OUTER JOIN ' + @VMDB + @SourceTableName + ' AS ' + @VMAlias + ' ON' + CHAR(13)

DECLARE @ColumnNames TABLE(ID int IDENTITY(1,1), [Name] varchar(256), [IsPK] bit)

INSERT @ColumnNames SELECT 
	cols.[Name]
	, IIF(PKs.ColumnName IS NOT NULL, 1, 0) [IsPK]
FROM 
	sys.columns cols 
left outer join (SELECT
					INDEX_COL(@SourceTableName , i.index_id, 1) [ColumnName]
				FROM	
					sys.indexes i 
				inner join sys.key_constraints k on
					k.parent_object_id = i.object_id 
				and k.unique_index_id = i.index_id
				inner join (select object_id FROM sys.objects where parent_object_id = OBJECT_ID(@SourceTableName) and type = 'PK') idx on
					idx.object_id = k.object_id
				WHERE	
					i.object_id = OBJECT_ID(@SourceTableName)) pks ON
	pks.ColumnName = cols.[name]
WHERE 
	cols.[object_id] = (OBJECT_ID(@SourceTableName))

SELECT @Iterations = COUNT(*) FROM @ColumnNames;

WHILE @Index <= @Iterations
BEGIN
		
		SELECT @ColumnList = @ColumnList + CHAR(9) + CHAR(13) + IIF(@Index > 1, CHAR(44), '') + @DevAlias + '.' + [Name] + '[' + @DevPreamble + [Name] + ']' + CHAR(13) + CHAR(44) + @VMAlias + '.' + [Name] + '[' + @VMPreamble + [Name] + ']'  FROM @ColumnNames WHERE [ID] = @Index

		SELECT @Index = @Index + 1;
		
END

SELECT @Index = 1 -- Reset the index

WHILE @Index <= @Iterations
BEGIN

	IF EXISTS (SELECT * FROM @ColumnNames WHERE ID = @Index AND IsPK = 1)
	BEGIN
		IF @PKIterator = 1
		BEGIN
		
			SELECT @PKJoins = @PKJoins + @DevAlias + '.' + [Name] + ' = ' + @VMAlias + '.' + [Name] FROM @ColumnNames WHERE ID = @Index;
			SELECT @DEVWhere = @DEVWhere + CHAR(9) + @DevAlias + '.' + [Name] + ' IS NULL' FROM @ColumnNames WHERE ID = @Index;
			SELECT @VMWhere = @VMWhere + CHAR(9) + @VMAlias + '.' + [Name] + ' IS NULL' FROM @ColumnNames WHERE ID = @Index;

		END
		IF @PKIterator > 1
		BEGIN

			SELECT @PKJoins = @PKJoins + CHAR(13) + ' AND ' + @DevAlias + '.' + [Name] + ' = ' + @VMAlias + '.' + [Name] FROM @ColumnNames WHERE ID = @Index;
			SELECT @DEVWhere = @DEVWhere + CHAR(13) + ' AND ' + @DevAlias + '.' + [Name] + ' IS NULL' FROM @ColumnNames WHERE ID = @Index;
			SELECT @VMWhere = @VMWhere + CHAR(13) + ' AND ' + @VMAlias + '.' + [Name] + ' IS NULL' FROM @ColumnNames WHERE ID = @Index;
		END

		SELECT @PKIterator = @PKIterator + 1
	END

	SELECT @Index = @Index + 1;

END

SELECT @Index = 1, @PKIterator = 1


PRINT @ColumnList
PRINT @PrimaryJoin + CHAR(9) + @PKJoins
PRINT CHAR(13) + 'UNION ALL' + CHAR(13)
PRINT @ColumnList
PRINT @DevJoin + CHAR(9) + @PKJoins
PRINT @VMWHere
PRINT CHAR(13) + 'UNION ALL' + CHAR(13)
PRINT @ColumnList
PRINT @VMJoin + CHAR(9) + @PKJoins
PRINT @DevWhere
