/***********************************************************************
*			These values are based on the RESO standards :)
*
*	http://ddwiki.reso.org/display/DDW16/ContactStatus+Field
*	http://ddwiki.reso.org/display/DDW16/MemberStatus+Field
*
***********************************************************************/

IF NOT EXISTS(SELECT 1 FROM dbo.IndividualStatus WHERE [Description] = 'Active')
BEGIN
	
	INSERT dbo.IndividualStatus (IndividualStatusTypeId, [Description]) VALUES (1, 'Active');

END
IF NOT EXISTS(SELECT 1 FROM dbo.IndividualStatus WHERE [Description] = 'Inactive')
BEGIN
	
	INSERT dbo.IndividualStatus (IndividualStatusTypeId, [Description]) VALUES (2, 'Inactive');

END
IF NOT EXISTS(SELECT 1 FROM dbo.IndividualStatus WHERE [Description] = 'Under Disciplinary Action')
BEGIN
	
	INSERT dbo.IndividualStatus (IndividualStatusTypeId, [Description]) VALUES (3, 'Under Disciplinary Action');

END
IF NOT EXISTS(SELECT 1 FROM dbo.IndividualStatus WHERE [Description] = 'Deleted')
BEGIN
	
	INSERT dbo.IndividualStatus (IndividualStatusTypeId, [Description]) VALUES (4, 'Deleted');

END
IF NOT EXISTS(SELECT 1 FROM dbo.IndividualStatus WHERE [Description] = 'On Vacation')
BEGIN
	
	INSERT dbo.IndividualStatus (IndividualStatusTypeId, [Description]) VALUES (5, 'On Vacation');

END