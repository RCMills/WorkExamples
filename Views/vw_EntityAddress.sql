CREATE view [dbo].[vw_EntityAddress]
as
select ad.EntityID
, ct.ContactTypeID
, ct.ContactType AddressContactType
, ad.AddressesID AS [AddressID]
, ad.AddressLine1
, ad.AddressLine2
, ad.City
, ad.State
, ad.Zip
, ad.County
, ad.IsPrimary
from dbo.Addresses ad
join dbo.ContactType ct
	on ad.ContactTypeID = ct.ContactTypeID