/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : Types of queue entries - data load, cube processing etc.
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

CREATE TABLE [dbo].[QueueLoadType]
(
	[QueueLoadTypeID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [QueueLoadTypeName] VARCHAR(100) NOT NULL, 
    [QueueLoadTypeDescription] VARCHAR(500) NULL,
	[sys_CreatedOn]   DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]   NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  NVARCHAR (255) DEFAULT ('Unknown') NOT NULL
)
