IF NOT EXISTS(SELECT 1 FROM dbo.OfficeType WHERE OfficeTypeDescription = 'Unknown')
BEGIN

	INSERT dbo.OfficeType (
				OfficeTypeId
				, OfficeTypeDescription
				 )
	VALUES(
			0,
			'Unknown'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.OfficeType WHERE OfficeTypeDescription = 'Affiliate')
BEGIN

	INSERT dbo.OfficeType (
				OfficeTypeId
				, OfficeTypeDescription
				 )
	VALUES(
			1,
			'Affiliate'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.OfficeType WHERE OfficeTypeDescription = 'Appraiser (OfficeType)')
BEGIN

	INSERT dbo.OfficeType (
				OfficeTypeId
				, OfficeTypeDescription
				 )
	VALUES(
			2,
			'Appraiser (OfficeType)'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.OfficeType WHERE OfficeTypeDescription = 'Association')
BEGIN

	INSERT dbo.OfficeType (
				OfficeTypeId
				, OfficeTypeDescription
				 )
	VALUES(
			3,
			'Association'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.OfficeType WHERE OfficeTypeDescription = 'MLS')
BEGIN

	INSERT dbo.OfficeType (
				OfficeTypeId
				, OfficeTypeDescription
				 )
	VALUES(
			4,
			'MLS'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.OfficeType WHERE OfficeTypeDescription = 'MLS Only Branch')
BEGIN

	INSERT dbo.OfficeType (
				OfficeTypeId
				, OfficeTypeDescription
				 )
	VALUES(
			5,
			'MLS Only Branch'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.OfficeType WHERE OfficeTypeDescription = 'MLS Only Firm')
BEGIN

	INSERT dbo.OfficeType (
				OfficeTypeId
				, OfficeTypeDescription
				 )
	VALUES(
			6,
			'MLS Only Firm'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.OfficeType WHERE OfficeTypeDescription = 'MLS Only Office')
BEGIN

	INSERT dbo.OfficeType (
				OfficeTypeId
				, OfficeTypeDescription
				 )
	VALUES(
			7,
			'MLS Only Office'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.OfficeType WHERE OfficeTypeDescription = 'Non Member/Vendor (OfficeType)')
BEGIN

	INSERT dbo.OfficeType (
				OfficeTypeId
				, OfficeTypeDescription
				 )
	VALUES(
			8,
			'Non Member/Vendor (OfficeType)'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.OfficeType WHERE OfficeTypeDescription = 'Realtor Branch Office')
BEGIN

	INSERT dbo.OfficeType (
				OfficeTypeId
				, OfficeTypeDescription
				 )
	VALUES(
			9,
			'Realtor Branch Office'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.OfficeType WHERE OfficeTypeDescription = 'Realtor Firm')
BEGIN

	INSERT dbo.OfficeType (
				OfficeTypeId
				, OfficeTypeDescription
				 )
	VALUES(
			10,
			'Realtor Firm'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.OfficeType WHERE OfficeTypeDescription = 'Realtor Office')
BEGIN

	INSERT dbo.OfficeType (
				OfficeTypeId
				, OfficeTypeDescription
				 )
	VALUES(
			11,
			'Realtor Office'
		)
END

