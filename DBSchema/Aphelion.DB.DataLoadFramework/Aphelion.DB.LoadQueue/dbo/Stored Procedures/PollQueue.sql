CREATE PROCEDURE [dbo].[PollQueue]
AS

/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : Poll Queue table for pending jobs and retrieve server connection details
    Author       : Geoffrey Smith Aphelion Software
    Date         : 28 Jan 2014
    Version      : 1.0
    Referenced By: 
    References   : 
    ------------------------------------------------------------------------------------------  

           
    History:  
    --------  
    Date       Modifier    Version  Reason  
    --------   ----------  -------- -------  

      

**********************************************************************************************/
--exec [dbo].[PollQueue]

BEGIN
	SET NOCOUNT ON

	DECLARE @intQueueID				INT
		  , @strQueueLoadTypeName	VARCHAR(100)
		  , @bitRunBalancing		BIT = 0
		  , @bitRunSchemaCompare	BIT = 0
		  , @bitRunFKChecks			BIT = 0
		  , @intPackageLoadID		INT

	--check that there are entries waiting to be processed and that there are no entries currently being processed
	IF NOT EXISTS (SELECT 1
				   FROM [Queue]
				   WHERE StatusID = -1 --Busy
				  ) 
	BEGIN
		--get queue entry
		SELECT TOP 1
			   @intQueueID = Q.QueueID
			 , @strQueueLoadTypeName = QLT.QueueLoadTypeName
			 , @bitRunBalancing = Q.RunBalancing
			 , @bitRunSchemaCompare = Q.RunSchemaCompare
			 , @bitRunFKChecks = Q.RunFKChecks
		FROM [Queue]			AS Q
		JOIN QueueLoadType		AS QLT
			ON Q.QueueLoadTypeID = QLT.QueueLoadTypeID
		WHERE Q.StatusID = 0 --Queued
		  AND (Q.IsBatch = 0 --not a batch cube processing job
			   OR (Q.IsBatch = 1
				   AND Q.IsBatchComplete = 1 --is a batch cube processing job and batch is complete
				  )
			  )
		ORDER BY Q.sys_CreatedOn --select oldest queue entry that is waiting

		--get application info
		IF @strQueueLoadTypeName = 'package'
		BEGIN
			SELECT TOP 1
				   A.ApplicationID
				 , A.ApplicationName
				 , A.CubeName
				 , A.CubeServer
				 , A.DatabaseName
				 , A.DatabaseServer
				 , A.LogServer
				 , A.LogDatabaseName
				 , A.LogUserName
				 , A.LogPassword
				 , A.TargetMachine
				 , @intQueueID				AS QueueID
				 , @strQueueLoadTypeName	AS QueueLoadTypeName
				 , @bitRunBalancing			AS RunBalancing
				 , @bitRunSchemaCompare		AS RunSchemaCompare
				 , @bitRunFKChecks			AS RunFKChecks
			FROM PackageLoad		AS PL
			JOIN PackageLoadStep	AS PLS
				ON PL.PackageLoadID = PLS.PackageLoadID
			JOIN Package			AS P
				ON PLS.PackageID = P.PackageID
			JOIN [Application]		AS A
				ON P.ApplicationID = A.ApplicationID
			WHERE PL.PackageLoadID = @intPackageLoadID
		END
		ELSE IF @strQueueLoadTypeName = 'cube process'
		BEGIN
			SELECT TOP 1
				   A.ApplicationID
				 , A.ApplicationName
				 , A.CubeName
				 , A.CubeServer
				 , A.DatabaseName
				 , A.DatabaseServer
				 , A.LogServer
				 , A.LogDatabaseName
				 , A.LogUserName
				 , A.LogPassword
				 , A.TargetMachine
				 , @intQueueID				AS QueueID
				 , @strQueueLoadTypeName	AS QueueLoadTypeName
				 , @bitRunBalancing			AS RunBalancing
				 , @bitRunSchemaCompare		AS RunSchemaCompare
				 , @bitRunFKChecks			AS RunFKChecks
			FROM QueueCubeDetail	AS QCD
			JOIN CubeTable			AS CT
				ON QCD.CubeTableID = CT.CubeTableID
			JOIN [Application]		AS A
				ON CT.ApplicationID = A.ApplicationID
			WHERE QCD.QueueID = @intQueueID
		END
		ELSE
		BEGIN
			SELECT 0		AS ApplicationID
				 , NULL		AS ApplicationName
				 , NULL		AS CubeName
				 , NULL		AS CubeServer
				 , NULL		AS DatabaseName
				 , NULL		AS DatabaseServer
				 , NULL		AS LogServer
				 , NULL		AS LogDatabaseName
				 , NULL		AS LogUserName
				 , NULL		AS LogPassword
				 , NULL		AS TargetMachine
				 , NULL		AS QueueID
				 , NULL		AS QueueLoadTypeName
				 , NULL		AS RunBalancing
				 , NULL		AS RunSchemaCompare
				 , NULL		AS RunFKChecks
		END
	END
END