CREATE PROCEDURE dbo.usp_C_Order_Violation
(
	@OrderData dbo.OrderData READONLY
	, @OrderLineItems dbo.OrderLineItems READONLY
	, @OrderViolations dbo.OrderViolations READONLY
)
AS
/************************************************************************************************************************************
*						usp_C_Order_Violation
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
*	0002		RCM		19 May 2020		Added section to ensure there exists a subscription account number to log the GL records
*
************************************************************************************************************************************/

	declare @CreatedByEntityId int;
	declare @PaidViolationsJSON nvarchar(2000);
	declare @PaidViolationStatus varchar(20) = 'Paid';
	declare @OrderNumber int;

	DECLARE @ViolationProdType INT = 1;
	DECLARE @BasePackageProdType INT = 2;
	DECLARE @AddOnPackageProdType INT = 3;
	DECLARE @PackageContentProdType INT = 4;
	DECLARE @RefundProdType INT = 5;
	DECLARE @AppAccessProdType INT = 6;
	DECLARE @BasePackNonUpgradeProdType INT = 7;
	DECLARE @BasePackageOfficeStaffProdType INT = 8;

	declare @OrderType varchar(40);
	declare @SubscriberEntityId int;
	declare @TransactionJournalJSON nvarchar(2000);
	declare @SubscriptionAccountName varchar(100);
	declare @SubscriptionAccountTypeId smallint;
	declare @SubscriptionAcctNum int;
	declare @TransactionType varchar(30);
	declare @PaymentType varchar(20);
	declare @OrderTotal money;


	-- constant productIds
	DECLARE @AppealProductId INT = 204;
	DECLARE @ViolationDiscountProductId INT = 203;
	DECLARE @ViolationOtherProductId INT = 201;

	declare @ViolationProducts TABLE (ProductId int, Quantity int, ProductTypeId smallint);

		-- No Subscription or GL is written for failed orders, no money was collected
			IF NOT EXISTS(SELECT FailureReason FROM @OrderData) OR (SELECT FailureReason FROM @OrderData) IS NULL
			BEGIN
				-- we write GL and Subscription Data for the incoming order
				select @CreatedByEntityId = CreatedByEntityId, @OrderNumber = OrderNumber from @OrderData;

				SELECT @PaidViolationsJSON = (SELECT
													CAST([ViolationId] as int) as [id], 
													@PaidViolationStatus as [violationStatus], 
													@OrderNumber as [orderNumber] 
												FROM 
													@OrderViolations
												FOR JSON PATH, ROOT('violation'))

				exec dbo.usp_CU_Violation @PaidViolationsJSON;
			
			-- Setup Violation Products table
			INSERT @ViolationProducts
					(
						ProductId
						,Quantity
						,ProductTypeId
					)
					SELECT 
						ProductId,
						1,
						ProductTypeId
					FROM 
						@OrderLineItems  
					WHERE 
						ProductTypeId = @ViolationProdType;

					IF (SELECT IT.[AtlasMemberType] FROM dbo.Individual AS I INNER JOIN dbo.IndividualType as IT ON IT.IndividualTypeId = I.IndividualTypeId AND IT.MLSID = I.MLSID INNER JOIN @OrderData OD ON OD.SoldToEntityId = I.EntityId) = 'Agent'
						BEGIN
							
							-- Ordering by AccountNumber to grab the first one. It is created when the Individual account is created
							SELECT TOP(1) @SubscriptionAcctNum = act.AccountNo FROM fin.Accounts act INNER JOIN @OrderData OD ON OD.SoldToEntityId = act.EntityId ORDER BY act.AccountNo;

							-- New section to ensure GL account exists .  This occurs when fines are assessed against Affiliate and Affiliate Key member  types
							IF @SubscriptionAcctNum IS NULL OR @SubscriptionAcctNum = 0
							BEGIN

								SELECT @SubscriptionAccountName = CONCAT(ind.Firstname, ' ', ind.LastName) 
										FROM dbo.Individual ind
										WHERE ind.EntityId = @SubscriberEntityId;

									SELECT @SubscriptionAccountTypeId = aty.AccountTypeId FROM fin.AccountType aty WHERE aty.AccountTypeDescription = 'Subscriber' AND MlsId = 1;

									EXEC @SubscriptionAcctNum = dbo.usp_C_GlAccount @EntityId = @SubscriberEntityId, @AccountTypeId = @SubscriptionAccountTypeId, @AccountDescription = @SubscriptionAccountName;

							END
							
							SET @TransactionType = 'Fines'

							SELECT @OrderNumber = OrderNumber, @PaymentType = PaymentType, @OrderTotal = OrderTotal FROM @OrderData;

							SELECT @TransactionJournalJSON = (
										SELECT 
											@SubscriptionAcctNum [accountNo], 
											@OrderNumber as [orderNumber], 
											@PaymentType as [paymentMethod], 
											@OrderTotal as [transactionTotal],
											@TransactionType as [transactionType],
											(SELECT
													lines.accountNo as [accountNo],
													SUM(lines.amount) as [amount]
												FROM
													(SELECT 
															li.AccountNumber AS [accountNo], 
															(@OrderTotal / (SELECT COUNT(*) FROM @ViolationProducts)) as [amount] -- More than one line item can exist for a fine
													FROM 
															@OrderLineItems as li
													) as lines
													GROUP BY
															lines.accountNo
												FOR JSON PATH) as [details]
										FOR JSON PATH, without_array_wrapper);

							exec usp_C_Transaction @TransactionJournalJSON;
						END
					END

				---- if it contains a appeal or discount item need to update the line item cost and description
					IF EXISTS (SELECT * FROM Orders.OrderLineItem li inner join @OrderData OD ON OD.OrderNumber = li.OrderNumber
								 WHERE li.ProductId IN (@AppealProductId, @ViolationDiscountProductId, @ViolationOtherProductId))
					BEGIN
						UPDATE ordl 
							SET ordl.ProductDisplayName = prd.ProductName + ': ' + SUBSTRING(vim.ProductDescription, 1,230)
							, ordl.Price = vim.Amount
							, ordl.ExtendedPrice = vim.Amount 
						FROM 
							Orders.OrderLineItem ordl
						INNER JOIN [Catalog].Products prd ON 
							prd.ProductId = ordl.ProductId
						INNER JOIN dbo.Violation vio ON 
							vio.OrderNumber = ordl.OrderNumber
						INNER JOIN dbo.ViolationItem vim ON 
							vim.ViolationId = vio.ViolationId 
						AND vim.ProductId IN (@AppealProductId, @ViolationDiscountProductId, @ViolationOtherProductId)
						INNER JOIN @OrderData OD ON 
							OD.OrderNumber = ordl.OrderNumber
						WHERE	
							ordl.ProductId IN (@AppealProductId, @ViolationDiscountProductId, @ViolationOtherProductId) 

						-- if appeal need to mark parent as pending appeal 
						IF EXISTS (SELECT * FROM @OrderLineItems li WHERE ProductId = @AppealProductId)
						BEGIN

							UPDATE 
								pvio 
							SET 
								pvio.ViolationStatusTypeId = 2 
							FROM 
								dbo.Violation pvio 
							INNER JOIN dbo.Violation avio ON 
								avio.ParentViolationId = pvio.ViolationId
							INNER JOIN @OrderData OD ON
								OD.OrderNumber = avio.OrderNumber

						END 

					END

GO

GRANT EXECUTE ON dbo.usp_C_Order_Violation TO [Atlas];
GO