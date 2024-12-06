CREATE FUNCTION [dbo].[udf_R_AtlasStatus]
(
	@EntityId int
)
RETURNS @StatusReturnTbl TABLE
(
	AtlasStatus varchar(10),
	reason varchar(100)
)
AS
BEGIN

	DECLARE @InactiveByAssoication BIT;
	DECLARE @ReturnStatus VARCHAR(20);
	DECLARE @AtlasStatusDesc VARCHAR(50);
	DECLARE @FbsBillable BIT;

		SELECT 
			  @InactiveByAssoication = CASE WHEN ind.Active = 0x00 OR ind.SystemAccess = 0x00 THEN 0x00 ELSE 0x01 END
			, @AtlasStatusDesc = atlst.[AtlasStatusDescription]
			, @FbsBillable = ind.[FbsBillable]
		FROM 
			[Individual] ind 
		INNER JOIN [AtlasStatus] atlst ON 
			ind.[AtlasStatusId] = atlst.[AtlasStatusId]
		WHERE 
			ind.[EntityId] = @EntityId; 

		-- set @returnStatus to Active to start with 
		SET @ReturnStatus = 'Active';

		-- if AtlasStatus is not active, set status and add reason to table
		IF @AtlasStatusDesc = 'In Appeal'
			BEGIN
				INSERT INTO @StatusReturnTbl(reason) VALUES(@AtlasStatusDesc);
			END;
		ELSE IF @AtlasStatusDesc <> 'Active'
			BEGIN 
				SET @ReturnStatus = 'Inactive';
				INSERT INTO @StatusReturnTbl(reason) VALUES(@AtlasStatusDesc);
			END;

		-- check for @systemaccess set to false(0x00) 
		IF @InactiveByAssoication = 0x00
			BEGIN
				SET @ReturnStatus = 'Inactive';
				INSERT INTO @StatusReturnTbl (reason) VALUES('Inactivated by Association');
			END;

		-- check for active subscription 
		IF [dbo].udf_R_HasActiveSubscription(@EntityId) = 0x00
			BEGIN
				SET @ReturnStatus = 'Inactive';
				INSERT INTO @StatusReturnTbl (reason) VALUES('Expired');
			END;
		
		IF (SELECT COUNT(*) FROM @StatusReturnTbl) > 0 
		BEGIN

			UPDATE @StatusReturnTbl SET [AtlasStatus] = @ReturnStatus;
		END
		ELSE
		BEGIN

			INSERT @StatusReturnTbl(AtlasStatus) VALUES (@ReturnStatus);

		END

	RETURN;
END