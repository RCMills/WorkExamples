


IF (SELECT @@SERVERNAME) = 'dev10-12'
BEGIN

	UPDATE [Catalog].Products
	SET ProductLaunchURL = 'https://dev.rapidstats.com'
	WHERE ProductName = 'RapidStats'
	AND IsActive = 0x01
	AND MLSID = 1;

	UPDATE [Catalog].Products
	SET ProductLaunchURL = 'https://met.dev.rapidstats.com'
	WHERE ProductName = 'RapidStats'
	AND IsActive = 0x01
	AND MLSID = 3;
	
END

IF (SELECT @@SERVERNAME) = 'qa10-12'
BEGIN

	UPDATE [Catalog].Products
	SET ProductLaunchURL = 'https://qa.rapidstats.com'
	WHERE ProductName = 'RapidStats'
	AND IsActive = 0x01
	AND MLSID = 1;

	UPDATE [Catalog].Products
	SET ProductLaunchURL = 'https://met.qa.rapidstats.com'
	WHERE ProductName = 'RapidStats'
	AND IsActive = 0x01
	AND MLSID = 3;
	
END

IF (SELECT @@SERVERNAME) = 'staging10-12'
BEGIN

	UPDATE [Catalog].Products
	SET ProductLaunchURL = 'https://met.staging.rapidstats.com'
	WHERE ProductName = 'RapidStats'
	AND IsActive = 0x01
	AND MLSID = 1;

	UPDATE [Catalog].Products
	SET ProductLaunchURL = 'https://staging.wi.rapidstats.com'
	WHERE ProductName = 'RapidStats'
	AND IsActive = 0x01
	AND MLSID = 3;
	
END

IF (SELECT @@SERVERNAME) = 'wopr2'
BEGIN

	UPDATE [Catalog].Products
	SET ProductLaunchURL = 'https://rapidstats.com'
	WHERE ProductName = 'RapidStats'
	AND IsActive = 0x01
	AND MLSID = 1;

	UPDATE [Catalog].Products
	SET ProductLaunchURL = 'https://met.rapidstats.com'
	WHERE ProductName = 'RapidStats'
	AND IsActive = 0x01
	AND MLSID = 3;
	
END