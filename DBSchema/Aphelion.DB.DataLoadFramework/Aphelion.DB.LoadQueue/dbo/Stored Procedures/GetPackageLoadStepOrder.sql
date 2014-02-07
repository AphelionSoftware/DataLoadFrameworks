CREATE PROCEDURE [dbo].[GetPackageLoadStepOrder]
	   @intQueueID		INT
AS

/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : Get PackageLoadStep order grouped by parallel runs
				   Iterate through this to execute the packages in sequence or parallel when possible
    Author       : Geoffrey Smith Aphelion Software
    Date         : 6 Feb 2014
    Version      : 1.0
    Referenced By: 
    References   : 
    ------------------------------------------------------------------------------------------  

           
    History:  
    --------  
    Date       Modifier    Version  Reason  
    --------   ----------  -------- -------  

      

**********************************************************************************************/
--exec [dbo].[GetPackageLoadStepOrder] 1

BEGIN
	SET NOCOUNT ON

	SELECT PL.PackageLoadID
		 , ISNULL(PL.MaxParallel,0) AS MaxParallel
		 , PLS.StepOrder
	FROM [Queue]			AS Q
	JOIN PackageLoad		AS PL
		ON Q.PackageLoadID = PL.PackageLoadID
	JOIN PackageLoadStep	AS PLS
		ON PL.PackageLoadID = PLS.PackageLoadID
		AND PLS.Active = 1
	WHERE Q.QueueID = @intQueueID
	GROUP BY PL.PackageLoadID
		   , PL.MaxParallel
		   , PLS.StepOrder
	ORDER BY PLS.StepOrder

END