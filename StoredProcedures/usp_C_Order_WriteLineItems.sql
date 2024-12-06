CREATE PROCEDURE dbo.usp_C_Order_WriteLineItems
(
	@OrderLineItems dbo.[OrderLineItems] READONLY
)
AS
/************************************************************************************************************************************
*						usp_C_Order_WriteLineItems
*
*	Purpose: Write Line Items for a given order
*
*	Author: Robert Mills
*
*	Origination Date: 6 Sept 2019
*
*	History:
*	Revision	By		Date			Change
*	0001		RCM		6 Sept 2019		Birth
*
*
************************************************************************************************************************************/


		INSERT
				Orders.OrderLineItem(
					OrderNumber,
					OrderLineItem,
					ProductId,
					ParentProductId,
					ProductDisplayName,
					Price,
					Discount,
					ExtendedPrice,
					Tax,
					PurchasedForEntityId)
			SELECT
					lines.OrderNumber 
					,lines.OrderLineItem 
					,lines.ProductId
					,lines.ParentProductId
					,lines.ProductDisplayName
					,lines.Price
					,0 
					,lines.Price
					,0
					,lines.PurchasedForEntityId
			FROM
				@OrderLineItems as lines;