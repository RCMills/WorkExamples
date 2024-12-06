-- Setup some values for given attributes

TRUNCATE TABLE dbo.IndividualTypeStringValue;
TRUNCATE TABLE dbo.IndividualTypeBitValue;
TRUNCATE TABLE dbo.IndividualTypeIntegerValue;

DECLARE @LogonTypeDisplayEnum int = 1; --'LogonTypeDisplay'
DECLARE @AtlasMemberTypeEnum int = 2;  --'AtlasMemberType';
DECLARE @VisibleInMainSearchEnum int = 3;
DECLARE @UsesDefaultSubscriptionEnum int = 4;
DECLARE @DefaultSubscriptionEntityIdEnum int = 5;
DECLARE @RequiresNRDSIDEnum int = 6;
DECLARE @RequiresLicenseNumberEnum int = 7;
DECLARE @CanBeCreatedEnum int = 8;

DECLARE @MLSID int;

DECLARE @LogonType varchar(50);
DECLARE @LogonTypeDisplay varchar(50);
DECLARE @AtlasMemberType varchar(50);

DECLARE @ITID int; -- The current ITID value
DECLARE @IndividualTypeId int;

SET @MLSID = 1 -- ARMLS values

/*
	Affiliate Appraiser
*/

SET @LogonType = 'Affiliate Appraiser';
SET @LogonTypeDisplay = 'Affiliate Appraiser';
SET @AtlasMemberType = 'Agent';
SET @IndividualTypeId = 1;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
, 	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType);


INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01)
,	(@ITID, @CanBeCreatedEnum, 0x01)
,	(@ITID, @RequiresLicenseNumberEnum, 0x01)
,	(@ITID, @RequiresNRDSIDEnum , 0x00);

/*
	Affiliate
*/

SET @LogonType = 'Affiliate';
SET @LogonTypeDisplay = 'Affiliate';
SET @AtlasMemberType = 'Agent';
SET @IndividualTypeId = 2;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01)
,	(@ITID, @CanBeCreatedEnum, 0x01)
,	(@ITID, @RequiresLicenseNumberEnum, 0x00)
,	(@ITID, @RequiresNRDSIDEnum , 0x00);

/*
	Affiliate Key
*/

SET @LogonType = 'Affiliate Key';
SET @LogonTypeDisplay = 'Affiliate Key';
SET @AtlasMemberType = 'Agent';
SET @IndividualTypeId = 3;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01),	
	(@ITID, @CanBeCreatedEnum, 0x01)
,	(@ITID, @RequiresLicenseNumberEnum, 0x00)
,	(@ITID, @RequiresNRDSIDEnum , 0x00);

/*
	Appraiser
*/

SET @LogonType = 'Appraiser';
SET @LogonTypeDisplay = 'Appraiser';
SET @AtlasMemberType = 'Agent';
SET @IndividualTypeId = 4;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01)
,	(@ITID, @CanBeCreatedEnum, 0x01)
,	(@ITID, @RequiresLicenseNumberEnum, 0x01)
,	(@ITID, @RequiresNRDSIDEnum , 0x01);

/*
	Designated Broker (Non-Realtor)
*/

SET @LogonType = 'Designated Broker (Non-Realtor)';
SET @LogonTypeDisplay = 'Designated Broker (Non-Realtor)';
SET @AtlasMemberType = 'Agent';
SET @IndividualTypeId = 5;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01)
,	(@ITID, @CanBeCreatedEnum, 0x01)
,	(@ITID, @RequiresLicenseNumberEnum, 0x01)
,	(@ITID, @RequiresNRDSIDEnum , 0x00);

/*
	Designated Broker
*/

SET @LogonType = 'Designated Realtor';
SET @LogonTypeDisplay = 'Designated Realtor';
SET @AtlasMemberType = 'Agent';
SET @IndividualTypeId = 6;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01)
,	(@ITID, @CanBeCreatedEnum, 0x01)
,	(@ITID, @RequiresLicenseNumberEnum, 0x01)
,	(@ITID, @RequiresNRDSIDEnum , 0x01);

/*
	Office Staff
*/

SET @LogonType = 'Office Staff';
SET @LogonTypeDisplay = 'Office Staff';
SET @AtlasMemberType = 'Agent';
SET @IndividualTypeId = 7;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
	(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01)
,	(@ITID, @CanBeCreatedEnum, 0x00)
,	(@ITID, @RequiresLicenseNumberEnum, 0x00)
,	(@ITID, @RequiresNRDSIDEnum , 0x00);

/*
	Realtor
*/

SET @LogonType = 'Realtor';
SET @LogonTypeDisplay = 'Realtor';
SET @AtlasMemberType = 'Agent';
SET @IndividualTypeId = 8;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01)
,	(@ITID, @CanBeCreatedEnum, 0x01)
,	(@ITID, @RequiresLicenseNumberEnum, 0x01)
,	(@ITID, @RequiresNRDSIDEnum , 0x01);

/*
	Sales Person
*/

