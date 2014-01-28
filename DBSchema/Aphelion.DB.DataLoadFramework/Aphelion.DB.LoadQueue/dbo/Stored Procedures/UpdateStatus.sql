-- =============================================
-- Author:		Geoffrey Smith Aphelion
-- Create date: 29 November 2013
-- Description:	Update status of process or entire job
-- =============================================
CREATE PROCEDURE [dbo].[UpdateStatus]
	  @intProcessQueueID	INT
	, @intJobID				INT
	, @bitIsBatch			BIT
	, @intStatus			INT
AS

/*
-1	Busy
0	Queued
1	Complete
2	Failed
*/

BEGIN
	SET NOCOUNT ON

	--status - processing
	--set start time
	IF @intStatus = -1
	BEGIN
		IF @bitIsBatch = 1
			UPDATE [dbo].ProcessQueue 
			SET StatusID = @intStatus
			  , StartTime = CURRENT_TIMESTAMP
			WHERE JobID = @intJobID
		ELSE
			UPDATE [dbo].ProcessQueue 
			SET StatusID = @intStatus
			  , StartTime = CURRENT_TIMESTAMP
			WHERE ID = @intProcessQueueID
	END
	--status - complete
	--set end time
	ELSE IF @intStatus = 1
	BEGIN
		IF @bitIsBatch = 1
			UPDATE [dbo].ProcessQueue 
			SET StatusID = @intStatus
			  , EndTime = CURRENT_TIMESTAMP
			WHERE JobID = @intJobID
		ELSE
			UPDATE [dbo].ProcessQueue 
			SET StatusID = @intStatus
			  , EndTime = CURRENT_TIMESTAMP
			WHERE ID = @intProcessQueueID
	END
	ELSE
	BEGIN
		IF @bitIsBatch = 1
			UPDATE [dbo].ProcessQueue 
			set StatusID = @intStatus
			WHERE JobID = @intJobID
		ELSE
			UPDATE [dbo].ProcessQueue 
			SET StatusID = @intStatus 
			WHERE ID = @intProcessQueueID
	END

END