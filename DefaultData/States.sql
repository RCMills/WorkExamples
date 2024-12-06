SET NOCOUNT ON;
SET XACT_ABORT ON;


BEGIN TRANSACTION;

-- Reference Data for State
MERGE INTO [State] AS Target 
USING (VALUES 
	(1, N'Alabama', N'AL'),
	(2, N'Alaska', N'AK'),
	(3, N'Arizona', N'AZ'), 
	(4, N'Arkansas', N'AR'), 
	(5, N'California', N'CA'), 
	(6, N'Colorado', N'CO'), 
	(7, N'Connecticut', N'CT'), 
	(8, N'Delaware', N'DE'), 
	(9, N'Florida', N'FL'), 
	(10, N'Georgia', N'GA'), 
	(11, N'Hawaii', N'HI'), 
	(12, N'Idaho', N'ID'), 
	(13, N'Illinois', N'IL'), 
	(14, N'Indiana', N'IN'), 
	(15, N'Iowa', N'IA'), 
	(16, N'Kansas', N'KS'), 
	(17, N'Kentucky', N'KY'), 
	(18, N'Louisiana', N'LA'),
	(19, N'Maine', N'ME'), 
	(20, N'Maryland', N'MD'), 
	(21, N'Massachusetts', N'MA'), 
	(22, N'Michigan', N'MI' ),
	(23, N'Minnesota', N'MN'), 
	(24, N'Mississippi', N'MS'), 
	(25, N'Missouri', N'MO'), 
	(26, N'Montana', N'MT'), 
	(27, N'Nebraska', N'NE'), 
	(28, N'Nevada', N'NV'), 
	(29, N'New Hampshire', N'NH'), 
	(30, N'New Jersey', N'NJ'), 
	(31, N'New Mexico', N'NM'),
	(32, N'New York', N'NY'),
	(33, N'North Carolina', N'NC'),
	(34, N'North Dakota', N'ND'),
	(35, N'Ohio', N'OH'),
	(36, N'Oklahoma', N'OK'),
	(37, N'Oregon', N'OR'),
	(38, N'Pennsylvania', N'PA'),
	(39, N'Rhode Island', N'RI'),
	(40, N'South Carolina', N'SC'),
	(41, N'South Dakota', N'SD'),
	(42, N'Tennessee', N'TN'),
	(43, N'Texas', N'TX'),
	(44, N'Utah', N'UT'),
	(45, N'Vermont', N'VT'),
	(46, N'Virginia', N'VA'),
	(47, N'Washington', N'WA'),
	(48, N'West Virginia', N'WV'),
	(49, N'Wisconsin', N'WI'),
	(50, N'Wyoming', N'WY'),
	(51, N'Guam', N'GU'),
	(52, N'Puerto Rico', N'PR'),
	(53, N'Virgin Islands', N'VI'),
	(54, N'District of Columbia', N'DC')
) 
AS Source ([StateID], [StateName], [StateShortName]) 
ON Target.StateID = Source.StateID
 --insert new rows 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (StateID, StateName, StateShortName, LoadDate) 
VALUES (StateID, StateName, StateShortName, GetDate()); 

COMMIT;

GO