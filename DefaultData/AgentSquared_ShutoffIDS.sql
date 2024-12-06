
use [Armls.IdentityServer]
GO
UPDATE
	dbo.Clients
SET
	Enabled = 0x00
WHERE
	ClientName = 'Agent Squared';
GO

use [Atlas]
GO
