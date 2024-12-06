DECLARE @ProdServer NVARCHAR(250) = N'wopr2';

DECLARE @ArmlsAuthorizeNetLoginId NVARCHAR(100) = '78FeEFw2d'
DECLARE @ArmlsAuthorizeNetTransactionKey NVARCHAR(100) = '39zrU6L4Eq42QV94'
DECLARE @MarktAuthorizeNetLoginId NVARCHAR(100) = '5vG3z9Rv'
DECLARE @MarktAuthorizeNetTransactionKey NVARCHAR(100) = '27mk5dU94AxMP4q4'

IF @@SERVERNAME = @ProdServer
BEGIN
	SET @ArmlsAuthorizeNetLoginId = '988GL4yWj8'
	SET @ArmlsAuthorizeNetTransactionKey = '99gsB54aCcU5a284'
	SET @MarktAuthorizeNetLoginId = '6w3Fsv5cj9Fg'
	SET @MarktAuthorizeNetTransactionKey = '673N8mFqpezB64P9'
END

INSERT INTO dbo.MLS (
	  MLSId
	, MLSName
	, MLSState
	, ReceiptLogoUrl
	, HeaderLogoUrl
	, [Url]
	, EmailReceiptSenderAddress
	, CanBeLinked
	, CanLogIn
	, EDWMLSID
	, MaintainIdentityServer
	, DisplayText
	, AuthorizeNetLoginId
	, AuthorizeNetTransactionKey
	, CanBeCaseSubject
) 
VALUES
	  (1, 'ARMLS','AZ', 'assets/img/armls-logo-color.png', 'assets/img/armls-logo.png', 'https://armls.com', 'billing@armls.info', 0x01, 0x01, 1, 0x01, 'ARMLS', @ArmlsAuthorizeNetLoginId, @ArmlsAuthorizeNetTransactionKey, 0x01)
	, (2, 'SAMLS', 'AZ', NULL, NULL, NULL, NULL, 0x01, 0x01, 11, 0x01, 'SAMLS', NULL, NULL, 0x01)
	, (3, 'Metro', 'WI', 'assets/img/metro-logo-color.png', 'assets/img/metro-logo.png', 'https://metromls.com/', 'billing@metromls.info', 0x00, 0x00, 9, 0x00, 'MetroMLS', NULL, NULL, 0x01)
	, (4, 'LakeHavasu', 'AZ', NULL, NULL, NULL, NULL, 0x00, 0x00, 7, 0x00, 'Lake Havasu', NULL, NULL, 0x01)
	, (5, 'Sedona', 'AZ', NULL, NULL, NULL, NULL, 0x00, 0x00, 5, 0x00, 'Sedona', NULL, NULL, 0x01)
	, (6, 'Prescott', 'AZ', NULL, NULL, NULL, NULL, 0x00, 0x00, 3, 0x00, 'Prescott', NULL, NULL, 0x01)
	, (7, 'Flagstaff', 'AZ', NULL, NULL, NULL, NULL, 0x00, 0x00, 13, 0x00, 'Flagstaff', NULL, NULL, 0x01)
	, (8, 'CentralArizona', 'AZ', NULL, NULL, NULL, NULL, 0x00, 0x00, 15, 0x00, 'Central Arizona', NULL, NULL, 0x01)
	, (9, 'RealMLS', 'FL', NULL, NULL, NULL, NULL, 0x00, 0x00, 19, 0x00, 'Real MLS', NULL, NULL, 0x01)
	, (10, 'Markt', 'AZ', NULL, NULL, NULL, 'http://themarkt.com', 0x00, 0x00, 999, 0x00, 'Markt', @MarktAuthorizeNetLoginId, @MarktAuthorizeNetTransactionKey, 0x00);
GO