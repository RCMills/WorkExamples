CREATE FUNCTION dbo.udf_V_SubscriberPurchaseAvailable
(
	@EntityId int
)
RETURNS bit
/*****************************************************************************************
*						udf_V_SubscriberPurchaseAvailable
*
*	Purpose: Check System Access and Active flag for member prior to allowing purchase
*
*	Entry: usp_C_Order
*
*	Origination Date: 3 Sept 2019
*
*	Author: Robert Mills
*
*	History
*	Revision		By		DATE			CHANGE
*	0001			RCM		3 Sept 2019		Birth
*
****************************************************************************************/
AS
BEGIN

-- ********** Special Note: AD-1931 ****************
--	The associations set both System Access and Active flag in Flex
--	those flags tell ARMLS that the association is ok with the member being active as a Realtor
--  By rule, ARMLS will not allow purchase of a subscription if the association is not in agreement

	DECLARE @Return bit = 0x01;

	IF (SELECT [dbo].[udf_R_IndividualAssociationStatus](@EntityId)) = 'Inactive' SET @Return = 0x00;
	
	return @Return;

END