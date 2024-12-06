CREATE procedure dbo.[usp_C_Order_Refund]
(
	@OrderData dbo.[OrderData] READONLY
	, @OrderLineItems dbo.[OrderLineItems] READONLY
)
/************************************************************************************************************************************
*						usp_C_Order_Refund
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
AS

declare @CreatedByEntityId int;
declare @RefundType varchar(20);
declare @OrderNumber int;
declare @ReferenceOrderNumber int;
declare @SoldToEntityId int;
declare @ErrMsg nvarchar(2000);
declare @SubscriberAccountNumber int;
declare @OrderDate datetime;
declare @OrderTotal money;
declare @TransactionJournalJSON nvarchar(2000);
declare @PaymentType varchar(50);
declare @TransactionType varchar(50);

	select 
		@RefundType = RefundType
		, @OrderDate = OrderDate
		, @OrderTotal = OrderTotal
		, @ReferenceOrderNumber = ReferenceOrderNumber
		, @SoldToEntityId = SoldToEntityId
		, @OrderNumber = OrderNumber
		, @TransactionType = 'Refund'
		, @PaymentType = 'Credit Card'
	from @OrderData;


		IF NOT EXISTS(SELECT FailureReason FROM @OrderData) OR (SELECT FailureReason FROM @OrderData) IS NULL
			BEGIN 
		-- calls transaction reversal if a full refund. Other wise use transaction to do partial
				IF @RefundType = 'Refund'
					EXEC usp_U_TransactionReversal @OrderNumber = @ReferenceOrderNumber, @ReversalOrderNumber = @OrderNumber;
				ELSE IF @RefundType = 'Downgrade Refund'
					BEGIN
						-- only do Downgrade Refund on Add-On package types
						DECLARE @DownGradeLineItem INT;

						SELECT @DownGradeLineItem = oli.OrderLineItem 
						FROM Orders.[Order] ord 
						INNER JOIN Orders.OrderLineItem oli ON oli.OrderNumber = ord.OrderNumber
						INNER JOIN Catalog.Products prd ON prd.ProductId = oli.ProductId
						WHERE 
							prd.ProductTypeId = 3
							AND ord.OrderNumber = @ReferenceOrderNumber;

						IF (@DownGradeLineItem IS NULL)
							BEGIN
								SET @ErrMsg = 'No product of Add-On productype was found on the order to downgrade';
								THROW 60000, @ErrMsg, 1;							
							END
						EXEC usp_U_TransactionReversal @OrderNumber = @ReferenceOrderNumber, @ReversalOrderNumber = @OrderNumber, @LineItemToReverse = @DownGradeLineItem;

					END
				ELSE IF @RefundType = 'Partial Refund'

					IF (SELECT IT.[AtlasMemberType] FROM dbo.Individual AS I INNER JOIN dbo.IndividualType as IT ON IT.IndividualTypeId = I.IndividualTypeId AND IT.MLSID = I.MLSID WHERE I.EntityId = @SoldToEntityId) = 'Agent'
					BEGIN
						-- if it is a partial we need to pull the money from accounts created during the order
						-- there could be multipe due to multiple subs being on a order
									
						DECLARE @NumberOfAccounts INT = 0; 
						DECLARE @AccountsTotal MONEY;

						SELECT @NumberOfAccounts = COUNT(*) FROM fin.TransactionHeader WHERE TransactionTypeId = 1 AND OrderNumber = @ReferenceOrderNumber;


						IF (@NumberOfAccounts = 1) 
						BEGIN
						-- Adding a penny to the account balance to ensure the reported amount is fully refundable in the case of a partial refund R MIlls 14 Aug 2019
							SELECT @SubscriberAccountNumber = thd.AccountNo, @AccountsTotal = (SUM(tdt.Amount) + .01)
							FROM fin.TransactionHeader thd
							INNER JOIN fin.TransactionDetail tdt ON tdt.AccountNo = thd.AccountNo
							WHERE thd.TransactionTypeId = 1 AND thd.OrderNumber = @ReferenceOrderNumber AND thd.TransactionDate <= @OrderDate
							GROUP BY thd.AccountNo;

							IF @AccountsTotal < @OrderTotal
							BEGIN
								SET @ErrMsg = 'Refund amount: ' + CAST(@OrderTotal AS VARCHAR(15)) + '  Account Balances: ' + CAST(@AccountsTotal AS VARCHAR(15));
								THROW 60000, @ErrMsg, 1;							
							END
						
							SELECT @TransactionJournalJSON = (
										SELECT 
											@SubscriberAccountNumber [accountNo], 
											@OrderNumber as [orderNumber], 
											@PaymentType as [paymentMethod], 
											-@OrderTotal as [transactionTotal],
											@TransactionType as [transactionType],
											(SELECT 
													@SubscriberAccountNumber AS [accountNo], --> Use the subscriber account 
													-@OrderTotal as [amount]
													FROM 
															@OrderLineItems as li
													FOR JSON PATH) AS [details]
										FOR JSON PATH, without_array_wrapper);

							exec usp_C_Transaction @TransactionJournalJSON;
						END
						ELSE IF (@NumberOfAccounts > 1)
						BEGIN

							DECLARE @AmountLeftToRefund MONEY = @OrderTotal;
							DECLARE @Accounts TABLE (Id int NOT NULL identity(1,1), AccountNumber INT, AvailableBalance MONEY);
							DECLARE @RowToProcess INT, @AccountDeductAmt MONEY, @CurrentAccountToProcess INT
								, @AccountBalance MONEY;

							-- get all the accounts to process and make sure amount greater than 0
							INSERT INTO @Accounts (AccountNumber, AvailableBalance)
							SELECT thd.AccountNo, (SUM(trd.Amount) + .01)
							FROM fin.TransactionHeader thd
							INNER JOIN fin.TransactionDetail trd ON trd.AccountNo = thd.AccountNo
							WHERE 
								thd.OrderNumber = @ReferenceOrderNumber
								AND thd.TransactionTypeId = 1
								AND thd.TransactionDate <= @OrderDate
							GROUP BY thd.AccountNo
							HAVING SUM(trd.Amount) > 0;

							SELECT @NumberOfAccounts = COUNT(*) FROM @Accounts;
							SET @RowToProcess = 0;

							-- need to check that there is enough to cover the refund
							SELECT @AccountsTotal = SUM(AvailableBalance) FROM @Accounts;
							IF @AccountsTotal < @OrderTotal
							BEGIN
								SET @ErrMsg = 'Refund amount: ' + CAST(@OrderTotal AS VARCHAR(15)) + '  Account Balances: ' + CAST(@AccountsTotal AS VARCHAR(15));
								THROW 60000, @ErrMsg, 1;							
							END
							
							----- now work through the accounts and deduct from them 
							WHILE ((@RowToProcess <= @NumberOfAccounts) AND (@AmountLeftToRefund > 0))
							BEGIN
								SET @RowToProcess = @RowToProcess + 1;
								SET @AccountDeductAmt = 0.00;
								SET @CurrentAccountToProcess = 0;

								SELECT 
									@AccountBalance = AvailableBalance 
									, @CurrentAccountToProcess = AccountNumber
								FROM @Accounts 
								WHERE 
									id = @RowToProcess;

								IF (@AmountLeftToRefund < @AccountBalance)
									SET @AccountDeductAmt = @AmountLeftToRefund;
								ELSE
									SET @AccountDeductAmt = @AccountBalance;

								SELECT @TransactionJournalJSON = (
										SELECT 
											@CurrentAccountToProcess [accountNo], 
											@OrderNumber as [orderNumber], 
											@PaymentType as [paymentMethod], 
											-@AccountDeductAmt as [transactionTotal],
											@TransactionType as [transactionType],
											(SELECT 
													@CurrentAccountToProcess AS [accountNo], --> Use the subscriber account 
													-@AccountDeductAmt as [amount]
													FROM 
															@OrderLineItems as li
													FOR JSON PATH) AS [details]
										FOR JSON PATH, without_array_wrapper);

								EXEC usp_C_Transaction @TransactionJournalJSON;

								SET @AmountLeftToRefund = @AmountLeftToRefund - @AccountDeductAmt;

							END
						END
					END
				END