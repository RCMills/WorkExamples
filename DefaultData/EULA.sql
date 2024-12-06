IF NOT EXISTS (SELECT * FROM dbo.EULAType)
BEGIN

	INSERT dbo.EULAType (Id, [Description], CreatedDate)
	VALUES (1, 'Admin', CURRENT_TIMESTAMP)

END

IF NOT EXISTS (SELECT * FROM dbo.EULA)
BEGIN

	INSERT
		dbo.EULA(
			Id
			,EULA
			,[TypeId]
			,[MlsId]
			,IsActive
			,CreatedDate)
	VALUES(
			 1
			,'I certify that the Applicant named herein is affiliated with me and meets ALL of the above requirements and therefore is eligible for Administrative Support Access to ARMLS. I certify that the Applicant will be under the immediate supervision of the Sponsor named above, and that I as the MLS Participant am and will continue to be responsible for the action and conduct of both. Further, I agree to notify ARMLS immediately if Applicant remains affiliated with me but becomes ineligible for administrative access. I understand that any violation of the condition of this agreement will result in automatic revocation of access for the Applicant. In such event, in order to maintain Applicantʼs access to the ARMLS system as a ARMLS Subscriber, I agree to pay any and all retroactive MLS Subscriber fees for the current year, plus a $500.00 non-compliance fee, if not by Applicant, plus any other penalties specified in the ARMLS Penalty as amended from time to time.'
			,1
			,1
			,0x01
			,CURRENT_TIMESTAMP
		)

END