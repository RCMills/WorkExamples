CREATE   procedure [dbo].[usp_R_CaseSearch]
(
	@SearchParameter as nvarchar(500)
	, @MlsFilter int = NULL
	, @Product int = NULL
	, @Dept int = NULL
	, @ActivityType int = NULL
	, @SearchStartDate datetime2(7) = NULL
	, @SearchEndDate datetime2(7) = NULL
)
AS

/*******************************************************************************************************
*								usp_R_CaseSearch
*
*	Purpose: Get app user information based on search of fields
*
*	Author: Robert Mills
*
*	Origination Date: 
*
*	History
*	Revision		By			Date			WorkItem				Change
*	0001			RCM			5 Mar 2019		AD-1044					Birth
*	0002			RCM			1 Jun 2020		1376				Added Affiliate Search
*
*****************************************************************************************************/
		DECLARE @Cases TABLE(CaseId int);

		IF ISNUMERIC(@SearchParameter) = 1
		BEGIN
			INSERT @Cases SELECT CONVERT(INT, @SearchParameter)
		END

		DECLARE @Mls TABLE (MlsId int);

		IF @MlsFilter = 1 INSERT @Mls VALUES(1), (2);
		IF @MlsFilter = 3 INSERT @Mls VALUES(3);

		IF @SearchEndDate IS NOT NULL SELECT @SearchEndDate = DATEADD(DAY, 1, @SearchEndDate);
			
		DECLARE @Searchstring AS NVARCHAR(500);

		SET @Searchstring = N'"' + @SearchParameter + '*"';  -- Wildcard search is broad a.k.a. Prefix Search

		;with Records(EntityId)
			AS(
				SELECT 
					EntityId
				FROM 
					dbo.vw_AgentSearch
				WHERE 
					CONTAINS(SearchField, @Searchstring) -- FirstName, LastName, Username

					UNION ALL

				SELECT 
					EntityId
				FROM 
					dbo.vw_AgentEmailSearch
				WHERE 
					CONTAINS(Email, @Searchstring) -- Email Address


			), Cases(CaseLogId) 
			AS(

				SELECT
					S.CaseLogId
				FROM
					dbo.vw_CaseLogSearch AS S
				INNER JOIN [case].CaseLog AS CL ON
					CL.CaseLogId = S.CaseLogId
				LEFT OUTER JOIN [case].Tagged t
					ON cl.CaseId = t.CaseId
				WHERE
					CONTAINS(S.SearchField, @Searchstring) -- Customer FirstName, LastName, Email Address 
				OR Cl.SelectedEntityId IN (SELECT DISTINCT EntityId FROM Records) -- Selected EntityId as searched in the first CTE
				OR t.TaggedEntityId IN (SELECT DISTINCT EntityId FROM Records) -- tagged EntityId as searched in the first CTE
			)

		INSERT @Cases SELECT DISTINCT CaseId FROM Cases C INNER JOIN [case].CaseLog CL ON Cl.CaseLogId = C.CaseLogId; -- Simplify the list by getting unique case Ids

		SELECT
			CL.CaseId
			, I.UserName
			, COALESCE(/*A.AffiliateName,*/ Cl.FirstName, I.FirstName) [FirstName]
			, ISNULL(Cl.LastName, I.LastName) [LastName]
			, CL.ActivityTypeId
			, CL.ProductTypeId
			, P.ProductName
			, CL.DepartmentId
			, D.DepartmentDescription
			, CL.CaseStatusId
			, I2.FirstName + ' ' + I2.LastName [LastModifiedBy]
			, CAST(CL.[ModifiedDate] AT TIME ZONE 'US Mountain Standard Time' as DateTime) [LastModified]
			, n.[Text]
		FROM
			@Cases CS
		INNER JOIN 	[case].CaseLog CL ON
			CS.CaseId = CL.CaseId
		INNER JOIN dbo.Individual I2 ON
			Cl.ModifiedBy = I2.EntityId
		LEFT OUTER JOIN dbo.Individual I ON
			CL.SelectedEntityId = I.EntityId
		LEFT OUTER JOIN dbo.Individual I3 ON
			I3.EntityId = CL.ModifiedBy
		LEFT OUTER JOIN [case].Products P ON
			P.CaseProductId = CL.ProductTypeId
		LEFT OUTER JOIN [case].Notes n on
			n.CaseId = Cl.CaseId
		AND n.NoteTypeId = 1 -- Issue Description
		LEFT OUTER JOIN [Case].Department D
			ON CL.DepartmentId = D.DepartmentId
		WHERE
			(@Dept IS NULL OR (CL.DepartmentId = @Dept))
		AND (@Product IS NULL OR (CL.ProductTypeId = @Product))
		AND (@ActivityType IS NULL OR (CL.ActivityTypeId = @ActivityType))
		AND (@SearchStartDate IS NULL OR (cl.CreatedDate >= @SearchStartDate))
		AND (@SearchEndDate IS NULL OR(cl.CreatedDate <= @SearchEndDate))
		AND (@MlsFilter IS NULL OR (I.MLSID IN (SELECT MlsId FROM @Mls)))
		ORDER BY 
			CL.ModifiedDate DESC;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_R_CaseSearch] TO [Atlas]
    AS [dbo];

