CREATE PROCEDURE [dbo].[usp_C_Order]
	@OrderNumber int,
	@SoldToEntityId int,
	@OrderDate DateTime,
	@OrderTotal money,
	@PaymentType varchar(20) = 'Credit Card',
	@OrderType varchar(50) = 'Products and Services',
	@RefundType VARCHAR(20) = NULL, -- type of refund: Refund or Partial Refund 
	@OrderStatus varchar(50) = 'Paid',
	@PaymentStatus varchar(50) = 'Paid',
	@CheckNumber VARCHAR(50) = NULL,
	@CheckName VARCHAR(100) = NULL, 
	@Products nvarchar(max), -- array of JSON of the package level items purchased {"products":[{"ProductId": 28, "ProductPrice": 349}, {"ProductId": 11, "ProductPrice": 180}]}
	@Violations nvarchar(max), -- array of JSON of the violations paid with this order {"violations":[1234, 55667]}
	@AuthorizationCode varchar(6) = NULL,
	@CCNumber varchar(8) = NULL,
	@TransactionId varchar(255) = NULL,
	@ReferenceTransactionId varchar(255) = NULL, -- Used for returns only, this would be the original TransactionId
	@ReferenceOrderNumber INT = NULL, -- order number to be used if a refund 
	@CCExpiration varchar(8) = NULL,
	@CCType varchar(50) = NULL,
	@FailureCode varchar(25) = NULL, -- used only for failed credit card transactions and historical purposes
	@FailureReason varchar(255) = NULL, -- used only for failed credit card transactions and historical purposes
	@BillingFirstName varchar(100) = NULL,
	@BillingLastName varchar(100) = NULL,
	@BillingAddress varchar(60) = NULL,
	@BillingCity varchar(40) = NULL,
	@BillingState char(2) = NULL,
	@BillingZip varchar(7) = NULL,
	@BillingPhone varchar(10) = NULL,
	@BillingEmail varchar(100) = NULL, 
	@PurchasedForEntityId INT = NULL,
	@CreatedByEntityId int,
	@BatchId int = NULL
AS

/*************************************************************************************************
*							usp_C_Order
*
*	Purpose: Get A Subscribers order history for ATLAS
*
*	Author: Unknown
*
*	Origination Date: 1 Feb 2018
*
*	History	
*	Revision		By			Date			WorkItem			Change
*	0001			UNKNOWN		UNKNOWN			N/A					Birth
*	0002			CSC			20180724		N/A					Updated to use checknumer VARCHAR(50), 
*																	FName and LName to VARCHAR(100), Added CheckName VARCHAR(100)
*	0003			CSC			20180726		N/A					Added check to make sure refund is not for a refund order
*	0004			CSC			20180808		N/A					Appeal fee update to save amount and notes to the orderlineitem 
*	0005			CSC			2018-813		N/A					Commented out appeal fee section. did not make it into testing in last sprint.
*	0006			CSC			20180827		N/A					Update to mark a violation as pending appeal if order contains appeal
*	0007			CSC			20180902		N/A					Missed comments on the last two updates. Updated appeal area to 
*																	to also update desc and cost on other and discount violation items
*	0008			CSC			20180905		S20.US7				
*	0009			CSC			20180911		S21.US3.T1			Changes for creating new subscriptions 
*	0010			CSC			20181005		S24					Updates for GL changes
*	0011			CSC			20181017		S26					Updates for supporting bought for
*	0012			CSC			20181017		S27					Updates for GL to support account per subscription
*	0013			RCM			2019 Jul 24							Added section to see if this is an upgrade order and set te flag to be passed into pricing function
*	0014			RCM			2019 8 Aug		AD-1931				Added check to ensure sold to is active with association
*	0015			RCM			10 Sept 2019						Refactor Code to simplify 
************************************************************************************************/
DECLARE @Today datetime = current_timestamp;
DECLARE @PaidViolationStatus varchar(50) = 'Paid';
DECLARE @PaidViolationsJSON nvarchar(max);
DECLARE @SubscriberAccountNumber int;
DECLARE @TransactionJournalJSON nvarchar(max);
DECLARE @ErrMsg VARCHAR(MAX);
DECLARE @TransactionType varchar(50);
DECLARE @ViolationProducts OrderViolations;
DECLARE @TimeZone nvarchar(256) = 'US Mountain Standard Time';
DECLARE @ProductsPurchased OrderProducts;
DECLARE @SubEndDate DATETIMEOFFSET;
DECLARE @ProductId INT
DECLARE @SubscriptionPeriod INT; 
DECLARE @RefundAccountNumber INT; 
DECLARE @SubscriptionAcctNum INT, 
		@SubscriptionAccountName VARCHAR(100), 
		@SubscriptionAccountTypeId INT;
