CREATE PROCEDURE [dbo].[usp_R_AgentDetail]
 (@ClientEntityId int)  
/***************************************************************************************************************  
*         [usp_R_AgentDetail]  
*  
* Purpose: Get Agent Detail for a given Client Entity Id  
*  
* Author: Robert Mills  
*  
* Origination Date: 22 Nov 2017  
*  
* History  
* Revision  By  Date   WorkItem  
* 0001   RCM  22 Nov 2017  138 
* 0002	RCM	  17 July 2018	N/A Revised code to work with new Atlas DB  
*  
***************************************************************************************************************/  
AS
	SET NOCOUNT ON;

	SELECT
		AD.entityId as [ParentEntityId]
		,AD.firstName
		,AD.lastName
		,AD.photoURL as [AgentPhotoURL]
		,AD.OfficephotoURL as [BrokerageURL]
	FROM
		dbo.Individual as I
	CROSS APPLY	dbo.udf_R_AgentDetails(I.ParentEntityId) as AD
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_R_AgentDetail] TO [Atlas]
    AS [dbo];

