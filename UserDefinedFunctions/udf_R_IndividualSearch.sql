CREATE FUNCTION [dbo].[udf_R_IndividualSearch]
(
	@SearchParameter nvarchar(500)
	, @IncludedIndividualTypes nvarchar(500)
)
RETURNS @final TABLE
(
	RowNum int
	, Result int
	, FirstName varchar(100)
	, LastName varchar(100)
	, UserName varchar(40)
	, EntityId int
	, Email varchar(200)
	, OfficeName varchar(100)
	, IndividualTypeId smallint
	, FlexId varchar(50)
	, MLSID smallint
	, Active bit
	, SystemAccess bit
)
AS
BEGIN
	DECLARE @Searchstring AS NVARCHAR(500)
	declare @SimpleSearch nvarchar(500);
	declare @PrefixSearch nvarchar(500);
	declare @EmailSimpleSearch nvarchar(500);
	declare @EmailPrefixSearch nvarchar(500);
	declare @FirstNameSimpleSearch nvarchar(500);
	declare @LastNameSimpleSearch nvarchar(500);
	declare @FirstNamePrefixSearch nvarchar(500);
	declare @LastNamePrefixSearch nvarchar(500);
	declare @SpaceIndex int;
	declare @EmailIndex int;
	declare @EmailCharacter nchar(1) = N'@';
	declare @PatIndex nvarchar(10) = N'%[0-9]%';
	declare @Threshold int = 30;

	declare @EmailSearch bit = 0x00;
	declare @NameSearch bit = 0x00;
	declare @UsernameSearch bit = 0x00;

	declare @IncludedMemberTypes TABLE (MemberTypeId int);

	IF @IncludedIndividualTypes IS NOT NULL
	BEGIN

		INSERT @IncludedMemberTypes SELECT [value] FROM OPENJSON(@IncludedIndividualTypes, '$.individualTypes'); 

	END

	DECLARE @returntable TABLE 
	(
		Result int
		, FirstName varchar(100)
		, LastName varchar(100)
		, UserName varchar(40)
		, EntityId int
		, Email varchar(200)
		, OfficeName varchar(100)
		, IndividualTypeId smallint
		, FlexId varchar(50)
		, MLSID smallint
		, Active bit
		, SystemAccess bit
	)

	/*
Process for search:
1) try to determine the type of input
	a) Name
	b) Email address
	c) Username

Determination will use some simple things:
	1) does the string contain a space?  Usernames do not contain spaces
	2) does the string contain an "@" sign? this will be an email search
	3) does the string contain numbers at all?  this would be a username

If one type of search doesn't yield sufficient results then another would need to occur.

Scenario:
	1) A single string is passed in.  
		a) Run that string through the checker and there are no numbers in the string
		b) Run that string through a check for and "@" sign.  Does not contain an "@" sign.  This is not an email address
	The string could therefor be a username or a name, first or last, we don't really know
	Order of search:
	First) Search for username match
		a) find exact matching first and add any others that are not a duplicate of the exact match
		if no results
		b) search by first name
		if no results, or not enough (what's the threshold?)
		c) search by last name
		return whatever we have at that point

	Other scenarios are mutations of the above scenario.  If there's a space in the string we go into name search by first and last, then first name with trailing wildcard, then last name with trailing wildcard.
	Email searches by email 
*/

SET @Searchstring =  @SearchParameter;

select @SpaceIndex = CHARINDEX(' ', @SearchString);

	-- These search terms work for things like username and email.  
	SET @SimpleSearch = N'' + REPLACE(@SearchString, N' ', N'') + N''; -- Simple term search
	SET @PrefixSearch = N'"' + REPLACE(@SearchString, N' ', N'') + N'*"'; -- Prefix Search
	
	SET @EmailSimpleSearch = N'' + REPLACE(@SearchString, N' ', N'') + N'';
	SET @EmailPrefixSearch = N'"' + REPLACE(@SearchString, N' ', N'') + N'*"';


