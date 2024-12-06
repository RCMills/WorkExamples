CREATE FUNCTION [dbo].[udf_V_OrderType]
(
	 @Products OrderProducts READONLY
)
RETURNS varchar(25)
AS
BEGIN
DECLARE @ViolationProdType INT = 1;
DECLARE @BasePackageProdType INT = 2;
DECLARE @AddOnPackageProdType INT = 3;
DECLARE @PackageContentProdType INT = 4;
DECLARE @RefundProdType INT = 5;
DECLARE @AppAccessProdType INT = 6;
DECLARE @BasePackNonUpgradeProdType INT = 7;
DECLARE @BasePackageOfficeStaffProdType INT = 8;

	
	DECLARE @ReturnValue varchar(25) = '';

	SELECT
		@ReturnValue = CASE		
							WHEN ProductTypeId = @ViolationProdType THEN 'Violation'
							WHEN ProductTypeId IN (@BasePackageProdType, @AddOnPackageProdType, @BasePackageOfficeStaffProdType) THEN 'Subscription'
							WHEN ProductTypeId = @RefundProdType THEN 'Refund'
							END
	FROM
		@Products;


	return @ReturnValue;
END