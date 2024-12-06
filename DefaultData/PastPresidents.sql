
DECLARE @PastPresidents TABLE(Username varchar(200))

INSERT @PastPresidents VALUES
('lh034'),
('wa018'),
('bm001'),
('cg009'),
('db042'),
('df033'),
('dm213'),
('dw058'),
('fc039'),
('gc034'),
('gm042'),
('gw001'),
('js850'),
('km019'),
('lf078'),
('mm053'),
('mo017'),
('np005'),
('ss008'),
('wn002'),
('dy004'),
('sk267'),
('ms464');


MERGE dbo.PastPresidents AS TARGET 
	USING (SELECT Username FROM @PastPresidents)
	AS SOURCE (Username) ON 
		(TARGET.UserName = SOURCE.Username) 
WHEN NOT MATCHED THEN 
			INSERT (Username) 
					VALUES (SOURCE.UserName);

GO