if @SpaceIndex <> 0 -- we are calling this a name search, there are no spaces in usernames
BEGIN

	select @FirstNameSimpleSearch = N'' + LEFT(@SearchString, @SpaceIndex) + N'';
	select @LastNameSimpleSearch = N'' + SUBSTRING(@SearchString, @SpaceIndex + 1, LEN(@SearchString)) + N'';

	select @FirstNamePrefixSearch = N'"' + LEFT(@SearchString, @SpaceIndex) + N'*"';
	select @LastNamePrefixSearch = N'"' + SUBSTRING(@SearchString, @SpaceIndex + 1, LEN(@SearchString)) + N'*"';
	
	set @NameSearch = 0x01;

END
ELSE
BEGIN

	select @FirstNameSimpleSearch = N'' + @SearchString + N'';
	select @LastNameSimpleSearch = N'' + @SearchString + N'';

	select @FirstNamePrefixSearch = N'"' + @SearchString + N'*"';
	select @LastNamePrefixSearch = N'"' + @SearchString + N'*"';


END


;with Records(Result, FirstName, LastName, UserName, EntityId, Email, OfficeName, IndividualTypeId, FlexId, MLSID, Active, SystemAccess)
AS(
	SELECT 1 [Result]
	, ags.FirstName 
	, ags.LastName
	, ags.UserName
	, ags.EntityID
	, eml.Email
	, ofc.[Name] AS OfficeName 
	, ags.IndividualTypeId
	, ags.FlexId
	, ags.MLSID
	, ags.Active
	, ags.SystemAccess
FROM dbo.vw_AgentSearch ags
LEFT JOIN dbo.IndividualOffice inofc ON inofc.IndividualEntityId = ags.EntityID
LEFT JOIN dbo.Office ofc ON inofc.OfficeEntityId = ofc.EntityId
LEFT JOIN dbo.Emails eml ON eml.EntityId = ags.EntityID AND eml.IsPrimary = 0x01
WHERE 
	CONTAINS(ags.UserName, @SimpleSearch) 
)

	INSERT @returntable(
		  Result
		, FirstName 
		, LastName
		, UserName
		, EntityID
		, Email
		, OfficeName
		, IndividualTypeId
		, FlexId
		, MLSID
		, Active
		, SystemAccess)
	SELECT
		  Result
		, FirstName  
		, LastName
		, UserName
		, EntityID
		, Email
		, OfficeName
		, IndividualTypeId
		, FlexId
		, MLSID
		, Active
		, SystemAccess
	FROM 
		Records;

;with Records(Result, FirstName, LastName, UserName, EntityId, Email, OfficeName, IndividualTypeId, FlexId, MLSID, Active, SystemAccess)
AS(
		SELECT 2 [Result]
		, FirstName 
		, LastName
		, UserName
		, EntityID
		, Email
		, OfficeName
		, IndividualTypeId
		, FlexId
		, MLSID
		, Active
		, SystemAccess
	FROM 
		dbo.vw_AgentEmailSearch
	WHERE 
		CONTAINS(Email, @SimpleSearch) 
)

	INSERT @returntable(
		Result
		, FirstName 
		, LastName
		, UserName
		, EntityID
		, Email
		, OfficeName
		, IndividualTypeId
		, FlexId
		, MLSID
		, Active
		, SystemAccess)
	SELECT 
		Result
		, FirstName 
		, LastName
		, UserName
		, EntityID
		, Email
		, OfficeName
		, IndividualTypeId
		, FlexId
		, MLSID
		, Active
		, SystemAccess
	FROM 
		Records;


;with Records(Result, FirstName, LastName, UserName, EntityId, Email, OfficeName, IndividualTypeId, FlexId, MLSID, Active, SystemAccess)
AS(
	SELECT 3 [Result]
	, ags.FirstName 
	, ags.LastName
	, ags.UserName
	, ags.EntityID
	, eml.Email
	, ofc.[Name] AS OfficeName 
	, ags.IndividualTypeId
	, ags.FlexId
	, ags.MLSID
	, ags.Active
	, ags.SystemAccess
FROM dbo.vw_AgentSearch ags
LEFT JOIN dbo.IndividualOffice inofc ON inofc.IndividualEntityId = ags.EntityID
LEFT JOIN dbo.Office ofc ON inofc.OfficeEntityId = ofc.EntityId
LEFT JOIN dbo.Emails eml ON eml.EntityId = ags.EntityID AND eml.IsPrimary = 0x01
WHERE 
	CONTAINS(ags.FirstName, @FirstNameSimpleSearch)
AND CONTAINS(ags.LastName, @LastNameSimpleSearch)
)

	INSERT @returntable(
		Result
		, FirstName 
		, LastName
		, UserName
		, EntityID
		, Email
		, OfficeName
		, IndividualTypeId
		, FlexId
		, MLSID
		, Active
		, SystemAccess)
	SELECT
		Result 
		, FirstName 
		, LastName
		, UserName
		, EntityID
		, Email
		, OfficeName
		, IndividualTypeId
		, FlexId
		, MLSID
		, Active
		, SystemAccess
	FROM 
		Records;


