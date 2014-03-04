CREATE PROCEDURE [dbo].[GetPackageLoadStep]
	   @intQueueID		INT
	 , @intStepOrder	INT
	 , @intStream		INT = NULL
AS

/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : Get PackageLoadStep details for package iterator
				   Sequential returns single result
				   Parallel returns all parallel packages for the parallel stream
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
--exec [dbo].[GetPackageLoadStep] 1, 1

BEGIN
	SET NOCOUNT ON

	DECLARE @intMaxParallel	INT

	IF @intStream IS NULL --sequential
	BEGIN
		SELECT P.PackageName
			 , P.PackageFullName
			 , PLS.ContinueOnFailure
		FROM [Queue]			AS Q
		JOIN PackageLoad		AS PL
			ON Q.PackageLoadID = PL.PackageLoadID
		JOIN PackageLoadStep	AS PLS
			ON PL.PackageLoadID = PLS.PackageLoadID
			AND PLS.Active = 1
		JOIN Package			AS P
			ON PLS.PackageID = P.PackageID
		WHERE Q.QueueID = @intQueueID
		  AND PLS.StepOrder = @intStepOrder
	END
	IF @intStream IS NOT NULL --parallel
	BEGIN
		SELECT @intMaxParallel = PL.MaxParallel
		FROM [Queue]		AS Q
		JOIN PackageLoad	AS PL
			ON Q.PackageLoadID = PL.PackageLoadID

		SELECT SRC.PackageName
			 , SRC.PackageFullName
			 , SRC.ContinueOnFailure
		FROM (SELECT (ROW_NUMBER() OVER(ORDER BY PLS.PackageLoadStepID) % @intMaxParallel) AS Stream
				   , P.PackageName
				   , P.PackageFullName
				   , PLS.ContinueOnFailure
			  FROM [Queue]			AS Q
			  JOIN PackageLoad		AS PL
				  ON Q.PackageLoadID = PL.PackageLoadID
			  JOIN PackageLoadStep	AS PLS
				  ON PL.PackageLoadID = PLS.PackageLoadID
				  AND PLS.Active = 1
			  JOIN Package			AS P
				  ON PLS.PackageID = P.PackageID
			  WHERE Q.QueueID = @intQueueID
			    AND PLS.StepOrder = @intStepOrder
			 ) AS SRC
		WHERE SRC.Stream = @intStream
	END
END