DECLARE @RevRecAccountNumb INT;
DECLARE @OrderData dbo.[OrderData];
DECLARE @OrderLineItems dbo.[OrderLineItems];
DECLARE @OrderViolations dbo.[OrderViolations];
DECLARE @LogAll BIT = 0x01;

	DECLARE @ViolationProdType INT = 1;
	DECLARE @BasePackageProdType INT = 2;
	DECLARE @AddOnPackageProdType INT = 3;
	DECLARE @PackageContentProdType INT = 4;
	DECLARE @RefundProdType INT = 5;
	DECLARE @AppAccessProdType INT = 6;
	DECLARE @BasePackNonUpgradeProdType INT = 7;
	DECLARE @BasePackageOfficeStaffProdType INT = 8;

	DECLARE @ErrorMessage nvarchar(2000);
	DECLARE @ErrorNumber int;
	DECLARE @ErrorState int;
	DECLARE @ErrorSeverity int;
	DECLARE @ParametersJSON nvarchar(max);
	DECLARE @ProcName nvarchar(256) = Object_Name(@@ProcId);
	DECLARE @NowAtHere Datetimeoffset = SysDateTimeOffset();

DECLARE @OrderKind varchar(25);
/*
	OrderKind can be 
	'Violation'
	'Subscription'
	'Refund'

*/

		-- create table of all products supplied and get their productId Types
		INSERT @ProductsPurchased 
				(ProductId
				, Quantity
				, ProductTypeId
				, ProductType
				, CatalogPrice
				, GLAccount)
		SELECT 
				pck.productId
				, 1
				, prd.ProductTypeId
				, pt.ProductType
				, pck.productPrice
				, prd.AccountReceivableId 
		FROM OPENJSON (@Products, N'$.products') WITH (ProductId INT, ProductPrice MONEY) as pck
		LEFT JOIN [Catalog].Products prd ON 
			pck.productId = prd.ProductId
		LEFT OUTER JOIN [Catalog].ProductTypes PT ON 
			PT.ProductTypeId = prd.ProductTypeId;

		SELECT @OrderKind = dbo.udf_V_OrderType(@ProductsPurchased);

						IF @LogAll = 0x01
						BEGIN

									SELECT @ParametersJSON = (SELECT 
											@OrderNumber as [orderNumber], 
											@SoldToEntityId as [soldToEntityId], 
											@OrderDate as [orderDate], 
											@OrderTotal as [orderTotal],
											@PaymentType as [paymentType],
											@OrderType as [orderType],
											@RefundType as [refundType],
											@OrderStatus as [orderStatus],
											@PaymentStatus as [paymentStatus],
											@CheckName AS [checkName],
											@CheckNumber as [checkNumber],
											@Products as [products],
											@Violations as [violations],
											@AuthorizationCode as [authorizationCode],
											@CCNumber as [ccNumber],
											@TransactionId as [transactionId],
											@ReferenceTransactionId as [referenceTransactionId],
											@ReferenceOrderNumber as [referenceOrderNumber],
											@CCExpiration as [ccExpiration],
											@CCType as [ccType],
											@FailureCode as [failureCode],
											@FailureReason as [failureReason],
											@BillingFirstName as [billingFirstName],
											@BillingLastName as [billingLastName],
											@BillingAddress as [billingAddress],
											@BillingCity as [billingCity],
											@BillingState as [billingState],
											@BillingZip as [billingZip],
											@BillingPhone as [billingPhone],
											@BillingEmail as [billingEmail],
											@CreatedByEntityId as [createdByEntityId],
											@OrderKind as [orderKind],
											(SELECT 
													ProductId [productId]
													, Price [price]
													, ProductDisplayName [productDisplayName] 
											FROM 
													@OrderLineItems FOR JSON PATH) [lineItems]
											FOR JSON PATH, WITHOUT_ARRAY_WRAPPER);

							INSERT dbo.JSONLogs(StoredProcedure, [JSON], [TimestampUTCOffset]) VALUES (@ProcName, @ParametersJSON, @NowAtHere);
						END



		IF EXISTS(SELECT * FROM @ProductsPurchased PP INNER JOIN [Catalog].Products P ON P.ProductId = PP.ProductId WHERE P.IsActive = 0x00) AND @OrderKind = 'Subscription'
		BEGIN

			SET @ErrMsg = N'One of the packages selected was not available to purchase, please contact customer service.';
			Throw 60000, @ErrMsg, 1;

		END

	-- Check user is allowed to purchase
		IF ((SELECT dbo.udf_V_SubscriberPurchaseAvailable(@SoldToEntityId)) = 0x00 AND @OrderType <> 'Refund')
		BEGIN
		
			SET @ErrMsg = CAST(@SoldToEntityId as nvarchar(10)) +  ' ,or the linked account, is not active with association';
			THROW 60000, @ErrMsg, 1;

		END

	-- Under certain conditions a sold to entityId passed isn't the EntityId we want to use for the order. 
	-- When the EntityId being sent in is linked to another, and the other EntityId was used to purchase the base level subscription, we change the incoming SoldToEntityId to the linked Account Entity
	-- So the orders are all contained under a single EntityId.  
	-- We want to be sure the passed in Sold To is the right one

		IF  EXISTS(SELECT ProductTypeId FROM @ProductsPurchased WHERE ProductTypeId IN (@BasePackageProdType, @AddOnPackageProdType))
		BEGIN
			DECLARE @OriginalSoldTo INT;
			

			SELECT 
				@OriginalSoldTo = S.EntityId
			FROM 
				subs.subscriptions S
			cross apply dbo.udf_R_EntityGroup(@SoldToEntityId) grp
			where
				s.IsActive = 0x01
			and s.SubscriptionEndDate >= CAST(GetUtcDate() as datetimeoffset) AT TIME ZONE @TimeZone
			and grp.EntityId = S.EntityId

			IF @OriginalSoldTo IS NOT NULL AND @OriginalSoldTo <> @SoldToEntityId
			BEGIN
			-- Reset the sold to and purchased for Entities
				SELECT @SoldToEntityId = @OriginalSoldTo, @PurchasedForEntityId = @OriginalSoldTo;

			END
		END

		-- Setup Order Data UDT
		INSERT @OrderData(
				OrderNumber,
				SoldToEntityId,
				OrderDate,
				OrderTotal,
				PaymentType,
				OrderType,
				RefundType,
				OrderStatus,
				PaymentStatus,
				CheckNumber,
				CheckName,
				AuthorizationCode,
				CCNumber,
				TransactionId,
				ReferenceTransactionId,
				ReferenceOrderNumber,
				CCExpiration,
				CCType,
				FailureCode,
				FailureReason,
				BillingFirstName,
				BillingLastName,
				BillingAddress,
				BillingCity,
				BillingState,
				BillingZip,
				BillingPhone,
				BillingEmail,
				CreatedByEntityId,
				PurchasedForEntityId,
				BatchId)
			VALUES(
				@OrderNumber,
				@SoldToEntityId,
				@OrderDate,
				@OrderTotal,
				@PaymentType,
				@OrderType,
				@RefundType,
				@OrderStatus,
				@PaymentStatus,
				@CheckNumber,
				@CheckName,
				@AuthorizationCode,
				@CCNumber,
				@TransactionId,
				@ReferenceTransactionId,
				@ReferenceOrderNumber,
				@CCExpiration,
				@CCType,
				@FailureCode,
				@FailureReason,
				@BillingFirstName,
				@BillingLastName,
				@BillingAddress,
				@BillingCity,
				@BillingState,
				@BillingZip,
				@BillingPhone,
				@BillingEmail,
				@CreatedByEntityId,
				@PurchasedForEntityId,
				@BatchId);
	
		-- setup order line items UDT
		-- insert into lineitems table variable all items purchased
		declare @TempLineitems TABLE(
																ProductId int,
																ParentProductId int,
																ProductDisplayName varchar(100),
																Price money,
																SubscriptionPeriod smallint,
																AccountNumber int,
																ProductTypeId int,
																PurchasedForEntityId int,
																ProductTier tinyint,
																FixedEndDate DATETIMEOFFSET)
		INSERT @TempLineitems
			SELECT
				P.ProductId,
				NULL,
				P.[ProductDisplayName],
				prdp.CatalogPrice [Price],
				P.[SubscriptionPeriod],
				P.AccountReceivableId [AccountNumber],-- This is the account being used 
				P.ProductTypeId, 
				COALESCE(@PurchasedForEntityId, @SoldToEntityId),
				P.ProductTier,
				CAST(p.FixedEndDate AS DATETIMEOFFSET) AT TIME ZONE @TimeZone
			FROM
				[Catalog].[Products] as P
			INNER JOIN @ProductsPurchased  AS prdp ON
				prdp.ProductId = P.ProductId;
			
		INSERT @TempLineitems
			SELECT 
				cprd.ProductId, 
				oln.ProductId, 
				cprd.ProductDisplayName, 
				cprd.Price [Price], 
				cprd.SubscriptionPeriod, 
				cprd.AccountReceivableId [AccountNumber],	 
				cprd.ProductTypeId,
				COALESCE(@PurchasedForEntityId, @SoldToEntityId),
				cprd.ProductTier,
				CAST(cprd.FixedEndDate AS DATETIMEOFFSET) AT TIME ZONE @TimeZone
			FROM 
				@TempLineitems oln
			INNER JOIN Catalog.PackageContents pkgc ON oln.ProductId = pkgc.PackageProductId
			INNER JOIN Catalog.Products cprd ON pkgc.ContentProductId = cprd.ProductId;


		INSERT 
			@OrderLineItems (
						OrderNumber
						, OrderLineItem
						, ProductId
						, ParentProductId
						, ProductDisplayName
						, Price
						, SubscriptionPeriod
						, AccountNumber
						, ProductTypeId
						, PurchasedForEntityId
						, ProductTier
						, SubscriptionEndDate)
			SELECT
				@OrderNumber as [OrderNumber]
				,Row_Number() OVER (PARTITION BY @OrderNumber ORDER BY Lines.ParentProductId, Lines.Price DESC,  Lines.ProductId) AS [OrderLineItem]
				,lines.ProductId
				,lines.ParentProductId
				,lines.ProductDisplayName
				,CASE WHEN @OrderType = 'Refund' THEN @OrderTotal ELSE lines.Price END AS [Price] -- This override must occur for Refund (partial or full) AND the refund line item is #10, there is only one!
				,lines.SubscriptionPeriod
				,CASE WHEN @OrderType = 'Refund' THEN NULL ELSE lines.AccountNumber END as [AccountNumber]
				,lines.ProductTypeId
				,lines.PurchasedForEntityId
				,lines.ProductTier
				,lines.FixedEndDate
			FROM
				@TempLineItems as lines;

