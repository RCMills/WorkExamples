
GO
IF NOT EXISTS(SELECT * FROM [case].Department WHERE DepartmentDescription = 'Support')
BEGIN
	
	INSERT [case].Department(DepartmentId, DepartmentDescription, V1Prefix, V2Prefix, Icon) VALUES (1, 'Support', 'fa-', 'fas', 'headset');

END
GO
IF NOT EXISTS(SELECT * FROM [case].Department WHERE DepartmentDescription = 'Data Integrity')
BEGIN
	
	INSERT [case].Department(DepartmentId, DepartmentDescription, V1Prefix, V2Prefix, Icon) VALUES (2, 'Data Integrity', 'fa-', 'fas', 'shield-check');

END
GO
IF NOT EXISTS(SELECT * FROM [case].Department WHERE DepartmentDescription = 'Finance')
BEGIN
	
	INSERT [case].Department(DepartmentId, DepartmentDescription, V1Prefix, V2Prefix, Icon) VALUES (3, 'Finance', 'fa-', 'fas', 'sack-dollar');

END
GO
IF NOT EXISTS(SELECT * FROM [case].Department WHERE DepartmentDescription = 'Brand')
BEGIN
	
	INSERT [case].Department(DepartmentId, DepartmentDescription, V1Prefix, V2Prefix, Icon) VALUES (4, 'Brand', 'fa-', 'fas', 'handshake');

END
GO
IF NOT EXISTS(SELECT * FROM [case].Department WHERE DepartmentDescription = 'WIRE Data')
BEGIN
	
	INSERT [case].Department(DepartmentId, DepartmentDescription, V1Prefix, V2Prefix, Icon) VALUES (5, 'WIRE Data', 'fa-', 'fas', 'info-square');

END
GO
IF NOT EXISTS(SELECT * FROM [case].Department WHERE DepartmentDescription = 'Outreach')
BEGIN
	
	INSERT [case].Department(DepartmentId, DepartmentDescription, V1Prefix, V2Prefix, Icon) VALUES (6, 'Outreach', 'fa-', 'fas', 'hands-helping');

END
GO
