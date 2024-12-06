INSERT [Catalog].Products 
(ProductId, ParentProductId, SKU, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, [SubscriptionPeriod], [InternalUseOnly], AccountReceivableId, ProductTier, ProductLaunchURL, ProductImage, ProductIcon, [Priority], DisplayOrder, SsoClientId)
VALUES 
(1, NULL, NULL, 'MLS Pro Subscription with the Advantage Bundle', 504.00, 'MLS Pro Subscription with the Advantage Bundle', 'The tools in MLS Pro plus our Advantage bundle of 5 elevated products for only $180 more, a savings of almost $1,800 a year off the retail price.', 0x01, 12, 0x00, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, NULL, 'Cloud CMA', 0.00, 'Cloud CMA', 'With Cloud CMA you can easily create CMAs, buyer tours, property reports, and flyers. Every report is branded to you and full of big beautiful photos.', 0x01, NULL, 0x00, NULL, NULL, 'http://cloudcma.com/saml/login/armls', 'cloud_cma.png', 'cloud_cma.svg', 2, 5, 3),
(3, 1, NULL, 'Cloud Streams', 0.00, 'Cloud Streams', 'Cloud Streams keeps your clients updated with auto listing alerts via email and text much faster than other portal options.', 0x01, NULL, 0x00, NULL, NULL, 'http://cloudstreams.net/saml/login/armls', 'cloud_streams.png', 'cloud_streams.svg', 2, 7, 4),
(4, 1, NULL, 'Cloud MLX', 0.00, 'Cloud MLX', 'Effortlessly search for listings, share information with clients and other agents, and access Cloud CMA and Cloud Streams all with Cloud MLX.', 0x01, NULL, 0x00, NULL, NULL, 'http://cloudmlx.com/saml/login/armls', 'cloud-mlx-logo.png', 'cloud_mlx.svg', 2, 6, 5),
(5, 1, NULL, 'MLS Pro Subscription', 324.00, 'MLS Pro Subscription', 'A new name for your 2018 subscriber fees with the tools you’re using today (Flexmls, Monsoon, ShowingTime, etc.).', 0x01, 12, 0x00, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 5, NULL, 'Monsoon', 0.00, 'Monsoon', 'Monsoon is our tax records system using data from The Information Market (TIM). Based in Tempe, TIM has been providing data since 2005.', 0x01, NULL, 0x00, NULL, NULL, 'https://mymonsoon.com', 'monsoon.png', 'monsoon-icon.svg', 2, 2, 6),
(7, 5, NULL, 'Flexmls', 0.00, 'Flexmls', 'Our MLS runs on the Flexmls platform by FBS Data Systems out of Fargo, ND. The system has desktop, mobile and mobile web versions.', 0x01, NULL, 0x00, NULL, NULL, 'https://armls.flexmls.com', 'flexmls-logo.png', 'flexmls-icon.svg', 2, 1, 7),
(8, 5, NULL, 'ShowingTime', 0.00, 'ShowingTime', 'ShowingTime is a showing system that makes scheduling showings easy for everyone. Based in Chicago, ShowingTime is fully integrated into Flexmls.', 0x01, NULL, 0x00, NULL, NULL, 'http://206.27.170.151/ShowingTime', 'showingtime-logo.png', 'showingtime.svg', 2, 3, 8),
(9, NULL, NULL, 'ARMLS Existing User Subscription', 0.00, 'Existing Subscription', 'ARMLS subscription for existing users in the system',  0x00, 12, 0x00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, NULL, 'Refund', 0.00, 'Refund', 'Refund',  0x00, NULL, 0x00, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL),
(11, 1, NULL, 'RapidStats', 0, 'RapidStats', 'RapidStats is a data-driven reporting and analytics tool created by ARMLS that helps agents and brokers understand their markets, pricing and opportunities to make decisions.', 0x01, NULL, 0, NULL, NULL,'https://atlas.armls.com/reporting/dashboard','rapid_stats.png','rapid_stats.svg', 2, 4, NULL),
(12, 1, NULL, 'Remine',0,'Remine','Remine uses data layers to illuminate real estate opportunities with intuitive map-based visualizations and push notifications with actionable intelligence so you can prospect for new buyers and sellers.', 0x01, NULL, 0, NULL, NULL, 'https://armls.remine.com', 'remine-logo.png', 'remine.svg', 2, 8, 9),
(13, 5, NULL, 'AgentSquared', 0, 'AgentSquared', 'AgentSquared creates one-click agent websites and syncs with Flexmls. Unlike an iFrame, AgentSquared is a full website.', 0x01, NULL, 0, NULL, NULL,'http://206.27.170.151/AgentSquared','agentsquared-logo.png','agentsquared.svg', 2, 9, 10),
(14, 5, NULL, 'Mobile apps', 0, 'Mobile apps', 'We will continue to offer multiple mobile options (Flexmls Pro, etc.).', 0x01, NULL, 0, NULL, NULL, NULL,'mobile-apps-logo.png','mobile_apps.svg', 2, 25, 11);


IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Information Leading to Bypass Own Agent')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 101, 'Information Leading to Bypass Own Agent', 200, ' Information Leading to Bypass Own Agent', 'Violation of Rule(s) 11.5 - Information Leading to Bypass Own Agent', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Access Codes in Wrong Field')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 102, 'Access Codes in Wrong Field', 100, 'Access Codes in Wrong Field', 'Violation of Rule(s) 11.5 , 11.8 - Access Codes in Wrong Field', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Buyer''s Agent Bonus in Public Field')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 103, 'Buyer''s Agent Bonus in Public Field', 50, 'Buyer''s Agent Bonus in Public Field', 'Violation of Rule(s) 11.5 - Buyer''s Agent Bonus in Public Field', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Closed Status Incorrect')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 104, 'Closed Status Incorrect', 100, 'Closed Status Incorrect', 'Violation of Rule(s) 8.5 - Closed Status Incorrect', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Closed Status Incorrect (Rental Listing)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 105, 'Closed Status Incorrect (Rental Listing)', 100, 'Closed-Leased Status Incorrect', 'Violation of Rule(s) 8.5 - Closed/Leased Status Incorrect', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Closed Status Incorrect (Response Req.)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 106, 'Closed Status Incorrect (Response Req.)', 100, 'Closed Status Incorrect', 'Violation of Rule(s) 8.5 - Closed Status Incorrect', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Closed Status Incorrect DOM on New Listing')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 107, 'Closed Status Incorrect DOM on New Listing', 100, 'Closed Status Incorrect', 'Violation of Rule(s) 8.5 - Closed Status Incorrect', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Comm Discussion-Invitation Comments')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 108, 'Comm Discussion-Invitation Comments', 200, 'Commission Discussion or Invitation', 'Violation of Rule(s) 11.5 , 12.1 - Commission Discussion or Invitation', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Commission Comments in a Public Field')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 109, 'Commission Comments in a Public Field', 50, 'Commission Comments in a Public Field', 'Violation of Rule(s) 11.5 , 12.1 - Commission Comments in a Public Field', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Commission Cond Comment in Private Field')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 110, 'Commission Cond Comment in Private Field', 200, 'Conditional Commission Comment', 'Violation of Rule(s) 11.5 , 12.1 - Conditional Commission Comment', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Commission Field (zero amount)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 111, 'Commission Field (zero amount)', 200, 'Commission Field', 'Violation of Rule(s) 12.1 - Commission Field', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Contact Info in Media Description-Caption')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 112, 'Contact Info in Media Description-Caption', 200, 'Contact Information in Media Description-Caption', 'Violation of Rule(s) 8.23 - Contact Information in Media Description-Caption', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Contact Info on Photo (Reqs New Photo)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 113, 'Contact Info on Photo (Reqs New Photo)', 200, 'Contact Information on Photo', 'Violation of Rule(s) 8.23 , 8.24 - Contact Information on Photo', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Contact Info in a Public Field')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 114, 'Contact Info in a Public Field', 200, 'Contact Info in a Public Field', 'Violation of Rule(s) 11.5 - Contact Information in a Public Field', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Contact Info on a Photo')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 115, 'Contact Info on a Photo', 200, 'Contact Information on a Photo', 'Violation of Rule(s) 8.23 - Contact Information on a Photo', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'DOM Manipulation')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 116, 'DOM Manipulation', 500, 'Days on Market Manipulation', 'Violation of Rule(s) 8.5 - Days on Market Manipulation', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Email Invalid or Missing')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 117, 'Email Invalid or Missing', 50, 'Email Address', 'Violation of Rule(s) 16.2 - Email Address', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Entity Name in Public Remarks')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 118, 'Entity Name in Public Remarks', 200, 'Entity Name in Public Remarks', 'Violation of Rule(s) 11.6 - Entity Name in Public Remarks', 0x01, 0x01, 2)
	
END

--IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Entity Name in Public Remarks')
--BEGIN

