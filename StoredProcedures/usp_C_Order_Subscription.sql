create procedure dbo.usp_C_Order_Subscription
(
	@OrderData dbo.[OrderData] READONLY,
	@OrderLineItems dbo.[OrderLineItems] READONLY
)
AS

/************************************************************************************************************************************
*						usp_C_Order_Subscription
*
*	Purpose: Generate an order for a subscription (new or renewal)
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

declare @CreatedByEntityId int;

	DECLARE @ViolationProdType INT = 1;
	DECLARE @BasePackageProdType INT = 2;
	DECLARE @AddOnPackageProdType INT = 3;
	DECLARE @PackageContentProdType INT = 4;
	DECLARE @RefundProdType INT = 5;
	DECLARE @AppAccessProdType INT = 6;
	DECLARE @BasePackNonUpgradeProdType INT = 7;
	DECLARE @BasePackageOfficeStaffProdType INT = 8;

	DECLARE @OrderLineCount INT, @CurrentLineNumber INT;
	
	declare @GLLineItems dbo.[OrderLineItems];
	declare @OrderType varchar(40);
	declare @SubscriberEntityId int;
	declare @TransactionJournalJSON nvarchar(2000);
	declare @SubscriptionAccountName varchar(100);
	declare @SubscriptionAccountTypeId smallint;
	declare @SubscriptionAcctNum int;
	declare @TransactionType varchar(30);
	declare @OrderNumber int;
	declare @PaymentType varchar(20);
	declare @OrderTotal money;
	declare @OrderDate datetime;

	select 
		@OrderType = OrderType
		, @OrderTotal = OrderTotal
		, @SubscriberEntityId = ISNULL(PurchasedForEntityId, SoldToEntityId) 
		, @OrderNumber = OrderNumber
		, @PaymentType = PaymentType
		, @OrderDate = OrderDate
	from 
		@OrderData;

		-- No Subscription or GL is written for failed orders, no money was collected
			IF NOT EXISTS(SELECT FailureReason FROM @OrderData) OR (SELECT FailureReason FROM @OrderData) IS NULL
			BEGIN
				-- we write GL and Subscription Data for the incoming order
				select @CreatedByEntityId = CreatedByEntityId from @OrderData;

	--			select *, @CreatedByEntityId [createdByEntityId], @OrderDate [Orderdate] from @OrderData

				exec usp_C_Order_WriteSubscription @OrderLineItems, @CreatedByEntityId, @OrderDate = @OrderDate;

				-- does the order include subscription items to apply GL trans for
				IF (SELECT IT.[AtlasMemberType] FROM dbo.Individual AS I INNER JOIN dbo.IndividualType as IT ON IT.IndividualTypeId = I.IndividualTypeId AND IT.MLSID = I.MLSID WHERE I.EntityId = @SubscriberEntityId) = 'Agent'
						BEGIN
							
							-- Need to go through the order line items
							
							SELECT @OrderLineCount = MAX(oli.OrderLineItem) FROM @OrderLineItems oli

							SET @CurrentLineNumber = 0;
							
							WHILE @CurrentLineNumber <= @OrderLineCount
							BEGIN
								SET @CurrentLineNumber = @CurrentLineNumber + 1;
								
								-- create gl account for each of the items on the order that are subscriptions 

								IF EXISTS (SELECT * FROM @OrderLineItems oli WHERE oli.OrderLineItem = @CurrentLineNumber AND oli.ProductTypeId IN (@BasePackageProdType, @BasePackNonUpgradeProdType, @BasePackageOfficeStaffProdType, @AddOnPackageProdType))
								BEGIN

									SELECT @SubscriptionAccountName = CONCAT(ind.Firstname, ' ', ind.LastName) 
										FROM dbo.Individual ind
										WHERE ind.EntityId = @SubscriberEntityId;

									SELECT @SubscriptionAccountTypeId = aty.AccountTypeId FROM fin.AccountType aty WHERE aty.AccountTypeDescription = 'Subscriber' AND MlsId = 1;

									EXEC @SubscriptionAcctNum = dbo.usp_C_GlAccount @EntityId = @SubscriberEntityId, @AccountTypeId = @SubscriptionAccountTypeId, @AccountDescription = @SubscriptionAccountName;
							
									SET @TransactionType = 'Subscriber Revenue';

									SELECT @TransactionJournalJSON = (
											SELECT 
												@SubscriptionAcctNum as [accountNo], 
												@OrderNumber as [orderNumber], 
												@CurrentLineNumber as [orderLineItem],
												@PaymentType as [paymentMethod], 
												(SELECT Price 
													FROM @OrderLineItems 
													WHERE OrderLineItem = @CurrentLineNumber) AS [transactionTotal],
												@TransactionType as [transactionType],
													(SELECT -- There will be only one line item :)
														@SubscriptionAcctNum AS [accountNo], 
														SUM(li.Price) as [amount]
													FROM 
														@OrderLineItems as li
													WHERE
														li.ProductTypeId IN (@BasePackageProdType, @AddOnPackageProdType, @BasePackageOfficeStaffProdType) AND li.OrderLineItem = @CurrentLineNumber
													GROUP BY OrderNumber
													FOR JSON PATH) as [details]
											FOR JSON PATH, without_array_wrapper);

										EXEC dbo.usp_C_Transaction @transactionJSON = @TransactionJournalJSON;
								END
							END
						END
					END