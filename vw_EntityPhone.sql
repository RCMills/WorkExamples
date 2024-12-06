CREATE view [dbo].[vw_EntityPhone]
as

select p.EntityID
, ct.ContactTypeID
, ct.ContactType
, p.PhonesID AS [PhoneID]
, p.Phone
, p.IsPrimary
from dbo.Phones p
join dbo.ContactType ct
	on p.ContactTypeID = ct.ContactTypeID