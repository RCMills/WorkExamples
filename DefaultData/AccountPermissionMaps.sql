/*
*
*	This isn't actually "default" data. This script is not run every time the database is deployed and the existing data is not truncated.
*	Rather, this data is just the starting point for the permissions. It is based on what used to be hard-coded into the Atlas UI in V1.
*	The reason we don't truncate and repopulate this data each time the database is deployed is so that in the future, when permissions are
*	managed via an administrative console of some sort within Atlas, we don't override whatever changes are made by the administrators.
*
*/

SET IDENTITY_INSERT dbo.AccountPermissionMap ON
INSERT INTO dbo.AccountPermissionMap (AccountPermissionMapId, PermissionId, UserIndividualTypeId, UserRoleId, SubscriberMlsId, SubscriberIndividualTypeId)
VALUES
	  (1, 1, 10, 5, NULL, NULL) -- Change Password On Behalf Of, MLS Staff, Data Integrity Staff, <Any MLS>, <Any Subscriber Type>
	, (2, 1, 10, 11, NULL, NULL) -- Change Password On Behalf Of, MLS Staff, Customer Support Specialist, <Any MLS>, <Any Subscriber Type>
	, (3, 1, 10, 13, NULL, NULL) -- Change Password On Behalf Of, MLS Staff, Accounting, <Any MLS>, <Any Subscriber Type>
	, (4, 1, 10, 18, NULL, NULL) -- Change Password On Behalf Of, MLS Staff, Brand, <Any MLS>, <Any Subscriber Type>
	
	, (5, 2, 10, 5, NULL, NULL) -- Create New Case, MLS Staff, Data Integrity Staff, <Any MLS>, <Any Subscriber Type>
	, (6, 2, 10, 11, NULL, NULL) -- Create New Case, MLS Staff, Customer Support Specialist, <Any MLS>, <Any Subscriber Type>
	, (7, 2, 10, 13, NULL, NULL) -- Create New Case, MLS Staff, Accounting, <Any MLS>, <Any Subscriber Type>
	, (8, 2, 10, 18, NULL, NULL) -- Create New Case, MLS Staff, Brand, <Any MLS>, <Any Subscriber Type>

	, (9, 3, 10, 5, NULL, NULL) -- Manage Admins On Behalf Of, MLS Staff, Data Integrity Staff, <Any MLS>, <Any Subscriber Type>
	, (10, 3, 10, 11, NULL, NULL) -- Manage Admins On Behalf Of, MLS Staff, Customer Support Specialist, <Any MLS>, <Any Subscriber Type
	, (11, 3, 10, 13, NULL, NULL) -- Manage Admins On Behalf Of, MLS Staff, Accounting, <Any MLS>, <Any Subscriber Type>

	, (12, 4, 10, 5, NULL, NULL) -- Purchase Base Subscriptions On Behalf Of, MLS Staff, Data Integrity Staff, <Any MLS>, <Any Subscriber Type>
	, (13, 4, 10, 11, NULL, NULL) -- Purchase Base Subscriptions On Behalf Of, MLS Staff, Customer Support Specialist, <Any MLS>, <Any Subscriber Type>
	, (14, 4, 10, 13, NULL, NULL) -- Purchase Base Subscriptions On Behalf Of, MLS Staff, Accounting, <Any MLS>, <Any Subscriber Type>

	, (15, 5, 10, 5, NULL, NULL) -- Purchase Add-On Subscriptions On Behalf Of, MLS Staff, Data Integrity Staff, <Any MLS>, <Any Subscriber Type>
	, (16, 5, 10, 11, NULL, NULL) -- Purchase Add-On Subscriptions On Behalf Of, MLS Staff, Customer Support Specialist, <Any MLS>, <Any Subscriber Type>
	, (17, 5, 10, 13, NULL, NULL) -- Purchase Add-On Subscriptions On Behalf Of, MLS Staff, Accounting, <Any MLS>, <Any Subscriber Type>

	, (18, 6, 10, 13, NULL, NULL) -- Cancel Subscriptions, MLS Staff, Accounting, <Any MLS>, <Any Subscriber Type>
	, (19, 6, 10, 14, NULL, NULL) -- Cancel Subscriptions, MLS Staff, Data Integrity Supervisor, <Any MLS>, <Any Subscriber Type>

	, (20, 7, 10, 16, NULL, NULL) -- View Atlas Status, MLS Staff, General Access, <Any MLS>, <Any Subscriber Type>

	, (21, 8, 10, 11, NULL, NULL) -- View MLS Status, MLS Staff, Customer Support Specialist, <Any MLS>, <Any Subscriber Type>

	, (22, 9, 10, 15, NULL, NULL) -- View Visible In Lists, MLS Staff, Customer Support Specialist II, <Any MLS>, <Any Subscriber Type>

	, (23, 10, 10, 17, NULL, NULL) -- View Blocked Status, MLS Staff, MLS Admin, <Any MLS>, <Any Subscriber Type>

	, (24, 11, 10, 15, 1, 1) -- Toggle MLS Status, MLS Staff, Customer Support Specialist II, ARMLS, Affiliate Appraiser
	, (25, 11, 10, 15, 1, 4) -- Toggle MLS Status, MLS Staff, Customer Support Specialist II, ARMLS, Appraiser
	, (26, 11, 10, 15, 1, 5) -- Toggle MLS Status, MLS Staff, Customer Support Specialist II, ARMLS, Designated Broker (Non-Realtor)
	, (27, 11, 10, 15, 1, 6) -- Toggle MLS Status, MLS Staff, Customer Support Specialist II, ARMLS, Designated Realtor
	, (28, 11, 10, 15, 1, 7) -- Toggle MLS Status, MLS Staff, Customer Support Specialist II, ARMLS, Office Staff
	, (29, 11, 10, 15, 1, 8) -- Toggle MLS Status, MLS Staff, Customer Support Specialist II, ARMLS, Realtor
	, (30, 11, 10, 15, 1, 9) -- Toggle MLS Status, MLS Staff, Customer Support Specialist II, ARMLS, Sales Person
	, (31, 11, 10, 17, 1, 10) -- Toggle MLS Status, MLS Staff, MLS Admin, ARMLS, MLS Staff
	, (32, 11, 10, 17, 1, 17) -- Toggle MLS Status, MLS Staff, MLS Admin, ARMLS, Association Staff
	, (33, 11, 10, 17, 3, 10) -- Toggle MLS Status, MLS Staff, MLS Admin, MetroMLS, MLS Staff

	, (34, 12, 10, 15, 1, 1) -- Toggle Visible In Lists, MLS Staff, Customer Support Specialist II, ARMLS, Affiliate Appraiser
	, (35, 12, 10, 15, 1, 4) -- Toggle Visible In Lists, MLS Staff, Customer Support Specialist II, ARMLS, Appraiser
	, (36, 12, 10, 15, 1, 5) -- Toggle Visible In Lists, MLS Staff, Customer Support Specialist II, ARMLS, Designated Broker (Non-Realtor)
	, (37, 12, 10, 15, 1, 6) -- Toggle Visible In Lists, MLS Staff, Customer Support Specialist II, ARMLS, Designated Realtor
	, (38, 12, 10, 15, 1, 7) -- Toggle Visible In Lists, MLS Staff, Customer Support Specialist II, ARMLS, Office Staff
	, (39, 12, 10, 15, 1, 8) -- Toggle Visible In Lists, MLS Staff, Customer Support Specialist II, ARMLS, Realtor
	, (40, 12, 10, 15, 1, 9) -- Toggle Visible In Lists, MLS Staff, Customer Support Specialist II, ARMLS, Sales Person
	, (41, 12, 10, 17, 1, 10) -- Toggle Visible In Lists, MLS Staff, MLS Admin, ARMLS, MLS Staff
	, (42, 12, 10, 17, 1, 17) -- Toggle Visible In Lists, MLS Staff, MLS Admin, ARMLS, Association Staff
	, (43, 12, 10, 17, 3, 10) -- Toggle Visible In Lists, MLS Staff, MLS Admin, MetroMLS, MLS Staff

	, (44, 13, 10, 17, NULL, NULL) -- Toggle Blocked Status, MLS Staff, MLS Admin, <Any MLS>, <Any Subscriber Type>

	, (45, 14, 10, 5, NULL, NULL) -- Toggle Blocked Status, MLS Staff, Data Integrity Staff, <Any MLS>, <Any Subscriber Type>
	, (46, 14, 10, 13, NULL, NULL) -- Toggle Blocked Status, MLS Staff, Accounting, <Any MLS>, <Any Subscriber Type>
	, (47, 14, 10, 15, NULL, NULL) -- Toggle Blocked Status, MLS Staff, Customer Support Specialist, <Any MLS>, <Any Subscriber Type>

	, (48, 15, 10, 16, NULL, NULL) -- View Case History Summary On Account Summary, MLS Staff, General Access, <Any MLS>, <Any Subscriber Type>

	, (49, 16, 10, 16, NULL, NULL) -- View Subscriber Association, MLS Staff, General Access, <Any MLS>, <Any Subscriber Type>

	, (50, 17, 10, 13, NULL, NULL) -- View Batch Id, MLS Staff, Accounting, <Any MLS>, <Any Subscriber Type>

	, (51, 18, 10, 17, NULL, NULL) -- Grant Subscriptions, MLS Staff, MLS Admin, <Any MLS>, <Any Subscriber Type>

	, (52, 19, 10, 5, NULL, NULL) -- Create Fines, MLS Staff, Data Integrity Staff, <Any MLS>, <Any Subscriber Type>

	, (53, 20, 10, 5, NULL, NULL) -- Waive Fines, MLS Staff, Data Integrity Staff, <Any MLS>, <Any Subscriber Type>

	, (54, 21, 10, 5, NULL, NULL) -- Reduce Fines, MLS Staff, Data Integrity Staff, <Any MLS>, <Any Subscriber Type>

	, (55, 22, 10, 14, NULL, NULL) -- Remove Fines, MLS Staff, Data Integrity Supervisor, <Any MLS>, <Any Subscriber Type>

	, (56, 23, 10, 5, NULL, NULL) -- Pay Fines On Behalf Of, MLS Staff, Data Integrity Staff, <Any MLS>, <Any Subscriber Type>
	, (57, 23, 10, 11, NULL, NULL) -- Pay Fines On Behalf Of, MLS Staff, Customer Support Specialist, <Any MLS>, <Any Subscriber Type>
	, (58, 23, 10, 13, NULL, NULL) -- Pay Fines On Behalf Of, MLS Staff, Accounting, <Any MLS>, <Any Subscriber Type>

	, (59, 24, 10, 5, NULL, NULL) -- Create Appeals, MLS Staff, Data Integrity Staff, <Any MLS>, <Any Subscriber Type>

	, (60, 25, 10, 5, NULL, NULL) -- View Appeal Fee Letter, MLS Staff, Data Integrity Staff, <Any MLS>, <Any Subscriber Type>

	, (61, 26, 10, 5, NULL, NULL) -- Cancel Appeals, MLS Staff, Data Integrity Staff, <Any MLS>, <Any Subscriber Type>

	, (62, 27, 10, 5, NULL, NULL) -- Disposition Appeals, MLS Staff, Data Integrity Staff, <Any MLS>, <Any Subscriber Type>

	, (63, 28, 10, 5, NULL, NULL) -- Waive Appeal Fee, MLS Staff, Data Integrity Staff, <Any MLS>, <Any Subscriber Type>

	, (64, 29, 10, 16, NULL, NULL) -- Waive Appeal Fee, MLS Staff, General Access, <Any MLS>, <Any Subscriber Type>

	, (65, 30, 10, 16, NULL, NULL) -- View Restricted Receipt Info, MLS Staff, General Access, <Any MLS>, <Any Subscriber Type>

	, (66, 31, 10, 13, NULL, NULL) -- Accept Cash Payments, MLS Staff, Accounting, <Any MLS>, <Any Subscriber Type>

	, (67, 32, 10, 5, NULL, NULL) -- Accept Check Payments, MLS Staff, Data Integrity Staff, <Any MLS>, <Any Subscriber Type>
	, (68, 32, 10, 11, NULL, NULL) -- Accept Check Payments, MLS Staff, Customer Support Specialist, <Any MLS>, <Any Subscriber Type>
	, (69, 32, 10, 13, NULL, NULL) -- Accept Check Payments, MLS Staff, Accounting, <Any MLS>, <Any Subscriber Type>

	, (70, 33, 10, 13, NULL, NULL) -- Refund Orders, MLS Staff, Accounting, <Any MLS>, <Any Subscriber Type>

	, (71, 34, 10, 13, NULL, NULL) -- Process Chargebacks And NSF, MLS Staff, Accounting, <Any MLS>, <Any Subscriber Type>

	, (72, 35, 10, 5, NULL, NULL) -- Cancel Alerts, MLS Staff, Data Integrity Staff, <Any MLS>, <Any Subscriber Type>
	, (73, 35, 10, 11, NULL, NULL) -- Cancel Alerts, MLS Staff, Customer Support Specialist, <Any MLS>, <Any Subscriber Type>
	, (74, 35, 10, 13, NULL, NULL) -- Cancel Alerts, MLS Staff, Accounting, <Any MLS>, <Any Subscriber Type>

	, (75, 36, 10, 13, 1, NULL) -- View GL Detail Report Button, MLS Staff, Accounting, ARMLS, <Any Subscriber Type>

	, (76, 37, 10, 16, NULL, 10) -- View Roles, MLS Staff, General Access, <Any MLS>, MLS Staff

	, (77, 38, 10, 15, NULL, 10) -- View Roles, MLS Staff, Customer Support Specialist II, <Any MLS>, MLS Staff
GO

SET IDENTITY_INSERT dbo.AccountPermissionMap OFF