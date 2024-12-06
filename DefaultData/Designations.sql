IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Accredited Buyer''s Representative / ABR')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			1,
			'Accredited Buyer''s Representative / ABR'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Accredited Land Consultant / ALC')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			2,
			'Accredited Land Consultant / ALC'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'At Home With Diversity / AHWD')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			3,
			'At Home With Diversity / AHWD'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Certified Commercial Investment Member / CCIM')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			4,
			'Certified Commercial Investment Member / CCIM'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Certified Distressed Property Expert / CDPE')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			5,
			'Certified Distressed Property Expert / CDPE'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Certified International Property Specialist / CIPS')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			6,
			'Certified International Property Specialist / CIPS'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Certified Property Manager / CPM')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			7,
			'Certified Property Manager / CPM'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Certified Real Estate Brokerage Manager / CRB')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			8,
			'Certified Real Estate Brokerage Manager / CRB'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Certified Real Estate Team Specialist / C-RETS')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			9,
			'Certified Real Estate Team Specialist / C-RETS'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Certified Residential Specialist / CRS')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			10,
			'Certified Residential Specialist / CRS'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Counselor of Real Estate / CRE')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			11,
			'Counselor of Real Estate / CRE'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'e-PRO')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			12,
			'e-PRO'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'General Accredited Appraiser / GAA')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			13,
			'General Accredited Appraiser / GAA'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Graduate, REALTOR Institute / GRI')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			14,
			'Graduate, REALTOR Institute / GRI'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Military Relocation Professional / MRP')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			15,
			'Military Relocation Professional / MRP'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'NAR''s Green Designation / GREEN')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			16,
			'NAR''s Green Designation / GREEN'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Performance Management Network / PMN')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			17,
			'Performance Management Network / PMN'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Pricing Strategy Advisor / PSA')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			18,
			'Pricing Strategy Advisor / PSA'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Real Estate Negotiation Expert / RENE')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			19,
			'Real Estate Negotiation Expert / RENE'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'REALTOR Association Certified Executive / RCE')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			20,
			'REALTOR Association Certified Executive / RCE'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Residential Accredited Appraiser / RAA')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			21,
			'Residential Accredited Appraiser / RAA'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Resort & Second-Home Property Specialist / RSPS')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			22,
			'Resort & Second-Home Property Specialist / RSPS'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Seller Representative Specialist / SRS')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			23,
			'Seller Representative Specialist / SRS'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Seniors Real Estate Specialist / SRES')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			24,
			'Seniors Real Estate Specialist / SRES'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Short Sales & Foreclosure Resource / SFR')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			25,
			'Short Sales & Foreclosure Resource / SFR'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Society of Industrial and Office REALTORS / SIOR')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			26,
			'Society of Industrial and Office REALTORS / SIOR'
		)
END

IF NOT EXISTS(SELECT 1 FROM dbo.[Designation] WHERE DesignationDescription = 'Transnational Referral Certification / TRC')
BEGIN

	INSERT dbo.[Designation] (
				[DesignationID]
				, [DesignationDescription])
	VALUES(
			27,
			'Transnational Referral Certification / TRC'
		)
END

