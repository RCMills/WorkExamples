CREATE FUNCTION [dbo].[udf_R_HasActiveBaseSubscription]
( @EntityId int )
RETURNS BIT
AS

/***************************************************************************************************
*					 [udf_R_HasActiveBaseSubscription]
*
*	Purpose: Returns bit for if a user has an active subscription for a base type
*
*	Author: Chris Coneybeer
*
*	Origination Date: 20180426
*
*	History
*	Revision		By			Date			WorkItem	
*	0001			CSC			20180910		Birth
*	
***************************************************************************************************/
BEGIN

DECLARE @HasBaseSub BIT = 0x00;
DECLARE @TimeZone nvarchar(256) = 'US Mountain Standard Time';

	IF EXISTS(	
			SELECT *
			FROM subs.Subscriptions sub
			INNER JOIN Catalog.Products prd ON prd.ProductId = sub.ProductId
			WHERE 
				sub.EntityId = @EntityId 
				AND sub.IsActive = 0x01
				AND prd.ProductTypeId IN(2,7,8)
				AND CAST(GETDATE() AT TIME ZONE @TimeZone AS DATETIMEOFFSET) 
					BETWEEN DATEADD(MONTH, -sub.SubscriptionPeriod, CAST(sub.SubscriptionEndDate AT TIME ZONE @TimeZone AS DATETIMEOFFSET))
					AND CAST(sub.SubscriptionEndDate AT TIME ZONE @TimeZone AS DATETIMEOFFSET))
			BEGIN
				SET @HasBaseSub = 0x01;
			END

	RETURN @HasBaseSub;
END