-- Adding logging for usp_C_Order to capture all the variables when pricing does not match the order total, and it should. 

		IF (SELECT SUM(Price) FROM @OrderLineItems) <> @OrderTotal
		BEGIN
			
			-- Log the order to the JSON logs

			SELECT @ParametersJSON = (SELECT 
											@OrderNumber as [orderNumber], 
											@SoldToEntityId as [soldToEntityId], 
											@OrderDate as [orderDate], 
											@OrderTotal as [orderTotal],
											@PaymentType as [paymentType],
											@OrderType as [orderType],
											@RefundType as [refundType],
											@OrderStatus as [orderStatus],
											@PaymentStatus as [paymentStatus],
											@CheckName AS [checkName],
											@CheckNumber as [checkNumber],
											@Products as [products],
											@Violations as [violations],
											@AuthorizationCode as [authorizationCode],
											@CCNumber as [ccNumber],
											@TransactionId as [transactionId],
											@ReferenceTransactionId as [referenceTransactionId],
											@ReferenceOrderNumber as [referenceOrderNumber],
											@CCExpiration as [ccExpiration],
											@CCType as [ccType],
											@FailureCode as [failureCode],
											@FailureReason as [failureReason],
											@BillingFirstName as [billingFirstName],
											@BillingLastName as [billingLastName],
											@BillingAddress as [billingAddress],
											@BillingCity as [billingCity],
											@BillingState as [billingState],
											@BillingZip as [billingZip],
											@BillingPhone as [billingPhone],
											@BillingEmail as [billingEmail],
											@CreatedByEntityId as [createdByEntityId],
											@OrderKind as [orderKind],
											(SELECT 
													ProductId [productId]
													, Price [price]
													, ProductDisplayName [productDisplayName] 
											FROM 
													@OrderLineItems FOR JSON PATH) [lineItems]
											FOR JSON PATH, WITHOUT_ARRAY_WRAPPER);

			INSERT dbo.JSONLogs(StoredProcedure, [JSON], [TimestampUTCOffset]) VALUES (@ProcName, @ParametersJSON, @NowAtHere);

		END
