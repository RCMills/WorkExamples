CREATE PROCEDURE dbo.usp_C_Order_WriteOrder
(
	@OrderData dbo.[OrderData] READONLY
)
AS
/************************************************************************************************************************************
*						usp_C_Order_WriteOrder
*
*	Purpose: Write Order Data
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

declare @Today datetime = current_timestamp;
	
	INSERT 
		Orders.[Order](
				OrderNumber
				,SoldToEntityId
				,OrderDate
				,OrderTotal
				,CreatedByEntityId
				,OrderStatusTypeId
				,OrderType
				,PurchasedForEntityId
				,LastModifiedByEntityId
				,LastModifiedDateTime
				,BatchID
				,ExtendedTotal
				,DiscountTotal
				,TaxTotal
				,ReferenceOrderNumber)
	SELECT
				OrderNumber
				,SoldToEntityId
				,OrderDate
				,OrderTotal
				,CreatedByEntityId
				,OS.OrderStatusTypeId
				,ot.OrderTypeId
				,PurchasedForEntityId
				,CreatedByEntityId
				,@Today
				,BatchID
				,OD.OrderTotal
				, 0
				, 0
				, OD.ReferenceOrderNumber
			FROM
				@OrderData OD
			INNER JOIN orders.OrderStatus OS ON
				OS.OrderStatus = OD.OrderStatus
			INNER JOIN orders.OrderType OT ON
				OT.OrderType = OD.OrderType;

	INSERT
			Orders.[OrderPayment](
					OrderNumber
					,Amount
					,AuthorizationCode
					,PaymentTypeId
					,CheckNumber
					,CheckName
					,CCLast4
					,CCExpiration
					,AccountType
					,TransactionId
					,FailureCode
					,FailureReason
					,FirstName
					,LastName
					,[Address]
					,City
					,[State]
					,Zip
					,Phone
					,Email
					,PaymentStatusTypeId)
		SELECT
					OrderNumber
					,OrderTotal
					,AuthorizationCode
					,pt.PaymentTypeId
					,CheckNumber
					,CheckName
					,CCNumber
					,CCExpiration
					,CCType
					,TransactionId
					,FailureCode
					,FailureReason
					,BillingFirstName
					,BillingLastName
					,BillingAddress
					,BillingCity
					,BillingState
					,BillingZip
					,BillingPhone
					,BillingEmail
					,pst.PaymentStatusTypeId
			FROM
				@OrderData OD
			INNER JOIN [Orders].PaymentType as pt ON
				PT.PaymentType = OD.PaymentType
			INNER JOIN [Orders].PaymentStatusType as pst ON
				PST.PaymentStatus = OD.PaymentStatus;