CREATE TABLE [dbo].[OfficeStaffAgentAssignments]
(
	[OfficeStaffAgentAssignmentId] INT IDENTITY(1,1) NOT NULL
	,[OfficeStaffQueueId] INT NOT NULL
	,[AssignedAgentEntityId] INT NOT NULL
	CONSTRAINT PK_OfficeStaffQueueAssignments PRIMARY KEY CLUSTERED ([OfficeStaffAgentAssignmentId]) ON [PRIMARY]
)
