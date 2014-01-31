/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : Detail of a queue item for cube processing
				   Cube processing - List of tables for processing and partition values
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

CREATE TABLE [dbo].[QueueCubeDetail]
(
	[QueueCubeDetailID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [QueueID] INT NOT NULL ,
    [StatusID] INT NOT NULL, 
	[TableID] INT NULL, 
    [StartPartitionValue] INT NULL, 
    [EndPartitionValue] INT NULL, 
	[StartTime]           DATETIME NULL,
    [EndTime]             DATETIME NULL,
	[sys_CreatedOn]   DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]   NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    CONSTRAINT [FK_QueueCubeDetail_Queue] FOREIGN KEY ([QueueID]) REFERENCES [dbo].[Queue] ([QueueID]),
	CONSTRAINT [FK_QueueCubeDetail_Status] FOREIGN KEY ([StatusID]) REFERENCES [dbo].[Status] ([StatusID]),
	CONSTRAINT [FK_QueueCubeDetail_Table] FOREIGN KEY ([TableID]) REFERENCES [dbo].[Table] ([TableID])
)
