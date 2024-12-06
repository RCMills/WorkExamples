CREATE PROCEDURE [dbo].[usp_R_IndividualChangesForTimePeriod]
AS
/****************************************************************************************************************************
*							usp_R_IndividualChangesForTimePeriod
*
*	Purpose: Get all member changes for a give time period to feed member type transition package
*
*	Author: Robert Mills
*
*	Origination Date: 18 Nov 2019
*
*	history
*	Revision	By		Date		Change
*	0001		RCM		18 Nov 2019	Birth
*	0002		RCM		20 Nov 2019	Removed time period option because SSIS couldn't handle it as a binary(10) value
*
*****************************************************************************************************************************/
SET NOCOUNT ON;

declare @EndLsn binary(10);
declare @Startlsn binary(10);
declare @ExecutionName varchar(50) = 'MemberTypeTransition';

select @Startlsn = executionLsn FROM dbo.cdc_execution WHERE executionName = @ExecutionName;

IF (@startlsn IS NULL OR @startlsn = '') select @Startlsn = sys.fn_cdc_get_min_lsn('Individual'); -- Get first lsn closest or greater than the datetime
select @EndLsn = sys.fn_cdc_get_max_lsn();

;with cte
as(
SELECT 
	sys.fn_cdc_has_column_changed('Individual', 'IndividualTypeId', __$update_mask) [IndividualTypeUpdated]
	, cdc.* 
FROM cdc.fn_cdc_get_all_changes_Individual(@Startlsn,  @EndLsn, 'all update old') cdc
INNER JOIN dbo.Individual i
	ON cdc.FlexId = i.FlexId
WHERE i.MLSID IN (1, 2)
) -- 'all update old gets us the old values along with the new'


	SELECT
		Row_Number() OVER (PARTITION BY EntityId Order By EntityId) [Group]
		, EntityId
		, UserName
		, IndividualTypeId
		, FirstName
		, MiddleName
		, LastName
		, FlexId
		, __$operation [operation]
	from 
		cte
	WHERE
		IndividualTypeUpdated = 0x01;

	exec dbo.[usp_U_executionNameLsn] @ExecutionName = 'MemberTypeTransition-Running', @Lsn = @EndLsn;

GO

GRANT EXECUTE
    ON OBJECT::[dbo].[usp_R_IndividualChangesForTimePeriod] TO PUBLIC
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_R_IndividualChangesForTimePeriod] TO [Atlas]
    AS [dbo];

