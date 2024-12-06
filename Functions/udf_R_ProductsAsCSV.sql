CREATE FUNCTION dbo.[udf_R_ProductsAsCSV]
(
	@ProductId int
)
RETURNS nvarchar(1000)
AS
BEGIN
RETURN(

		SELECT 
			dbo.[Concatenate](P.ProductName) [Products]
		  FROM [Catalog].[PackageContents] PC
			INNER JOIN [Catalog].Products P ON 
				P.ProductId = PC.ContentProductId
			WHERE
				PC.PackageProductId = @ProductId
			AND P.IsActive = 0x01
			AND PC.VisibleInPurchase = 0x01
			AND P.ProductId != 14 -- Removes 'Mobile apps' from the output

	);
END
GO
