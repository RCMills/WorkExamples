CREATE TABLE [case].[CaseDocs] AS FILETABLE FILESTREAM_ON [Documents]
WITH (FILETABLE_COLLATE_FILENAME = SQL_Latin1_General_CP1_CI_AS, FILETABLE_DIRECTORY = N'Documents');




GO
GRANT UPDATE
    ON OBJECT::[case].[CaseDocs] TO [Atlas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[case].[CaseDocs] TO [Atlas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[case].[CaseDocs] TO [Atlas]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[case].[CaseDocs] TO [Atlas]
    AS [dbo];