SET @LogonType = 'Sales Person';
SET @LogonTypeDisplay = 'Sales Person';
SET @AtlasMemberType = 'Agent';
SET @IndividualTypeId = 9;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01)
,	(@ITID, @CanBeCreatedEnum, 0x01)
,	(@ITID, @RequiresLicenseNumberEnum, 0x00)
,	(@ITID, @RequiresNRDSIDEnum , 0x00);

/*
	MLS Staff
*/

SET @LogonType = 'MLS Staff';
SET @LogonTypeDisplay = 'MLS Staff';
SET @AtlasMemberType = 'MLS Staff';
SET @IndividualTypeId = 10;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId   , @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x00);

INSERT dbo.IndividualTypeBitValue
	(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @UsesDefaultSubscriptionEnum, 0x01)
,	(@ITID, @CanBeCreatedEnum, 0x01)
,	(@ITID, @RequiresLicenseNumberEnum, 0x00)
,	(@ITID, @RequiresNRDSIDEnum , 0x00);

INSERT dbo.IndividualTypeIntegerValue
	(ITID, AttributeId, IntegerValue)
VALUES
	(@ITID, @DefaultSubscriptionEntityIdEnum, -1)

/*
	Waiver
*/

SET @LogonType = 'Waiver';
SET @LogonTypeDisplay = 'Waiver';
SET @AtlasMemberType = 'Agent';
SET @IndividualTypeId = 11;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
	(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @UsesDefaultSubscriptionEnum, 0x01)
,	(@ITID, @CanBeCreatedEnum, 0x01)
,	(@ITID, @RequiresLicenseNumberEnum, 0x00)
,	(@ITID, @RequiresNRDSIDEnum , 0x00);


/*
	Registered User
*/

SET @LogonType = 'Registered User';
SET @LogonTypeDisplay = 'Registered User';
SET @AtlasMemberType = 'Registered User';
SET @IndividualTypeId = 14;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

/*
	Guest
*/

SET @LogonType = 'Guest';
SET @LogonTypeDisplay = 'Guest';
SET @AtlasMemberType = 'Guest';
SET @IndividualTypeId = 16;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)


/*
	Association Staff
*/

SET @LogonType = 'Association Staff';
SET @LogonTypeDisplay = 'Association Staff';
SET @AtlasMemberType = 'Association Staff';
SET @IndividualTypeId = 17;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x00)
,	(@ITID, @CanBeCreatedEnum, 0x01)
,	(@ITID, @RequiresLicenseNumberEnum, 0x00)
,	(@ITID, @RequiresNRDSIDEnum , 0x00)
,	(@ITID, @UsesDefaultSubscriptionEnum, 0x01);

INSERT dbo.IndividualTypeIntegerValue
	(ITID, AttributeId, IntegerValue)
VALUES
	(@ITID, @DefaultSubscriptionEntityIdEnum, -2)


/*
	Moving to SAMLS MLS
*/

SET @MLSID = 2 -- SAMLS

/*
	Realtor Appraiser
*/

SET @LogonType = 'Realtor Appraiser';
SET @LogonTypeDisplay = 'Appraiser';
SET @AtlasMemberType = 'Agent';
SET @IndividualTypeId = 4;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

/*
	Designated Broker
*/

SET @LogonType = 'Designated Broker';
SET @LogonTypeDisplay = 'Designated Broker';
SET @AtlasMemberType = 'Agent';
SET @IndividualTypeId = 6;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

/*
	Office Staff
*/

SET @LogonType = 'Staff';
SET @LogonTypeDisplay = 'Office Staff';
SET @AtlasMemberType = 'Agent';
SET @IndividualTypeId = 7;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
	(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

/*
	Realtor
*/

SET @LogonType = 'Realtor';
SET @LogonTypeDisplay = 'Realtor';
SET @AtlasMemberType = 'Agent';
SET @IndividualTypeId = 8;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

/*
	MLS Staff
*/

SET @LogonType = 'SAAR/SAMLS Staff';
SET @LogonTypeDisplay = 'MLS Staff';
SET @AtlasMemberType = 'MLS Staff';
SET @IndividualTypeId = 10;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId   , @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x00);

INSERT dbo.IndividualTypeBitValue
	(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @UsesDefaultSubscriptionEnum, 0x01)

INSERT dbo.IndividualTypeIntegerValue
	(ITID, AttributeId, IntegerValue)
VALUES
	(@ITID, @DefaultSubscriptionEntityIdEnum, -1)

/*
	Waiver
*/

SET @LogonType = 'Waiver';
SET @LogonTypeDisplay = 'Waiver';
SET @AtlasMemberType = 'Waiver';
SET @IndividualTypeId = 11;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

/*
	Association Staff
*/

SET @LogonType = 'Association Staff';
SET @LogonTypeDisplay = 'Association Staff';
SET @AtlasMemberType = 'Association Staff';
SET @IndividualTypeId = 17;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x00);

/*
	Association Staff
*/