;with Records(Result, FirstName, LastName, UserName, EntityId, Email, OfficeName, IndividualTypeId, FlexId, MLSID, Active, SystemAccess)
AS(
	SELECT 4 [Result]
	, ags.FirstName 
	, ags.LastName
	, ags.UserName
	, ags.EntityID
	, eml.Email
	, ofc.[Name] AS OfficeName 
	, ags.IndividualTypeId
	, ags.FlexId
	, ags.MLSID
	, ags.Active
	, ags.SystemAccess
FROM dbo.vw_AgentSearch ags
LEFT JOIN dbo.IndividualOffice inofc ON inofc.IndividualEntityId = ags.EntityID
LEFT JOIN dbo.Office ofc ON inofc.OfficeEntityId = ofc.EntityId
LEFT JOIN dbo.Emails eml ON eml.EntityId = ags.EntityID AND eml.IsPrimary = 0x01
WHERE 
	CONTAINS(ags.UserName, @PrefixSearch) 
)

	INSERT @returntable(
		  Result
		, FirstName 
		, LastName
		, UserName
		, EntityID
		, Email
		, OfficeName
		, IndividualTypeId
		, FlexId
		, MLSID
		, Active
		, SystemAccess)
	SELECT 
		  Result
		, FirstName 
		, LastName
		, UserName
		, EntityID
		, Email
		, OfficeName
		, IndividualTypeId
		, FlexId
		, MLSID
		, Active
		, SystemAccess
	FROM 
		Records;


;with Records(Result, FirstName, LastName, UserName, EntityId, Email, OfficeName, IndividualTypeId, FlexId, MLSID, Active, SystemAccess)
AS(
		SELECT 5 [Result]
		, FirstName 
		, LastName
		, UserName
		, EntityID
		, Email
		, OfficeName
		, IndividualTypeId
		, FlexId
		, MLSID
		, Active
		, SystemAccess
	FROM 
		dbo.vw_AgentEmailSearch
	WHERE 
		CONTAINS(Email, @PrefixSearch) 
)

	INSERT @returntable(
		Result
		, FirstName 
		, LastName
		, UserName
		, EntityID
		, Email
		, OfficeName
		, IndividualTypeId
		, FlexId
		, MLSID
		, Active
		, SystemAccess)
	SELECT 
		Result 
		, FirstName 
		, LastName
		, UserName
		, EntityID
		, Email
		, OfficeName
		, IndividualTypeId
		, FlexId
		, MLSID
		, Active
		, SystemAccess
	FROM 
		Records;


;with Records(Result, FirstName, LastName, UserName, EntityId, Email, OfficeName, IndividualTypeId, FlexId, MLSID, Active, SystemAccess)
AS(
	SELECT 6 [Result]
	, ags.FirstName 
	, ags.LastName
	, ags.UserName
	, ags.EntityID
	, eml.Email
	, ofc.[Name] AS OfficeName 
	, ags.IndividualTypeId
	, ags.FlexId
	, ags.MLSID
	, ags.Active
	, ags.SystemAccess
FROM dbo.vw_AgentSearch ags
LEFT JOIN dbo.IndividualOffice inofc ON inofc.IndividualEntityId = ags.EntityID
LEFT JOIN dbo.Office ofc ON inofc.OfficeEntityId = ofc.EntityId
LEFT JOIN dbo.Emails eml ON eml.EntityId = ags.EntityID AND eml.IsPrimary = 0x01
WHERE 
	CONTAINS(ags.FirstName, @FirstNamePrefixSearch)
AND CONTAINS(ags.LastName, @LastNamePrefixSearch) 
)

	INSERT @returntable(
		Result
		, FirstName 
		, LastName
		, UserName
		, EntityID
		, Email
		, OfficeName
		, IndividualTypeId
		, FlexId
		, MLSID
		, Active
		, SystemAccess)
	SELECT 
		Result
		, FirstName 
		, LastName
		, UserName
		, EntityID
		, Email
		, OfficeName
		, IndividualTypeId
		, FlexId
		, MLSID
		, Active
		, SystemAccess
	FROM 
		Records;


