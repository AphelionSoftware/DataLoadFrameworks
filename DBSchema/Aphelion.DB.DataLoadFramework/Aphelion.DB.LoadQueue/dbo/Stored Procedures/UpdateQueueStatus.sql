CREATE PROCEDURE [dbo].[UpdateQueueStatus]
	  @intQueueID		INT
	, @strStatusName	VARCHAR(255)
	, @strStatusMessage	NVARCHAR(4000) = NULL
AS

/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : Update Queue table status value
				   -1 - Busy
				   0 - Queued
				   1 - Complete
				   2 - Failed
    Author       : Geoffrey Smith Aphelion Software
    Date         : 28 Jan 2014
    Version      : 1.0
    Referenced By: 
    References   : 
    ------------------------------------------------------------------------------------------  

           
    History:  
    --------  
    Date			Modifier			Version		Reason  
    --------		----------			--------	-------  
	12 June 2014	Geoffrey Smith		1.1			Add StatusMessage parameter and update
      

**********************************************************************************************/
--exec [dbo].[UpdateQueueStatus] 1, 'Busy'


BEGIN
	SET NOCOUNT ON

	DECLARE @intStatusID	INT

	--get StatusID
	SELECT @intStatusID = StatusID
	FROM [Status]
	WHERE StatusName = @strStatusName

	IF @strStatusName = 'Busy'
	BEGIN
		UPDATE [Queue]
		SET StatusID = @intStatusID
		  , StartTime = CURRENT_TIMESTAMP
		WHERE QueueID = @intQueueID
	END
	ELSE IF @strStatusName = 'Complete' OR @strStatusName = 'Failed'
	BEGIN
		UPDATE [Queue] 
		SET StatusID = @intStatusID
		  , EndTime = CURRENT_TIMESTAMP
		  , StatusMessage = ISNULL(@strStatusMessage,StatusMessage)
		WHERE QueueID = @intQueueID
	END
END