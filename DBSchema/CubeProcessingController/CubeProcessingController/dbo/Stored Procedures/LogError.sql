
-- =============================================
-- Author:		Geoffrey Smith Aphelion
-- Create date: 29 November 2013
-- Description:	Log SSIS error
-- =============================================

CREATE procedure [dbo].[LogError] 
	  @intProcessQueueID	INT
	, @intErrorDefinitionID	INT
	, @strMessage			VARCHAR(MAX)

AS
BEGIN

SET NOCOUNT ON

INSERT INTO [dbo].[ErrorLog] ( ErrorDefinitionID
							 , ProcessQueueID
							 , [Message]
							 , LogTime
							 )
SELECT @intErrorDefinitionID
	 , @intProcessQueueID
	 , @strMessage
	 , CURRENT_TIMESTAMP
	 
END
