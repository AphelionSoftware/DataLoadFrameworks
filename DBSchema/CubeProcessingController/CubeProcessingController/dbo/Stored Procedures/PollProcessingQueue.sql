
-- =============================================
-- Author:		Geoffrey Smith Aphelion
-- Create date: 29 November 2013
-- Description:	Get job and server details
-- =============================================

CREATE PROCEDURE [dbo].[PollProcessingQueue]
AS

--exec [dbo].[PollProcessingQueue]

BEGIN
	SET NOCOUNT ON;

	DECLARE @intProcessQueueID	INT = -1
		  , @intJobID			INT = -1
		  , @bitIsBatch			BIT = 0
		  , @strCatalog			VARCHAR(100)
		  , @strServer			VARCHAR(100)
		  , @strApplicationName	VARCHAR(255)

	/* Check that there are entries waiting to be processed and that there are no entries currently being processed */
	IF NOT EXISTS (SELECT 1
				   FROM ProcessQueue 
				   WHERE StatusID = -1
				  ) 
	BEGIN
		--batch job will have multiple process queue entries
		SELECT TOP 1 p.ID		AS ProcessQueueID
				   , j.ID		AS JobID
				   , j.IsBatch
				   , ai.CubeServer_Database	AS [Catalog]
				   , ai.CubeServer_Hostname AS [Server]
				   , a.Name					As ApplicationName
		INTO #tmpQ
		FROM ProcessQueue			p
		JOIN Job					j
			ON j.ID = p.JobID
		JOIN ApplicationInstance	ai
			ON j.ApplicationInstanceID = ai.ID
		JOIN [Application]			a
			ON ai.ApplicationID = a.ID
		WHERE ((p.StatusID = 0 
				AND j.IsBatch = 0
			   ) 
			   OR (p.StatusID = 0 
				   AND j.IsBatch = 1 
				   AND j.IsBatchComplete = 1 --if batch then only return queue entries when batch load is complete
				  )
			  )
		ORDER BY p.EnqueuedTime

		IF (@@ROWCOUNT > 0)
		SELECT @intProcessQueueID = ProcessQueueID
			 , @intJobID = JobID
			 , @bitIsBatch = IsBatch
			 , @strCatalog = [Catalog]
			 , @strServer = [Server]
			 , @strApplicationName = ApplicationName
		FROM #tmpQ

		DROP TABLE #tmpQ
		
	END

	SELECT @intProcessQueueID	AS ProcessQueueID
		 , @intJobID			AS JobID
		 , @bitIsBatch			AS IsBatch
		 , @strCatalog			AS [Catalog]
		 , @strServer			AS [Server]
		 , @strApplicationName	AS ApplicationName

END

