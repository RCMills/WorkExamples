CREATE PROCEDURE [dbo].[usp_R_CaseDetail]
(
	@CaseId INT
)
AS
/*********************************************************************************************
*							usp_R_CasDetail
*
*	Purpose: Obtain case log data 
*
*	Origination Date : 13 Apr 2020
*
*	Author: Robert Mills
*
*	History
*	Revision		By			Date			Change
*	0001			RCM			22 Feb 2019		Birth
*	0002			RCM			20 Aug 2020		Added AlertEndDate to output
*	0003			BSH			27 Jan 2021		Added EscalationDescription to return
********************************************************************************************/

	DECLARE @Cases TABLE (Id int Identity(1,1), CaseId int);

	INSERT @Cases (CaseId) VALUES (@CaseId);

	SELECT 
			CL.CaseStatusId
			, CL.CaseId
			, CL.CaseTypeId
			, CL.DirectionTypeId
			, Cl.SelectedEntityId
			, cl.AlertEndDate
			, I.UserName
			, ISNULL(Cl.FirstName, I.FirstName) [FirstName]
			, ISNULL(Cl.LastName, I.LastName) [LastName]
			, ISNULL(CL.CustomerPhone, dbo.udf_R_EntityPhone(cl.SelectedEntityId)) AS CustomerPhone
			, ISNULL(Cl.CustomerEmail, dbo.udf_R_EntityEmail(cl.SelectedEntityId)) AS CustomerEmail
			, CL.ActivityTypeId
			, CL.DepartmentId
			, CL.ProductTypeId
			, P.ProductName
			, Cl.DeviceTypeId
			, Cl.OperatingSystemId
			, Cl.BrowserId
			, CL.EscalationId
			, E.EscalationDescription
			, D.DepartmentDescription
			, CL.CategoryId
			, CL.SupportRep
			, I2.FirstName + ' ' + I2.LastName [LastModifiedBy]
			, CAST(CL.[ModifiedDate] AT TIME ZONE 'US Mountain Standard Time' as DateTime) [LastModified]
			, CAST(CL.[CreatedDate] AT TIME ZONE 'US Mountain Standard Time' as DateTime) [CreatedDate]
			, I3.FirstName + ' ' + I3.LastName [CreatedBy]
			, [dbo].[udf_R_EntityEmail] (I3.EntityId) AS CreatedByEmail
			, I4.FirstName AS AssignedToFirstName
			, I4.LastName AS AssignedToLastName
			, CAST(CL.[AssignedDate] AT TIME ZONE 'US Mountain Standard Time' as DateTime) [AssignedDate]
		FROM
				@Cases CS
			INNER JOIN 	[case].CaseLog CL ON
				CS.CaseId = CL.CaseId
			INNER JOIN dbo.Individual I2 ON
				Cl.ModifiedBy = I2.EntityId
			LEFT OUTER JOIN [case].Department D ON
				D.DepartmentId = CL.DepartmentId
			LEFT OUTER JOIN dbo.Individual I ON
				CL.SelectedEntityId = I.EntityId
			LEFT OUTER JOIN dbo.Individual I3 ON
				I3.EntityId = CL.CreatedBy
			LEFT OUTER JOIN [case].Products P ON
				P.CaseProductId = CL.ProductTypeId
			LEFT OUTER JOIN [case].Escalation E ON
				E.EscalationId = CL.EscalationId
			LEFT OUTER JOIN dbo.Individual I4 ON
				I4.EntityId = CL.AssignedTo
		ORDER BY CL.CaseId DESC;
		
		SELECT
			Cl.CaseId
			, N.[Text]
			, N.NoteId
			, N.NoteTypeId
			, CAST(N.CreatedDate AT TIME ZONE 'US Mountain Standard Time' AS DATETIME) AS CreatedDate
			, I.FirstName + ' ' + I.LastName [CreatedBy]
			, I2.FirstName + ' ' + I2.LastName [ModifiedBy]
		FROM
			[case].CaseLog CL
		INNER JOIN @Cases C ON
			C.CaseId = CL.CaseId
		INNER JOIN [case].Notes N ON
			N.CaseId = CL.CaseId
		LEFT OUTER JOIN dbo.Individual I ON
			I.EntityId = N.CreatedByEntityId
		LEFT OUTER JOIN dbo.Individual I2 ON
			I2.EntityId = N.ModifiedBy;

	SELECT
		t.TaggedId
		, t.TaggedEntityId
		, i.FirstName
		, i.LastName
		, i.UserName
		, t.CaseId
	FROM [Case].Tagged t
	INNER JOIN dbo.Individual i
		ON t.TaggedEntityId = i.EntityId
	INNER JOIN @Cases C ON
		C.CaseId = t.CaseId;

	SELECT
		cl.[CaseId]
		  , cd.[name] [Filename]
	FROM 
		[case].[CaseDocs] cd
	INNER JOIN [case].[CaseDocs] cd2 on
		cd2.path_locator = cd.parent_path_locator
	INNER JOIN [case].[CaseLog] cl on
		CAST(cl.CaseId as nvarchar(450)) = REPLACE(REPLACE(cd.[file_stream].GetFileNamespacePath(), '\Documents\' , ''), '\' + cd.[name], '')
	INNER JOIN @Cases c on
		c.CaseId = cl.CaseId
	WHERE
		cd2.is_directory = 0x01
	AND cd.is_directory = 0x00


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_R_CaseDetail] TO [Atlas]
    AS [dbo];