;with Records(Result, FirstName, LastName, UserName, EntityId, Email, OfficeName, IndividualTypeId, FlexId, MLSID, Active, SystemAccess)
AS(
	SELECT 7 [Result]
	, ags.FirstName 
	, ags.LastName
	, ags.UserName
	, ags.EntityID
	, eml.Email
	, ofc.[Name] AS OfficeName 
	, ags.IndividualTypeId
	, ags.FlexId
	, ags.MLSID
	, ags.Active
	, ags.SystemAccess
FROM dbo.vw_AgentSearch ags
LEFT JOIN dbo.IndividualOffice inofc ON inofc.IndividualEntityId = ags.EntityID
LEFT JOIN dbo.Office ofc ON inofc.OfficeEntityId = ofc.EntityId
LEFT JOIN dbo.Emails eml ON eml.EntityId = ags.EntityID AND eml.IsPrimary = 0x01
WHERE 
	CONTAINS(ags.SearchField, @FirstNamePrefixSearch)
OR CONTAINS(ags.SearchField, @LastNamePrefixSearch) 
)

	INSERT @returntable(
			Result
		, FirstName 
		, LastName
		, UserName
		, EntityID
		, Email
		, OfficeName
		, IndividualTypeId
		, FlexId
		, MLSID
		, Active
		, SystemAccess)
	SELECT 
		Result
		, FirstName 
		, LastName
		, UserName
		, EntityID
		, Email
		, OfficeName
		, IndividualTypeId
		, FlexId
		, MLSID
		, Active
		, SystemAccess
	FROM 
		Records;


;with Final(RowNum, Result, FirstName, LastName, Username, EntityId, Email, OfficeName, IndividualTypeId, FlexId, MLSID, Active, SystemAccess)
AS(

		SELECT
			ROW_NUMBER() OVER (PARTITION BY rt.UserName ORDER BY rt.Result) [RowNum]
			, rt.Result 
			, rt.FirstName 
			, rt.LastName
			, rt.UserName
			, rt.EntityID
			, rt.Email
			, rt.OfficeName
			, rt.IndividualTypeId
			, rt.FlexId
			, rt.MLSID
			, rt.Active
			, rt.SystemAccess
		FROM 
			@returntable rt
		INNER JOIN dbo.IndividualType IT ON
			IT.IndividualTypeId = rt.IndividualTypeId
		AND IT.MLSID = rt.MLSID
		LEFT OUTER JOIN dbo.OfficeStaffQueue osq ON
			osq.FlexId = rt.FlexId
		AND osq.flexId IS NOT NULL
		LEFT OUTER JOIN @IncludedMemberTypes IMT ON
			IMT.MemberTypeId = IT.IndividualTypeId
		WHERE
			((@IncludedIndividualTypes IS NULL 
		AND IT.VisibleInMainSearch = 0x01) -- Limit the results to the prefiltered as per the table OR by what's passed directly
				OR IT.IndividualTypeId = IMT.MemberTypeId)
)

-- Deduplicate the results based on username

		INSERT @final(
			RowNum
			, Result
			, FirstName 
			, LastName
			, UserName
			, EntityID
			, Email
			, OfficeName
			, IndividualTypeId
			, FlexId
			, MLSID
			, Active
			, SystemAccess)
		SELECT
			RowNum 
			, Result
			, FirstName 
			, LastName
			, UserName
			, EntityID
			, Email
			, OfficeName
			, IndividualTypeId
			, FlexId
			, MLSID
			, Active
			, SystemAccess
		FROM 
			Final
		WHERE
			RowNum = 1	
		ORDER BY 
			Result ASC;


	RETURN;

END
