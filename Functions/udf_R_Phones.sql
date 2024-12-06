CREATE FUNCTION dbo.udf_R_Phones ( @EntityId int )
RETURNS TABLE
AS
RETURN(
SELECT 
	EntityId 
	, [1] as [homeFax]
	, [2] as [home]
	, [3] as [Office]
	, [4] as [personal]
	, [5] as [school]
	, [6] as [vacation]
	, [7] as [work]
	, [8] as [mobile]
	, [9] as [officeFax]
	, [10] as [officeDirect]
	, [11] as [pager]
	, [12] as [tollFree]
	, [13] as [TTYTDD]
	, [14] as [VoiceMail]
FROM(
SELECT
	EntityId
	, ContactTypeId
	, Phone
FROM
	dbo.Phones
WHERE
	EntityId = @EntityId) p
PIVOT(
	MAX(Phone)
FOR
	ContactTypeId IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14])
) as pvt);
