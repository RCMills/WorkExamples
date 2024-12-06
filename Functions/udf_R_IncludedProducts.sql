CREATE FUNCTION [dbo].[udf_R_IncludedProducts]
(
	@ProductId int
)
RETURNS @returntable TABLE
(
	ProductId int,
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
	;with SubscriptionProducts(ProductId, ProductDisplayName, ProductDescription, ProductLaunchURL, ProductImage, ProductIcon, [Priority], DisplayOrder, SsoClientId)
	AS(
			SELECT 
				 p1.ProductId as [productId]
				,p1.ProductDisplayName as [productDisplayName]
				,p1.ProductDescription as [productDescription]
				,p1.ProductLaunchURL as [productLaunchURL]
				,p1.ProductImage as [productImage]
				,p1.ProductIcon as [productIcon]
				,p1.[Priority] as [priority]
				,p1.DisplayOrder as [displayOrder]
				,p1.SsoClientId AS [ssoClientId]
			FROM 
				[Catalog].Products as p1 
			WHERE
				p1.ParentProductId = @ProductId

			UNION ALL

			SELECT 
				 p1.ProductId as [productId]
				,p1.ProductDisplayName as [productDisplayName]
				,p1.ProductDescription as [productDescription]
				,p1.ProductLaunchURL as [productLaunchURL]
				,p1.ProductImage as [productImage]
				,p1.ProductIcon as [productIcon]
				,p1.[Priority] as [priority]
				,p1.DisplayOrder as [displayOrder]
				,p1.SsoClientId AS [ssoClientId]
			FROM 
				[Catalog].Products as p1 
			INNER JOIN SubscriptionProducts as SP ON
				SP.ProductId = P1.ParentProductId
			WHERE
				p1.IsActive = 0x01 

	)

		INSERT @returntable(
			ProductId,
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
			ProductDisplayName,
			ProductDescription,
			ProductLaunchURL,
			ProductImage,
			ProductIcon,
			[Priority],
			DisplayOrder,
			SsoClientId
		FROM
			SubscriptionProducts
		ORDER BY
			[Priority] ASC, DisplayOrder ASC;

	-- If the product passed in is NOT a bundle, then return only the product passed in. 

	IF @@ROWCOUNT = 0
	BEGIN

		INSERT @returntable(
			ProductId,
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
			ProductDisplayName,
			ProductDescription,
			ProductLaunchURL,
			ProductImage,
			ProductIcon,
			[Priority],
			DisplayOrder,
			SsoClientId
		FROM
			Catalog.Products
		WHERE
			ProductId = @ProductId;

	END

	RETURN
END