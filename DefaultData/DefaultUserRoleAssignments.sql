DECLARE @RoleAssignments TABLE(
userName varchar(250)
,RoleName varchar(200)
)

INSERT @RoleAssignments(
userName
,RoleName)
VALUES
('andrewa','Customer Support Specialist'),
('brittaneeb', 'Customer Support Specialist'),
('tbunch', 'Customer Support Specialist'),
('sandrac','Customer Support Specialist'),
('celeste', 'Customer Support Specialist'),
('ccordova', 'Customer Support Specialist'),
('jonathanf', 'Customer Support Specialist'),
('dgarcia', 'Customer Support Specialist'),
('ledah', 'Customer Support Specialist'),
('amarim', 'Customer Support Specialist'),
('jensiner', 'Customer Support Specialist'),
('marcor', 'Customer Support Specialist'),
('alicias', 'Customer Support Specialist'),
('nsmith', 'Customer Support Specialist'),
('jodyw','Customer Support Specialist'),
('jamie', 'Customer Support Specialist'),
('carlan', 'Customer Support Specialist'),
('nicks', 'Customer Support Specialist'),
('josephine', 'Accounting'),
('dannyl','Accounting'),
('nancy', 'Data Integrity Staff'),
('anaberta', 'Data Integrity Supervisor'),
('robertam', 'Data Integrity Staff'),
('lisao', 'Data Integrity Staff'),
('preiser', 'Data Integrity Staff'),
('bernicer','Data Integrity Staff'),
('crusso', 'Data Integrity Supervisor'),
('jsanders','Data Integrity Staff'),
('msnyder', 'Data Integrity Staff'),
('susan', 'Data Integrity Staff'),
('josephine', 'Customer Support Specialist II');

INSERT dbo.AppUserRole(AppUserEntityId, RoleId)
SELECT
	I.EntityId, AR.RoleId
FROM
	dbo.Individual as I 
INNER JOIN @RoleAssignments as RA ON
	RA.userName = I.UserName
INNER JOIN dbo.AppRole AS AR ON
	AR.RoleName = RA.RoleName
LEFT OUTER JOIN dbo.AppUserRole AS AUR ON
	AUR.AppUserEntityId = I.EntityId
AND AR.RoleId = AUR.RoleId
WHERE
	AUR.AppUserEntityId IS NULL
