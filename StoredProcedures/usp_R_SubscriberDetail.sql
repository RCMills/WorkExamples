CREATE PROCEDURE [dbo].[usp_R_SubscriberDetail]
	@ShortId varchar(200)
/*****************************************************************************
*				usp_R_SubscriberDetail
*
*	Purpose: Get details for ES DB for a given subscriber
*
*	Author: Robert Mills
*
*	Origination Date: 2 July 2018
*
*	History
*	Revision	By			Date			Change
*	0001		RCM			2 July 2018		Birth
*	0002		CSC			20180731		Update to use udf_R_AggregateStatus instead of udf_R_AtlasStatus
*
*
*****************************************************************************/
AS
DECLARE @EntityId int;

	SELECT @EntityId = EntityId from dbo.Individual WHERE UserName = @ShortId;

	IF ((SELECT TOP 1 AggregateStatus FROM dbo.[udf_R_AggregateStatus](@EntityId)) = 'Inactive')
	BEGIN
			RETURN;
	END
	
	SELECT
		AD.firstName + N' ' + AD.lastName as [fullName]
		,AD.phone as [phone]
		,AD.email as [email]
		,AD.photoURL as [imageURL]
		,REPLACE(AD.officeName, '&', 'and') as [officeName]
		,AD.officePhone as [officePhone]
		,AD.[URL] as [officeURL]
		,AD.OfficephotoURL as [officeLogoURL]
	FROM
		dbo.Individual as I
	CROSS APPLY dbo.udf_R_AgentDetails(I.EntityId) as AD
	WHERE
		I.EntityId = @EntityId
	FOR JSON PATH;
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_R_SubscriberDetail] TO [Atlas]
    AS [dbo];

