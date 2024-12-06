CREATE TABLE [dbo].[AccountPermissionMap]
(
	  [AccountPermissionMapId]  INT IDENTITY(1, 1) NOT NULL
	, [PermissionId]         INT                NOT NULL
	, [UserIndividualTypeId]           INT                NOT NULL
	, [UserRoleId]                     INT                NULL
	, [SubscriberMlsId]                INT                NULL
	, [SubscriberIndividualTypeId]     INT                NULL
	, CONSTRAINT [PK_AccountPermissionMap_Id] PRIMARY KEY CLUSTERED ([AccountPermissionMapId])
)
