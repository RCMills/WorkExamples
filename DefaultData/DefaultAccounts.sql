SET IDENTITY_INSERT fin.Accounts ON;
GO

IF NOT EXISTS(SELECT 1 FROM fin.Accounts WHERE AccountDescription = 'ARMLS AR')
BEGIN

	DELETE fin.Accounts WHERE AccountNo = 1;

	INSERT fin.Accounts (AccountNo, AccountTypeId, AccountDescription) 
	VALUES (1, 3, 'ARMLS AR');

END

IF NOT EXISTS(SELECT 1 FROM fin.Accounts WHERE AccountDescription = 'ARMLS Fine')
BEGIN

	DELETE fin.Accounts WHERE AccountNo = 2;

	INSERT fin.Accounts (AccountNo, AccountTypeId, AccountDescription) 
	VALUES (2, 2, 'ARMLS Fine');

END

IF NOT EXISTS(SELECT 1 FROM fin.Accounts WHERE AccountDescription = 'ARMLS AP')
BEGIN

	DELETE fin.Accounts WHERE AccountNo = 3;

	INSERT fin.Accounts (AccountNo, AccountTypeId, AccountDescription) 
	VALUES (3, 4, 'ARMLS AP');

END
GO

SET IDENTITY_INSERT fin.Accounts OFF;
GO

IF NOT EXISTS(SELECT 1 FROM fin.Accounts WHERE AccountDescription = 'ARMLS Available To Recognize')
BEGIN

	DELETE fin.Accounts WHERE AccountDescription = 'ARMLS Available To Recognize';

	INSERT fin.Accounts (AccountTypeId, AccountDescription) 
	VALUES (4, 'ARMLS Available To Recognize');

END

IF NOT EXISTS(SELECT 1 FROM fin.Accounts WHERE AccountDescription = 'Markt Available To Recognize')
BEGIN

	DELETE fin.Accounts WHERE AccountDescription = 'Markt Available To Recognize';

	INSERT fin.Accounts (AccountTypeId, AccountDescription) 
	VALUES (5, 'Markt Available To Recognize');

END