SET @LogonType = 'Branch Manager';
SET @LogonTypeDisplay = 'Branch Manager';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 18;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

INSERT dbo.IndividualTypeBitValue
	(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @UsesDefaultSubscriptionEnum, 0x00)


SET @MLSID = 3 -- Metro MLS

/*
	Appraiser
*/

SET @LogonType = 'Appraiser';
SET @LogonTypeDisplay = 'Appraiser';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 4;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Broker/Owner';
SET @LogonTypeDisplay = 'Broker/Owner';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 6;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Realtor';
SET @LogonTypeDisplay = 'Realtor';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 8;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Designate/Manager';
SET @LogonTypeDisplay = 'Designate/Manager';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 19;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Agent Assistant';
SET @LogonTypeDisplay = 'Agent Assistant';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 20;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Company Assistant';
SET @LogonTypeDisplay = 'Company Assistant';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 21;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Team Login';
SET @LogonTypeDisplay = 'Team Login';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 22;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Photographer';
SET @LogonTypeDisplay = 'Photographer';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 23;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Office Admin';
SET @LogonTypeDisplay = 'Office Admin';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 24;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Appraiser Assistant';
SET @LogonTypeDisplay = 'Appraiser Assistant';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 25;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Team Assistant';
SET @LogonTypeDisplay = 'Team Assistant';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 26;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'WI-DOR';
SET @LogonTypeDisplay = 'WI-DOR';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 27;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Board Staff';
SET @LogonTypeDisplay = 'Board Staff';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 28;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Non MLS Member';
SET @LogonTypeDisplay = 'Non MLS Member';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 29;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Office Assistant';
SET @LogonTypeDisplay = 'Office Assistant';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 30;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @MLSID = 4;

SET @LogonType = 'Appraiser';
SET @LogonTypeDisplay = 'Appraiser';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 4;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Designated Realtor';
SET @LogonTypeDisplay = 'Designated Realtor';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 6;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Realtor';
SET @LogonTypeDisplay = 'Realtor';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 8;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Agent MLO';
SET @LogonTypeDisplay = 'Agent MLO';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 33;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Appraiser MLO';
SET @LogonTypeDisplay = 'Appraiser MLO';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 35;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Assistant';
SET @LogonTypeDisplay = 'Assistant';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 36;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Designated Broker MLO';
SET @LogonTypeDisplay = 'Designated Broker MLO';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 37;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @MLSID = 5;

SET @LogonType = 'Appraiser';
SET @LogonTypeDisplay = 'Appraiser';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 4;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Realtor';
SET @LogonTypeDisplay = 'Realtor';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 8;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Administrator Asst';
SET @LogonTypeDisplay = 'Administrator Asst';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 39;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Manager';
SET @LogonTypeDisplay = 'Manager';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 40;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Broker';
SET @LogonTypeDisplay = 'Broker';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 41;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Associate Broker';
SET @LogonTypeDisplay = 'Associate Broker';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 43;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'MLS No Charge';
SET @LogonTypeDisplay = 'MLS No Charge';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 44;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @MLSID = 6;

SET @LogonType = 'Appraiser';
SET @LogonTypeDisplay = 'Appraiser';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 4;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Realtor';
SET @LogonTypeDisplay = 'Realtor';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 8;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Broker';
SET @LogonTypeDisplay = 'Broker';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 41;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Staff Admin';
SET @LogonTypeDisplay = 'Staff Admin';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 46;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @MLSID = 7;

SET @LogonType = 'Appraiser';
SET @LogonTypeDisplay = 'Appraiser';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 4;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Designated Realtor';
SET @LogonTypeDisplay = 'Designated Realtor';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 6;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Realtor';
SET @LogonTypeDisplay = 'Realtor';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 8;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Board Staff';
SET @LogonTypeDisplay = 'Board Staff';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 28;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Secondary Realtor';
SET @LogonTypeDisplay = 'Secondary Realtor';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 49;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);

SET @LogonType = 'Secondary DR';
SET @LogonTypeDisplay = 'Secondary DR';
SET @AtlasMemberType = 'Customer';
SET @IndividualTypeId = 52;

IF EXISTS(SELECT * FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID)
BEGIN

	SELECT @ITID = ITID FROM dbo.IndividualType_New WHERE [LogonType]  = @LogonType AND MLSID = @MLSID
	
END
ELSE
BEGIN

	INSERT dbo.IndividualType_New	([IndividualTypeId]	, [MLSID]	, [LogonType])
	VALUES												(@IndividualTypeId	, @MLSID	, @LogonType)

	SELECT @ITID = @@IDENTITY;

END

INSERT dbo.IndividualTypeStringValue
	(ITID, AttributeId, StringValue)
VALUES
	(@ITID, @LogonTypeDisplayEnum, @LogonType)
,	(@ITID, @AtlasMemberTypeEnum, @AtlasMemberType)

INSERT dbo.IndividualTypeBitValue
(ITID, AttributeId, BitValue)
VALUES
	(@ITID, @VisibleInMainSearchEnum, 0x01);