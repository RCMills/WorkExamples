IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'ARMLS' AND MLSID = 1)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			1
			, 1
			, '20080624191109359945000000'
			, 'ARMLS'
			, '130 S Priest Dr., Ste. 101, Tempe, AZ 85281'
			, '4809217777'
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'None' AND MLSID = 1)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active]	)
	VALUES(
			2
			, 1
			, '20080624211803232014000000'
			, 'None'
			, ''
			, ''
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'PAR' AND MLSID = 1)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			3
			, 1
			, '20080624134934677441000000'
			, 'PAR'
			, '5033 N. 19th Ave., Ste 119, Phoenix, AZ 85015'
			, '6022461012'
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'Scottsdale' AND MLSID = 1)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			4
			, 1
			, '20080624134939431563000000'
			, 'Scottsdale'
			, '8600 E Anderson Dr #200, Scottsdale, AZ 85255'
			, '4809452651'
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'SEVRAR' AND MLSID = 1)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			5
			, 1
			, '20080624134931844626000000'
			, 'SEVRAR'
			, '1363 S Vineyard, Mesa, AZ 85210'
			, '4804775882'
			, 0)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'WEMAR' AND MLSID = 1)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			6
			, 1
			, '20080624134926955616000000'
			, 'WEMAR'
			, '9001 W Union Hills Dr #8, Peoria, AZ 85382'
			, '6239319294'
			, 0
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'Western Pinal' AND MLSID = 1)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			7
			, 1
			, '20080624134923815587000000'
			, 'Western Pinal'
			, '820 W Cottonwood Ln #9, Casa Grande, AZ 85122'
			, '5204211222'
			, 0
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'SAAR' AND MLSID = 2)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			8
			, 2
			, ''
			, 'SAAR'
			, ''
			, '5204587802'
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'AAR' AND MLSID = 2)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			9
			, 2
			, ''
			, 'AAR'
			, ''
			, ''
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'Douglas' AND MLSID = 2)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			10
			, 2
			, ''
			, 'Douglas'
			, ''
			, '6239319294'
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'Graham/Greenlee' AND MLSID = 2)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			11
			, 2
			, ''
			, 'Graham/Greenlee'
			, ''
			, ''
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'GVAR' AND MLSID = 2)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			12
			, 2
			, ''
			, 'GVAR'
			, ''
			, ''
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'Lake Havasu' AND MLSID = 2)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			13
			, 2
			, ''
			, 'Lake Havasu'
			, ''
			, ''
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'Northern Arizona' AND MLSID = 2)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			14
			, 2
			, ''
			, 'Northern Arizona'
			, ''
			, ''
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'Phoenix' AND MLSID = 2)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			15
			, 2
			, ''
			, 'Phoenix'
			, ''
			, '6022461012'
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'Prescott Area' AND MLSID = 2)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			16
			, 2
			, ''
			, 'Prescott Area'
			, ''
			, ''
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'Santa Cruz' AND MLSID = 2)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			17
			, 2
			, ''
			, 'Santa Cruz'
			, ''
			, ''
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'Southeast Valley' AND MLSID = 2)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			19
			, 2
			, ''
			, 'Southeast Valley'
			, ''
			, '4804775882'
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'Tucson' AND MLSID = 2)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			20
			, 2
			, ''
			, 'Tucson'
			, ''
			, ''
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'WEMAR' AND MLSID = 2)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			21
			, 2
			, ''
			, 'WEMAR'
			, ''
			, '6239319294'
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'WMAR' AND MLSID = 2)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			22
			, 2
			, ''
			, 'WMAR'
			, ''
			, '6239319294'
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'WPAR' AND MLSID = 2)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			23
			, 2
			, ''
			, 'WPAR'
			, ''
			, '6239319294'
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'other' AND MLSID = 2)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			24
			, 2
			, ''
			, 'other'
			, ''
			, ''
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'SEAZ' AND MLSID = 1)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			25
			, 1
			, '20190402155846565841000000'
			, 'SEAZ'
			, ''
			, '5204587802'
			, 0
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'Metro MLS' AND MLSID = 3)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			26
			, 3
			, ''
			, 'Metro MLS'
			, ''
			, ''
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'LaCrosse MLS' AND MLSID = 3)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			27
			, 3
			, ''
			, 'LaCrosse MLS'
			, ''
			, ''
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'Sheboygan MLS' AND MLSID = 3)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active]	)
	VALUES(
			28
			, 3
			, ''
			, 'Sheboygan MLS'
			, ''
			, ''
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'Kenosha MLS' AND MLSID = 3)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			29
			, 3
			, ''
			, 'Kenosha MLS'
			, ''
			, ''
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'Manitowoc MLS' AND MLSID = 3)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			30
			, 3
			, ''
			, 'Manitowoc MLS'
			, ''
			, ''
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'Marinette MLS' AND MLSID = 3)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			31
			, 3
			, ''
			, 'Marinette MLS'
			, ''
			, ''
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'LHAR' AND MLSID = 4)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			33
			, 4
			, ''
			, 'LHAR'
			, ''
			, ''
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'SVVAR' AND MLSID = 5)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			32
			, 5
			, ''
			, 'SVVAR'
			, ''
			, ''
			, 1
		)
END


IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'PAAR' AND MLSID = 6)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			34
			, 6
			, ''
			, 'PAAR'
			, ''
			, ''
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'WeSERV' AND MLSID = 1)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			35
			, 1
			, '20201013143956417710000000'
			, 'WeSERV'
			, ''
			, '8559319294'
			, 1
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Association] WHERE [AssociationName] = 'Phoenix REALTORS' AND MLSID = 1)
BEGIN

	INSERT dbo.[Association] (
				[AssociationId]
				, [MLSID]
				, [FlexId]
				, [AssociationName]
				, [Address]
				, [Phone]
				, [Active])
	VALUES(
			36
			, 1
			, '20080624134934677441000000'
			, 'Phoenix REALTORS'
			, '5033 N. 19th Ave., Ste 119, Phoenix, AZ 85015'
			, '6022461012'
			, 1
		)
END