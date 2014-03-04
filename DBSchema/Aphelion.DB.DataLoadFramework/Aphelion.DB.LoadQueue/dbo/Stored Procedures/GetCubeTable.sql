CREATE PROCEDURE [dbo].[GetCubeTable]
	   @intQueueID			INT
	 , @bitIsPartitioned	BIT
AS

/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : Get list of cube tables for processing as well as partition details
				   Either partitioned or non-partitioned tables
				   Only retuns tables for processing
    Author       : Geoffrey Smith Aphelion Software
    Date         : 12 Feb 2014
    Version      : 1.0
    Referenced By: 
    References   : 
    ------------------------------------------------------------------------------------------  

           
    History:  
    --------  
    Date       Modifier    Version  Reason  
    --------   ----------  -------- -------  

      

**********************************************************************************************/
--exec [dbo].[GetCubeTable] 1, 1

BEGIN
	SET NOCOUNT ON

	IF @bitIsPartitioned = 0
	BEGIN
		SELECT CT.CubeTableName
			 , CAST(NULL AS VARCHAR(100))	AS PartitionName
			 , CAST(NULL AS VARCHAR(100))	AS PartitionQuery
		FROM [Queue]			AS Q
		JOIN QueueCubeDetail	AS QCD
			ON Q.QueueID = QCD.QueueID
		JOIN CubeTable			AS CT
			ON QCD.CubeTableID = CT.CubeTableID
		WHERE Q.QueueID = @intQueueID
		  AND CT.IsPartitioned = @bitIsPartitioned
	END
	ELSE IF @bitIsPartitioned = 1
	BEGIN
		SELECT CT.CubeTableName
			 , CT.CubeTableName
			   + '_' 
			   + CONVERT(VARCHAR(50),QCD.StartPartitionValue)
			   + '_'
			   + CONVERT(VARCHAR(50),QCD.EndPartitionValue)		AS PartitionName
			 , 'SELECT * FROM ' + CT.TableName 
			   + ' WHERE ' + CT.PartitionColumn + ' >= ' + CONVERT(VARCHAR(50),QCD.StartPartitionValue)
			   + ' AND ' + CT.PartitionColumn + ' <= ' + CONVERT(VARCHAR(50),QCD.EndPartitionValue)			AS PartitionQuery
		FROM [Queue]			AS Q
		JOIN QueueCubeDetail	AS QCD
			ON Q.QueueID = QCD.QueueID
		JOIN CubeTable			AS CT
			ON QCD.CubeTableID = CT.CubeTableID
		WHERE Q.QueueID = @intQueueID
		  AND CT.IsPartitioned = @bitIsPartitioned
	END
END