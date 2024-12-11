CREATE FUNCTION dbo.udf_R_CatalogPackageContents
(@ProductId INT)
RETURNS @returntable TABLE
(
	ProductId int,
	ProductName VARCHAR(100),
	ProductDisplayName varchar(255),
	ProductDescription nvarchar(2000),
	ProductLaunchURL nvarchar(2000),
	ProductImage nvarchar(2000),
	ProductIcon nvarchar(2000),
	[Priority] smallint,
	[DisplayOrder] int, 
	[SsoClientId] INT
)
AS

BEGIN

	;WITH PackageProducts(ProductId, ProductName, ProductDisplayName, ProductDescription, ProductLaunchURL, ProductImage, ProductIcon, [Priority], DisplayOrder, SsoClientId)
	AS (
		SELECT 
				p1.ProductId
			,p1.ProductName 
			,p1.ProductDisplayName 
			,p1.ProductDescription 
			,p1.ProductLaunchURL 
			,p1.ProductImage 
			,p1.ProductIcon
			,p1.[Priority] 
			,p1.DisplayOrder 
			,p1.SsoClientId
		FROM 
			[Catalog].Products as p1 
			INNER JOIN Catalog.PackageContents pkc ON p1.ProductId = pkc.ContentProductId
		WHERE
			pkc.PackageProductId = @ProductId
			AND pkc.IsActive = 0x01
			AND pkc.VisibleInPurchase = 0x01
	) INSERT @returntable(
			ProductId,
			ProductName,
			ProductDisplayName,
			ProductDescription,
			ProductLaunchURL,
			ProductImage,
			ProductIcon,
			[Priority],
			[DisplayOrder],
			SsoClientId
			)
		SELECT
			ProductId,
			ProductName,
			ProductDisplayName,
			ProductDescription,
			ProductLaunchURL,
			ProductImage,
			ProductIcon,
			[Priority],
			DisplayOrder,
			SsoClientId
		FROM
			PackageProducts
		ORDER BY
			[Priority] ASC, DisplayOrder ASC;

	-- If the product passed in is NOT a bundle, then return only the product passed in. 

	IF @@ROWCOUNT = 0
		BEGIN

			INSERT @returntable(
				ProductId,
				ProductName,
				ProductDisplayName,
				ProductDescription,
				ProductLaunchURL,
				ProductImage,
				ProductIcon,
				[Priority],
				[DisplayOrder],
				SsoClientId
				)
			SELECT
				ProductId,
				ProductName,
				ProductDisplayName,
				ProductDescription,
				ProductLaunchURL,
				ProductImage,
				ProductIcon,
				[Priority],
				DisplayOrder,
				SsoClientId
			FROM
				[Catalog].Products
			WHERE
				ProductId = @ProductId;
		END

RETURN 
END
