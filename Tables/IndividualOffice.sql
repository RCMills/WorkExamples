CREATE TABLE [dbo].[IndividualOffice] (
    [OfficeEntityId]     INT                                         NOT NULL,
    [IndividualEntityId] INT                                         NOT NULL,
    [ActiveFrom]         DATETIME2 (7) GENERATED ALWAYS AS ROW START CONSTRAINT [DF__IndividualOffice_ActiveFrom] DEFAULT (getdate()) NOT NULL,
    [ActiveTo]           DATETIME2 (7) GENERATED ALWAYS AS ROW END   CONSTRAINT [DF__IndividualOffice_ActiveTo] DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    CONSTRAINT [PK_IndividualOffice_OfficeEntityId] PRIMARY KEY CLUSTERED ([OfficeEntityId] ASC, [IndividualEntityId] ASC),
    PERIOD FOR SYSTEM_TIME ([ActiveFrom], [ActiveTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[IndividualOfficeHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_IndividualOffice_IndividualEntityId]
    ON [dbo].[IndividualOffice]([IndividualEntityId] ASC)
    INCLUDE([OfficeEntityId]);

