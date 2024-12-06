DECLARE @QA NVARCHAR(250) = N'qa10-12';
DECLARE @Staging NVARCHAR(250) = N'staging10-12';
DECLARE @Prod NVARCHAR(250) = N'wopr2';
DECLARE @AtlasV1BaseUrl NVARCHAR(100) =
	CASE
		WHEN @@SERVERNAME = @QA THEN 'https://qa.atlas.armls.com'
		WHEN @@SERVERNAME = @Staging THEN 'https://staging.atlas.armls.com'
		WHEN @@SERVERNAME = @Prod THEN 'https://atlas.armls.com'
		ELSE 'https://dev.atlas.armls.com' -- Defaults to DEV
	END

INSERT INTO dbo.MenuItem (Id, [Text], Link, Icon, IconPrefix, IsFontIcon, Parent, DisplayOrder, RequiresSubscription, OnlyAvailableWithoutSubscription, BrokerOnly, RequiresActiveWithAssociation)
VALUES
	  (10001, 'Home', '/home', 'home', 'fas', 0x01, null, 1, 0x00, 0x00, 0x00, 0x00)
	, (10002, 'Subscriptions', '/billing/package-selection', 'list', 'fal', 0x01, null, 2, 0x00, 0x01, 0x00, 0x01)

INSERT INTO dbo.MenuItem (Id, [Text], Link, Icon, IconPrefix, IsFontIcon, Parent, DisplayOrder, BrokerOnly, IsExternalLink)
VALUES
	  (10003, 'Office', null, 'building', 'fas', 0x01, null, 3, 0x01, 0x00)
	, (10004, 'Manage Staff', '/broker/manage-admins', null, null, null, 10003, 4, 0x01, 0x00)
	, (10005, 'Staff Permissions', CONCAT(@AtlasV1BaseUrl, '?redirectOnLogin=staff-perm'), null, null, 0x01, 10003, 5, 0x01, 0x01)
	, (10006, 'Office', null, 'building', 'fas', 0x01, null, 6, 0x00, 0x00)
	, (10007, 'Staff Queue', CONCAT(@AtlasV1BaseUrl, '?redirectOnLogin=diq'), null, null, null, 10006, 7, 0x00, 0x01)
	, (10008, 'Create Office', '/office/create', null, null, null, 10006, 8, 0x00, 0x00)
	, (10009, 'Users', null, 'user', 'fas', 0x01, null, 16, 0x00, 0x00)
	, (10010, 'Create User', '/user/create', null, null, null, 10009, 17, 0x00, 0x00)
	, (10011, 'Customer Support', null, 'headset', 'fas', 0x01, null, 9, 0x00, 0x00)
	, (10012, 'New Case', '/support/new-case', null, null, null, 10011, 10, 0x00, 0x00)
	, (10013, 'Case History', '/support/case-history', null, null, null, 10011, 11, 0x00, 0x00)
	, (10014, 'New Alert', '/support/new-alert', null, null, null, 10011, 12, 0x00, 0x00)
	, (10015, 'Work Queue', '/support/case-work-queue', null, null, null, 10011, 13, 0x00, 0x00)
	, (10016, 'Search', '/sms/search', 'search', 'fas', 0x01, null, 14, 0x00, 0x00)