/*
	OrderKind can be 
	'Violation'
	'Subscription'
	'Refund'

*/

	begin try
	
		begin tran	

--		select * from @OrderData;
--		select * from @OrderLineItems;
		-- Write the order data
			exec usp_C_Order_WriteOrder @OrderData = @OrderData;
			exec usp_C_Order_WriteLineItems @OrderLineItems = @OrderLineItems;

		-- Depending on the order kind, do certain other things
			if @OrderKind = 'Subscription'
			begin

				exec usp_C_Order_Subscription @OrderData = @OrderData, @OrderLineItems = @OrderLineItems;

			End

			if @OrderKind = 'Refund'
			BEGIN

				-- check to make sure order being refund was not a refund order
					IF EXISTS(
							SELECT * FROM Orders.[Order] ord 
							INNER JOIN Orders.OrderType ordt ON ord.OrderType = ordt.OrderTypeId
							WHERE ord.OrderNumber = @ReferenceOrderNumber AND ordt.OrderType = 'Refund')
						BEGIN 
							SET @ErrMsg = 'Refund is not allowed for refund type orders';
							THROW 60000, @ErrMsg, 1;							 
						END
					-- check that not more than one line item was passed in for refunds
					IF (SELECT COUNT(*) FROM OPENJSON(@Products, N'$.products')) <> 1 
						BEGIN 
							SET @ErrMsg = 'Refund has more or less than one line item.';
							THROW 60000, @ErrMsg, 1;							 
						END
					
					-- check that the refund type provided is valid 
					IF NOT EXISTS(SELECT * FROM [Orders].[OrderStatus] WHERE [OrderStatus] = @RefundType AND [OrderStatus] LIKE '%refund%')
						BEGIN 
							SET @ErrMsg = 'Refund type provided is not valid: ' + COALESCE(@RefundType, 'None Provided');
							THROW 60000, @ErrMsg, 1;
						END;

					-- checking that the reference order is valid and in a status of paid
					IF NOT EXISTS(SELECT * FROM [Orders].[Order] WHERE [OrderNumber] = @ReferenceOrderNumber AND [OrderStatusTypeId] IN (1, 5)) 
						BEGIN
							SET @ErrMsg = 'Reference Order Number not valid. Either not found or not valid Order Status of Paid for refund: '
									+ COALESCE(CAST(@ReferenceOrderNumber AS VARCHAR(20)), 'No Reference Order Number Provided');
							THROW 60000, @ErrMsg, 1;
						END;

					-- checking that the reference order payment is paid
					IF NOT EXISTS(SELECT * FROM [Orders].[OrderPayment] WHERE [OrderNumber] = @ReferenceOrderNumber AND [PaymentStatusTypeId] = 1) 
						BEGIN
							SET @ErrMsg = 'Reference Order Payment status is not valid for a refund. Not paid status.'
									+ COALESCE(CAST(@ReferenceOrderNumber AS VARCHAR(20)), 'No Reference Order Number Provided');
							THROW 60000, @ErrMsg, 1;
						END;

					-- checking to make sure the amount provided for the refund is not more than original transaction 
					IF (SELECT TOP(1) op.Amount FROM Orders.OrderPayment op WHERE op.OrderNumber = @ReferenceOrderNumber ORDER BY op.OrderNumber) < @OrderTotal
						BEGIN
							SET @ErrMsg = 'Refund Amount is more than orignal transaction amount. Amount Provided: ' + CAST(@OrderTotal as VARCHAR(20));
							THROW 60000, @ErrMsg, 1;
						END
				
					-- if we get past all the checks update previous transaction 
					UPDATE [ord] 
					SET 
						[ord].[OrderStatusTypeId] = os.[OrderStatusTypeId]
						, [ord].[LastModifiedByEntityId] = @CreatedByEntityId
						, [ord].[LastModifiedDateTime] = @Today
					FROM [Orders].[Order] [ord] 
					INNER JOIN [Orders].[OrderStatus] os ON os.[OrderStatus] = @RefundType
					WHERE ord.OrderNumber = @ReferenceOrderNumber;

				exec usp_C_Order_Refund @OrderData = @OrderData, @OrderLineItems = @OrderLineItems;

			end

			if @OrderKind = 'Violation'
			begin

				INSERT @OrderViolations (ViolationId) (SELECT v.[Value] FROM OPENJSON(@Violations, '$.violations') v)

				exec usp_C_Order_Violation @OrderData = @OrderData, @OrderLineItems = @OrderLineItems, @OrderViolations = @OrderViolations;

			end

		COMMIT TRAN

	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT <> 0 ROLLBACK TRAN;

			SELECT @ParametersJSON = (SELECT 
											@OrderNumber as [orderNumber], 
											@SoldToEntityId as [soldToEntityId], 
											@OrderDate as [orderDate], 
											@OrderTotal as [orderTotal],
											@PaymentType as [paymentType],
											@OrderType as [orderType],
											@RefundType as [refundType],
											@OrderStatus as [orderStatus],
											@PaymentStatus as [paymentStatus],
											@CheckName AS [checkName],
											@CheckNumber as [checkNumber],
											@Products as [products],
											@Violations as [violations],
											@AuthorizationCode as [authorizationCode],
											@CCNumber as [ccNumber],
											@TransactionId as [transactionId],
											@ReferenceTransactionId as [referenceTransactionId],
											@ReferenceOrderNumber as [referenceOrderNumber],
											@CCExpiration as [ccExpiration],
											@CCType as [ccType],
											@FailureCode as [failureCode],
											@FailureReason as [failureReason],
											@BillingFirstName as [billingFirstName],
											@BillingLastName as [billingLastName],
											@BillingAddress as [billingAddress],
											@BillingCity as [billingCity],
											@BillingState as [billingState],
											@BillingZip as [billingZip],
											@BillingPhone as [billingPhone],
											@BillingEmail as [billingEmail],
											@CreatedByEntityId as [createdByEntityId]
											FOR JSON PATH);

			INSERT dbo.JSONLogs(StoredProcedure, [JSON], [TimestampUTCOffset]) VALUES (@ProcName, @ParametersJSON, @NowAtHere);



		IF ERROR_NUMBER() > 50000
			THROW;
		ELSE
		BEGIN
			SELECT @ErrorNumber = ERROR_NUMBER(), @ErrorState = ERROR_STATE(), @ErrorSeverity = ERROR_SEVERITY();

			SELECT @ErrorMessage = ERROR_MESSAGE() +  N'An error has occured in ' + COALESCE(@ProcName, '') + N'. The transaction has been rolled back. ' + ERROR_MESSAGE() ;

			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
		END
	END CATCH

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_C_Order] TO [Atlas]
    AS [dbo];

