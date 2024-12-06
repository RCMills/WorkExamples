DECLARE @QA NVARCHAR(250) = N'qa10-12';
DECLARE @Staging NVARCHAR(250) = N'staging10-12';
DECLARE @Prod NVARCHAR(250) = N'wopr2';
DECLARE @EmailAddress NVARCHAR(100) =
	CASE
		WHEN @@SERVERNAME = @QA THEN 'jdehaven@armls.com'
		ELSE 'atlasdevteam@armls.com' -- Defaults to DEV
	END

IF NOT EXISTS(SELECT * FROM [case].Escalation WHERE EscalationDescription = 'ARMLS L2')
BEGIN

	SELECT @EmailAddress = CASE
		WHEN @@SERVERNAME = @Staging THEN 'escalations@armls.com'
		WHEN @@SERVERNAME = @Prod THEN 'escalations@armls.com'
		ELSE @EmailAddress
	END

	INSERT [case].Escalation VALUES(1, 'ARMLS L2', @EmailAddress, 1, 1)

END

IF NOT EXISTS(SELECT * FROM [case].Escalation WHERE EscalationDescription = 'ARMLS MLS Admin')
BEGIN

	SELECT @EmailAddress = CASE
		WHEN @@SERVERNAME = @Staging THEN 'MLSAdmin@armls.com'
		WHEN @@SERVERNAME = @Prod THEN 'MLSAdmin@armls.com'
		ELSE @EmailAddress
	END

	INSERT [case].Escalation VALUES(2, 'ARMLS MLS Admin', @EmailAddress, 1, 2)

END

IF NOT EXISTS(SELECT * FROM [case].Escalation WHERE EscalationDescription = 'ARMLS DI Supervisor')
BEGIN

	SELECT @EmailAddress = CASE
		WHEN @@SERVERNAME = @Staging THEN 'DIsupervisor@armls.com'
		WHEN @@SERVERNAME = @Prod THEN 'DIsupervisor@armls.com'
		ELSE @EmailAddress
	END

	INSERT [case].Escalation VALUES(3, 'ARMLS DI Supervisor', @EmailAddress, 2, 5)

END

IF NOT EXISTS(SELECT * FROM [case].Escalation WHERE EscalationDescription = 'ARMLS Finance')
BEGIN

	SELECT @EmailAddress = CASE
		WHEN @@SERVERNAME = @Staging THEN 'Finance@armls.com'
		WHEN @@SERVERNAME = @Prod THEN 'Finance@armls.com'
		ELSE @EmailAddress
	END

	INSERT [case].Escalation VALUES(4, 'ARMLS Finance', @EmailAddress, 3, 6)

END

IF NOT EXISTS (SELECT * FROM [case].Escalation WHERE EscalationDescription = 'ARMLS CS Manager')
BEGIN

	SELECT @EmailAddress = CASE
		WHEN @@SERVERNAME = @Staging THEN 'CSsupervisor@armls.com'
		WHEN @@SERVERNAME = @Prod THEN 'CSsupervisor@armls.com'
		ELSE @EmailAddress
	END

	INSERT [case].Escalation VALUES (5, 'ARMLS CS Manager', @EmailAddress, 1, 3)

END

IF NOT EXISTS (SELECT * FROM [case].Escalation WHERE EscalationDescription = 'ARMLS DI')
BEGIN

	SELECT @EmailAddress = CASE
		WHEN @@SERVERNAME = @Staging THEN 'DI@armls.com'
		WHEN @@SERVERNAME = @Prod THEN 'DI@armls.com'
		ELSE @EmailAddress
	END

	INSERT [case].Escalation VALUES (6, 'ARMLS DI', @EmailAddress, 2, 4)

END

IF NOT EXISTS (SELECT * FROM [case].Escalation WHERE EscalationDescription = 'Metro L2')
BEGIN

	SELECT @EmailAddress = CASE
		WHEN @@SERVERNAME = @Staging THEN 'support@metromls.com'
		WHEN @@SERVERNAME = @Prod THEN 'support@metromls.com'
		ELSE @EmailAddress
	END

	INSERT [case].Escalation VALUES (7, 'Metro L2', @EmailAddress, 1, 8)

END

IF NOT EXISTS (SELECT * FROM [case].Escalation WHERE EscalationDescription = 'MetroMLS Billing ')
BEGIN

	SELECT @EmailAddress = CASE
		WHEN @@SERVERNAME = @Staging THEN 'support@metromls.com'
		WHEN @@SERVERNAME = @Prod THEN 'support@metromls.com'
		ELSE @EmailAddress
	END

	INSERT [case].Escalation VALUES (8, 'MetroMLS Billing ', @EmailAddress, 1, 9)

END

IF NOT EXISTS (SELECT * FROM [case].Escalation WHERE EscalationDescription = 'MetroMLS DI')
BEGIN

	SELECT @EmailAddress = CASE
		WHEN @@SERVERNAME = @Staging THEN 'admin@metrolmls.com'
		WHEN @@SERVERNAME = @Prod THEN 'admin@metrolmls.com'
		ELSE @EmailAddress
	END

	INSERT [case].Escalation VALUES (9, 'MetroMLS DI', @EmailAddress, 2, 10)

END

IF NOT EXISTS (SELECT * FROM [case].Escalation WHERE EscalationDescription = 'WIRE Data')
BEGIN

	SELECT @EmailAddress = CASE
		WHEN @@SERVERNAME = @Staging THEN 'dataaquisition@wiredata.com'
		WHEN @@SERVERNAME = @Prod THEN 'dataaquisition@wiredata.com'
		ELSE @EmailAddress
	END

	INSERT [case].Escalation VALUES (10, 'WIRE Data', @EmailAddress, 2, 11)

END

IF NOT EXISTS (SELECT * FROM [case].Escalation WHERE EscalationDescription = 'MetroMLS IDX')
BEGIN

	SELECT @EmailAddress = CASE
		WHEN @@SERVERNAME = @Staging THEN 'metroidx@metromls.com'
		WHEN @@SERVERNAME = @Prod THEN 'metroidx@metromls.com'
		ELSE @EmailAddress
	END

	INSERT [case].Escalation VALUES (11, 'MetroMLS IDX', @EmailAddress, 2, 12)

END

IF NOT EXISTS (SELECT * FROM [case].Escalation WHERE EscalationDescription = 'ARMLS Brand')
BEGIN

	SELECT @EmailAddress = CASE
		WHEN @@SERVERNAME = @Staging THEN 'Brand@ARMLS.com'
		WHEN @@SERVERNAME = @Prod THEN 'Brand@ARMLS.com'
		ELSE @EmailAddress
	END

	INSERT [case].Escalation VALUES (12, 'ARMLS Brand', @EmailAddress, 1, 7)

END