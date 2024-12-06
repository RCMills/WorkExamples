GO
declare @EntityId int;
declare @Username varchar(200) = 'lucyw';

select @EntityId = EntityId from dbo.Individual where UserName = @Username;

IF NOT EXISTS(SELECT * FROM dbo.AppUserRole WHERE AppUserEntityId = @EntityId AND RoleId = 17) AND @EntityId IS NOT NULL
BEGIN

	INSERT dbo.AppUserRole (AppUserEntityId, RoleId) VALUES (@EntityId , 17);

END

SET @Username = 'jsanders';

select @EntityId = EntityId from dbo.Individual where UserName = @Username;

IF NOT EXISTS(SELECT * FROM dbo.AppUserRole WHERE AppUserEntityId = @EntityId AND RoleId = 17) AND @EntityId IS NOT NULL
BEGIN

	INSERT dbo.AppUserRole (AppUserEntityId, RoleId) VALUES (@EntityId , 17);

END