SET NOCOUNT ON;
SET XACT_ABORT ON; 

BEGIN TRANSACTION;

DECLARE @Dev nvarchar(250) = N'dev10-12';
DECLARE @QA nvarchar(250) = N'qa10-12';
DECLARE @Staging nvarchar(250) = N'staging10-12';
DECLARE @Prod nvarchar(250) = N'wopr2';
DECLARE @ArmlsClassClientId varchar(500) = CASE WHEN @@SERVERNAME = @Dev THEN '13fc6a7304f14d398920fbe1bd738c70'
												WHEN @@SERVERNAME = @QA THEN 'f82a9e8c83ea4a8c87cde7a68d49c9f8'
												WHEN @@SERVERNAME = @Staging THEN '9e783ba079f140ccbef351fc251ed601'
												WHEN @@SERVERNAME = @Prod THEN '81dafef2769f417fb668648936cb62c1'
												ELSE '13fc6a7304f14d398920fbe1bd738c70'
												END

DECLARE @AlignedShowingsClientId varchar(500) = CASE WHEN @@SERVERNAME = @Dev THEN 'c5501ddcb243441da97763ee56359fb0'
												WHEN @@SERVERNAME = @QA THEN 'c5501ddcb243441da97763ee56359fb0'
												WHEN @@SERVERNAME = @Staging THEN 'c5501ddcb243441da97763ee56359fb0'
												WHEN @@SERVERNAME = @Prod THEN '273c354c70114abb879c7ae232f23d38'
												ELSE 'c5501ddcb243441da97763ee56359fb0'
												END

MERGE INTO [dbo].[SsoClients] AS Target
USING (VALUES 
(1, 'Atlas Client - used for accessing client', 'AtlasClient', 0x00, 0x01)
, (2, 'GatewayClient - used for accessing atlas also', 'gwClient', 0x00, 0x01)
, (3, 'Cloud CMA', 'https://cloudcma.com/saml/login/armls', 0x01, 0x01)
, (4, 'Cloud Streams', 'https://cloudstreams.net/saml/login/armls', 0x01, 0x01)
, (5, 'Cloud MLX', 'https://cloudmlx.com/saml/login/armls', 0x01, 0x01)
, (6, 'Monsoon', 'Monsoon', 0x01, 0x01)
, (7, 'Flexmls', 'AK24rggHYwaJtJe54T8xaMLdMBopQMFJ1YCMsaAG', 0x01, 0x01)
, (8, 'ShowingTime', 'u146MW3kUkPlxfrUKOpKTG1zxZfnr23iEtvGz6b3', 0x01, 0x01)
, (9, 'Remine', 'nxzn9PrGgcGeKqAkQt4XAhdOQG48bo9sliuo5y5E', 0x01, 0x01)
, (10, 'AgentSquared', 'KRSC1TXogPYmdTK6TC5MVNeoGmSanzIzurjuAGvt', 0x01, 0x00)
, (11, 'Mobile apps', 'TestMobile', 0x01, 0x01)
, (12, 'IdentityServeradmin_ui', 'admin_ui', 0x00, 0x01)
, (13, 'IdentityServeradmin_ui_sample', 'admin_ui_sample', 0x00, 0x01)
, (14, 'OpenIDCertification', 'op.certification.openid.net', 0x00, 0x01)
, (15, 'Monsoon Pro', 'MonsoonProClient', 0x00, 0x01)
, (16, 'RapidStats Client', 'RapidStatsClient', 0x01, 0x01) --Active for RapidStatsClient
, (17, 'SimplyVoting Client', 'jER2oCpYITRBDk0LqJPlmROeqJgrvI5kq41s8PKo', 0x00, 0x01)
, (18, 'RattleHawk Client', 'Rattlehawk', 0x00, 0x01)
, (19, 'RattlehawkMobile', 'RattlehawkMobile', 0x00, 0x01)
, (20, 'EasyGenerator', '2MTMn3CaBOmEypXPgQzuB5Zm7kCvz4tHs4OBzAZ8', 0x01, 0x01)
, (21, 'CloudAttract','gh2oWCmt5WDFX3I0vbf76h6QXEWFtbjocnSd4oIh',0x01, 0x01)
, (22, 'ARMLSCLass', @ArmlsClassClientId, 0x01, 0x01)
, (23, 'Atlas Client - used for accessing client', 'AtlasClientPKCE', 0x00, 0x01)
, (24, 'AlignedShowings', @AlignedShowingsClientId, 0x00, 0x01)
)

AS Source (SsoClientId, SsoClientDescription, SsoClientString, ProductRequired, IsActive)
ON target.[SsoClientId] = Source.[SsoClientId] 
WHEN NOT MATCHED BY target THEN 
INSERT(SsoClientId, SsoClientDescription, SsoClientString, ProductRequired, IsActive)
VALUES(SsoClientId, SsoClientDescription, SsoClientString, ProductRequired, IsActive)
WHEN MATCHED THEN  
	UPDATE SET SsoClientId = source.SsoClientId
		, SsoClientDescription = source.SsoClientDescription
		, SsoClientString = source.SsoClientString
		, ProductRequired = source.ProductRequired
		, IsActive = source.IsActive;

COMMIT 

GO

-- update to active on dev10-12 only for the sso client for dev work
--IF @@SERVERNAME = 'dev10-12'
--BEGIN
--	UPDATE dbo.SsoClients SET IsActive = 0x01 WHERE SsoClientId = 16
--END
--GO