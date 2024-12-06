-- If nothing is in the table, put in a default row
IF NOT EXISTS(SELECT * FROM dbo.QueueAlert)
BEGIN

	INSERT dbo.QueueAlert(Id, QueueDown, QueueUpdatedDate, NotificationDateTime)
	SELECT 1, 0x00, GETUTCDATE(), NULL;

END