--		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly)
--					VALUES( 119, 'Entity Name in Public Remarks', 200, 'Entity Name in Public Remarks', 'Violation of Rule(s) 11.6 - Entity Name in Public Remarks', 0x01, 0x01)
	
--END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Invalid Dual')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 120, 'Invalid Dual', 50, 'Dual Listing', 'Violation of Rule(s) 8.6 - Dual Listing', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Invalid Listing')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 121, 'Invalid Listing', 200, 'Types of Property', 'Violation of Rule(s) 8.1 - Types of Property', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'List Price')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 122, 'List Price', 50, 'List Price', 'Violation of Rule(s) 8.11 - List Price', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'List Price Per Rental Verbiage')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 123, 'List Price Per Rental Verbiage', 50, 'List Price', 'Violation of Rule(s) 8.11 - List Price', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'No Exterior Photo of Front of Dwelling')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 124, 'No Exterior Photo of Front of Dwelling', 50, 'No Exterior Photo of Front of Dwelling', 'Violation of Rule(s) 8.24 - No Exterior Photo of Front of Dwelling', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Open House-Showing-Auction Info.')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 125, 'Open House-Showing-Auction Info.', 200, ' Open House, Showing, or Auction Information', 'Violation of Rule(s) 11.5 - Open House, Showing, or Auction Information', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Public PDF Doc Contains Buyer''s Agent Bonus')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 126, 'Public PDF Doc Contains Buyer''s Agent Bonus', 50, 'Public PDF Doc Contains Buyer''s Agent Bonus', 'Violation of Rule(s) 11.5 - Public PDF Document Contains Buyer''s Agent Bonus', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Public PDF Doc Contains Commission Comments')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 127, 'Public PDF Doc Contains Commission Comments', 50, 'Public PDF Doc Contains Commission Comments', 'Violation of Rule(s) 11.5 12.1 - Public PDF Document Contains Commission Comments', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Public PDF Doc Contains Contact Info')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 128, 'Public PDF Doc Contains Contact Info', 200, 'Public PDF Doc Contains Contact Info', 'Violation of Rule(s) 8.23 - Public PDF Document Contains Contact Information', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'PDF Doc Contains Title Company Language')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 129, 'PDF Doc Contains Title Company Language', 50, 'PDF Doc Contains Title Company Language', 'Violation of Rule(s) 11.5 - PDF Document Contains Title Company Language', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'PDF Doc Contains Access Code')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 130, 'PDF Doc Contains Access Code', 100, 'PDF Doc Contains Access Code', 'Violation of Rule(s) 11.5, 11.8 - PDF Document Contains Access Code', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Status Incorrect as Pending')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 131, 'Status Incorrect as Pending', 100, 'Listing Status', 'Violation of Rule(s) 10.7, 10.12 - Listing Status', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Photo(s) not of Listed Prop (Reqs Photo)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 132, 'Photo(s) not of Listed Prop (Reqs Photo)', 50, 'No Exterior Photo of Front of Dwelling', 'Violation of Rule(s) 8.24 - No Exterior Photo of Front of Dwelling', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Photo - Copied')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 133, 'Photo - Copied', 200, 'Copied Photo', 'Violation of Rule(s) 8.23 - Copied Photo', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Photo - Copied (Reqs New Photo)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 134, 'Photo - Copied (Reqs New Photo)', 200, 'Copied Photo', 'Violation of Rule(s) 8.23 - Copied Photo', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Public Remarks Inappropriate Use of Field')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 135, 'Public Remarks Inappropriate Use of Field', 200, 'Inappropriate Use of Public Remarks', 'Violation of Rule(s) 11.5, 11.6 - Inappropriate Use of Public Remarks', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Public Remarks - Gaining Access to Prop')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 136, 'Public Remarks - Gaining Access to Prop', 200, 'Inappropriate Use of Public Remarks', 'Violation of Rule(s) 11.6 - Inappropriate Use of Public Remarks', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Selling Agent Incorrect')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 137, 'Selling Agent Incorrect', 500, 'Selling Agent', 'Violation of Rule(s) 8.5 - Selling Agent', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Selling Agent Incorrect - Contact ARMLS')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 138, 'Selling Agent Incorrect - Contact ARMLS', 500, 'Selling Agent', 'Violation of Rule(s) 8.5 - Selling Agent', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Sold Price Incorrect')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 139, 'Sold Price Incorrect', 500, 'Sold Price Incorrect ', 'Violation of Rule(s) 8.5 - Sold Price Incorrect ', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Sold Price Incorrect for Rental Listing')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 140, 'Sold Price Incorrect for Rental Listing', 500, 'Sold Leased Price', 'Violation of Rule(s) 8.5 - Sold Leased Price', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Status Incorrect - Cancel Due to Ownership')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 141, 'Status Incorrect - Cancel Due to Ownership', 100, 'Listing Status', 'Violation of Rule(s) 8.2, 10.2 - Listing Status', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Status Incorrect as Active (UCB or Pend.)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 142, 'Status Incorrect as Active (UCB or Pend.)', 100, 'Listing Status', 'Violation of Rule(s) 10.7 - Listing Status', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Status Incorrect as Active')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 143, 'Status Incorrect as Active', 100, 'Listing Status', 'Violation of Rule(s) 8.2, 10.7, 10.13 - Listing Status', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Status Incorrect as Active (Short Sale)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 144, 'Status Incorrect as Active (Short Sale)', 100, 'Listing Status', 'Violation of Rule(s) 10.7 - Listing Status', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Status Incorrect as Cancelled')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 145, 'Status Incorrect as Cancelled', 100, 'Listing Status', 'Violation of Rule(s) 8.2, 10.7 - Listing Status', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Status Incorrect as Expired')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly,AccountReceivableId)
					VALUES( 146, 'Status Incorrect as Expired', 100, 'Listing Status', 'Violation of Rule(s) 8.2, 10.7 - Listing Status', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Title Company Language')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 147, 'Title Company Language', 50, 'Title Company Language', 'Violation of Rule(s) 11.5 - Title Company Language', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Video Contains Contact Info')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 148, 'Video Contains Contact Info', 200, 'Video Contains Contact Info', 'Violation of Rule(s) 8.23, 8.24 - Video Contains Contact Information', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Virtual Tour - Copied')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 149, 'Virtual Tour - Copied', 200, 'Copied Virtual Tour', 'Violation of Rule(s) 8.23 - Copied Virtual Tour', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Virtual Tour Contains Contact Info')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 150, 'Virtual Tour Contains Contact Info', 200, 'Virtual Tour Contains Contact Information', 'Violation of Rule(s) 8.23, 8.24 - Virtual Tour Contains Contact Information', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Fair Housing Issues')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 151, 'Fair Housing Issues', 200, 'Fair Housing Language', 'Violation of Rule(s) 11.5 - Fair Housing Language', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Status Incorrect as UCB')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 152, 'Status Incorrect as UCB', 100, 'Listing Status', 'Violation of Rule(s) 10.7, 10.8, 10.12 - Listing Status', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Advertising a property without consent of Listing Subscriber')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 153, 'Advertising a property without consent of Listing Subscriber', 200, 'Advertising a property without consent of Listing Subscriber', 'Violation of Rule(s) 10.11 - Advertising a property without consent of Listing Subscriber', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Misuse of Data - Trashed')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 154, 'Misuse of Data - Trashed', 500, 'Misuse of Data that Misleads', 'Violation of Rule(s) 8.5 - Misuse of Data that Misleads', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'PDF Doc Private Cond Commission Comment')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 155, 'PDF Doc Private Cond Commission Comment', 200, 'Conditional Commission Comments', 'Violation of Rule(s) 11.5, 12.1 - Conditional Commission Comments', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Status Incorrect as TOM')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 156, 'Status Incorrect as TOM', 100, 'Listing Status', 'Violation of Rule(s) 8.2, 10.7, 10.13 - Listing Status', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'DOM Manipulation- Contained Wrong Info.')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 157, 'DOM Manipulation- Contained Wrong Info.', 500, 'Days on Market Manipulation', 'Violation of Rule(s) 8.5 - Days on Market Manipulation', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Open House-Showing-Auction on Photo OR in Caption-Description')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 158, 'Open House-Showing-Auction on Photo OR in Caption-Description', 200, 'Open House, Showing, or Auction info on Photo or Other Public Attachment', 'Violation of Rule(s) 11.5 - Open House, Showing, or Auction info on Photo or Other Public Attachment', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Authorization to Use Lockbox  (Level 1)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 159, 'Authorization to Use Lockbox  (Level 1)', 500, 'Authorization to Use Lockbox', 'Level 1 Violation of Rule(s) 13.1 Authorization to Use a Lockbox', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Authorization to Use Lockbox (Level 2)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 160, 'Authorization to Use Lockbox  (Level 2)', 1000, 'Authorization to Use Lockbox', 'Level 2 Violation of Rule(s) 13.1 Authorization to Use a Lockbox', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Removing Keys from the Listed Property  (Level 1)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 161, 'Removing Keys from the Listed Property  (Level 1)', 500, 'Removing Keys from the Listed Property', 'Level 1 Violation of Rule(s) 13.2 Removing Keys from the Listed Property ', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Removing Keys from the Listed Property  (Level 2)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 162, 'Removing Keys from the Listed Property  (Level 2)', 1000, 'Removing Keys from the Listed Property', 'Level 2 Violation of Rule(s) 13.2 Removing Keys from the Listed Property ', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Lockbox Keys - Sharing with a Non- Licensee')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 163, 'Lockbox Keys - Sharing with a Non- Licensee', 2000, 'Lockbox Keys - Sharing with a Non- Licensee', 'Violation of Rule(s) 13.3 Lockbox Keys - Shared with Non-Licensee', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Lockbox Keys - Sharing with another Key Subscriber (Level 1)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 164, 'Lockbox Keys - Sharing with another Key Subscriber  (Level 1)', 500, 'Lockbox Keys - Sharing with another Key Subscriber', 'Level 1 Violation of Rule(s) 13.3 Lockbox Keys - Shared with another Key Subscriber', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Lockbox Keys - Sharing with another Key Subscriber  (Level 2)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 165, 'Lockbox Keys - Sharing with another Key Subscriber  (Level 2)', 1000, 'Lockbox Keys - Sharing with another Key Subscriber', 'Level 2 Violation of Rule(s) 13.3 Lockbox Keys - Shared with another Key Subscriber', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Lockbox Keys - Shared with a Licensee, non Key Subscriber')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 166, 'Lockbox Keys - Shared with a Licensee, non Key Subscriber ', 1000, 'Lockbox Keys - Shared with a Licensee, non Key Subscriber ', 'Violation of Rule(s) 13.3 Lockbox Keys - Shared with Non-Key Susbcriber ', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Use of Lockbox Access  (Level 1)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 167, 'Use of Lockbox Access  (Level 1)', 500, 'Use of Lockbox Access', 'Level 1 Violation of Rule(s) 13.4 - Use of Lockbox Access', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Use of Lockbox Access  (Level 2)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 168, 'Use of Lockbox Access (Level 2)', 1000, 'Use of Lockbox Access', 'Level 2 Violation of Rule(s) 13.4 - Use of Lockbox Access', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Failure of Timely Removal of Lockbox  (Level 1)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 169, 'Failure of Timely Removal of Lockbox (Level 1)', 500, 'Failure of Timely Removal of Lockbox', 'Level 1 Violation of Rule(s) 13.5 - Failure of Timely Removal of Lockbox', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Failure of Timely Removal of Lockbox  (Level 2)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 170, 'Failure of Timely Removal of Lockbox  (Level 2)', 1000, 'Failure of Timely Removal of Lockbox', 'Level 2 Violation of Rule(s) 13.5 - Failure of Timely Removal of Lockbox', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Removal of Lockbox by Unauthorized Indivdiduals  (Level 1)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 171, 'Removal of Lockbox by Unauthorized Indivdiduals  (Level 1)', 500, 'Removal of Lockbox by Unauthorized Indivdiduals', 'Level 1 Violation of Rule(s) 13.6 - Removal of Lockbox by Unauthorized Individuals', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Removal of Lockbox by Unauthorized Indivdiduals  (Level 2)')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 172, 'Removal of Lockbox by Unauthorized Indivdiduals  (Level 2)', 1000, 'Removal of Lockbox by Unauthorized Indivdiduals', 'Level 2 Violation of Rule(s) 13.6 - Removal of Lockbox by Unauthorized Individuals', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Other')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 201, 'Other', 0, 'Other', 'Please specify a description', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Waived')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 202, 'Waived', 0, 'Waived', 'Waived for specific reason', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Discount')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 203, 'Discount', 0, 'Discount', 'Discount -- Please specify a percentage', 0x01, 0x01, 2)
	
END

IF NOT EXISTS(SELECT 1 FROM Catalog.Products WHERE ProductName = 'Appeal Fee')
BEGIN

		INSERT Catalog.Products (ProductId, ProductName, Price, ProductDisplayName, ProductDescription, IsActive, InternalUseOnly, AccountReceivableId)
					VALUES( 204, 'Appeal fee', 0, 'Appeal Fee', 'Appeal Fee -- Please specify an amount', 0x01, 0x01, 2)
	
END