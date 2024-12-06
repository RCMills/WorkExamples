

DELETE
	S 
FROM 
	subs.Subscriptions S 
INNER JOIN dbo.Individual I ON 
	I.EntityId = S.EntityId 
INNER JOIN dbo.IndividualType IT ON 
	IT.IndividualTypeId = I.IndividualTypeId 
AND IT.MLSID = I.MLSID 
WHERE 
	IT.UsesDefaultSubscription = 0x01;
