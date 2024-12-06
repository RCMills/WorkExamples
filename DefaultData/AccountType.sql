IF NOT EXISTS(SELECT 1 FROM fin.AccountType WHERE AccountTypeDescription = 'Subscriber' AND MlsId = 1)
BEGIN
	
	INSERT fin.AccountType (AccountTypeId, AccountTypeDescription, GLSummaryAccount, GLAccount, Internal, MlsId)
	VALUES (1, 'Subscriber', 'Unearned MLS Admin Fees','24100', 0x01, 1)

END

IF NOT EXISTS(SELECT 1 FROM fin.AccountType WHERE AccountTypeDescription = 'MLS Fine' AND MlsId = 1)
BEGIN
	
	INSERT fin.AccountType (AccountTypeId, AccountTypeDescription, GLSummaryAccount, GLAccount, Internal, MlsId)
	VALUES (2, 'MLS Fine', 'MLS Fines','44010', 0x01, 1)

END

IF NOT EXISTS(SELECT 1 FROM fin.AccountType WHERE AccountTypeDescription = 'Revenue' AND MlsId = 1)
BEGIN
	
	INSERT fin.AccountType (AccountTypeId, AccountTypeDescription, GLSummaryAccount, GLAccount, Internal, MlsId)
	VALUES (3, 'Revenue', 'ARMLS Earned Subscriber Fee','40000', 0x01, 1)

END

IF NOT EXISTS(SELECT 1 FROM fin.AccountType WHERE AccountTypeDescription = 'Liability Accounts' AND MlsId = 1)
BEGIN
	
	INSERT fin.AccountType (AccountTypeId, AccountTypeDescription, GLSummaryAccount, GLAccount, Internal, MlsId)
	VALUES (4, 'Liability Accounts', 'Unearned MLS Admin Fees','24100', 0x01, 1)

END

IF NOT EXISTS(SELECT 1 FROM fin.AccountType WHERE AccountTypeDescription = 'Subscriber' AND MlsId = 10)
BEGIN
	
	INSERT fin.AccountType (AccountTypeId, AccountTypeDescription, GLSummaryAccount, GLAccount, Internal, MlsId)
	VALUES (5, 'Subscriber', 'Unearned Revenue','24120', 0x01, 10)

END

IF NOT EXISTS(SELECT 1 FROM fin.AccountType WHERE AccountTypeDescription = 'Revenue' AND MlsId = 10)
BEGIN
	
	INSERT fin.AccountType (AccountTypeId, AccountTypeDescription, GLSummaryAccount, GLAccount, Internal, MlsId)
	VALUES (6, 'Revenue', 'Earned Revenue','44120', 0x01, 10)

END