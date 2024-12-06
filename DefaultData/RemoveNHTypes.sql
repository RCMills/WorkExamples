GO
DECLARE @NHUsers TABLE(
	RowId INT IDENTITY(1,1) 
	,EntityId INT)

DECLARE @CurrentProcessing int;
DECLARE @TotalRows int;
DECLARE @EntityId int

;with NHUsers (EntityId)
AS(
	SELECT
		EntityID
	FROM
		dbo.Individual 
	WHERE
		IndividualTypeId IN (13, 15, 16)
	AND Username <> 'guest'
	)

	INSERT @NHUsers SELECT EntityId FROM NHUsers;

	SELECT @CurrentProcessing = 1;
	SELECT @TotalRows = COUNT(*) FROM @NHUsers;

	WHILE @CurrentProcessing <= @TotalRows
	BEGIN

			SELECT @EntityId = EntityId FROM @NHUsers WHERE RowId = @CurrentProcessing;

			DELETE dbo.Phones WHERE EntityId = @EntityId;

			DELETE dbo.Emails WHERE EntityId = @EntityId;

			DELETE dbo.Addresses WHERE EntityId = @EntityId;

			DELETE dbo.EntityAssociation WHERE EntityId = @EntityId;

			DELETE dbo.IndividualOffice WHERE IndividualEntityId = @EntityId;

			DELETE Subs.Subscriptions WHERE EntityId = @EntityId;

			DELETE fin.Accounts WHERE EntityId = @EntityId;

			DELETE [case].Tagged WHERE TaggedEntityId = @EntityId;

			DELETE [case].CaseLog WHERE SelectedEntityId = @EntityId;

			DELETE dbo.Individual WHERE EntityId = @EntityId;

			SET @CurrentProcessing = @CurrentProcessing + 1;

	END

GO