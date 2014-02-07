/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : List of tables for cube processing
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

CREATE TYPE [dbo].[TableListType] AS TABLE (
    [ID]	BIGINT  NOT NULL,
    [StartPartitionValue] VARCHAR (1000) NULL,
    [EndPartitionValue]   VARCHAR (1000) NULL);

