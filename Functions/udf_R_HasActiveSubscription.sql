CREATE FUNCTION dbo.udf_R_HasActiveSubscription
(@EntityId INT)
RETURNS BIT
AS 

/***************************************************************************************************
*					 udf_R_HasActiveSubscritions
*
*	Purpose: Returns bit for if a user has an active subscription 
*
*	Author: Chris Coneybeer
*
*	Origination Date: 20180426
*
*	History
*	Revision		By			Date			WorkItem	
*	0001			CSC			20180426		Birth
*	0002			RCM			21 May 2018		Removed check for dates based on business rules
*	0003			CSC			20180911		Changed over to new table sturcture and 
*	
***************************************************************************************************/

BEGIN
DECLARE @TimeZone nvarchar(256) = 'US Mountain Standard Time';

DECLARE @Return bit
	IF EXISTS(SELECT * FROM subs.Subscriptions sub 
	WHERE 
		sub.EntityId IN (SELECT EntityId FROM dbo.udf_R_EntityGroup(@EntityId))
		--AND CAST(GETDATE() AT TIME ZONE @TimeZone AS DATETIMEOFFSET) 
		--	BETWEEN DATEADD(MONTH, -sub.SubscriptionPeriod, CAST(sub.SubscriptionEndDate AT TIME ZONE @TimeZone AS DATETIMEOFFSET))
		--	AND CAST(sub.SubscriptionEndDate AT TIME ZONE @TimeZone AS DATETIMEOFFSET)
		AND sub.IsActive = 0x01)
		SET @Return = 0x01
	ELSE 
		SET @Return = 0x00

	RETURN @Return
END