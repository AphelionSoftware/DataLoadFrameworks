/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : Detail of a queue item.
				   Data load - List of packages for the load in order of execution
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

CREATE TABLE [dbo].[QueueDetail]
(
	[QueueDetailID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [QueueID] INT NOT NULL ,
    [StatusID] INT NOT NULL, 
	[PackageLoadStepID] INT NULL,
	[TableID] INT NULL, 
    [StartPartitionValue] INT NULL, 
    [EndPartitionValue] INT NULL, 
	[StartTime]           DATETIME NULL,
    [EndTime]             DATETIME NULL,
	[sys_CreatedOn]   DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]   NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    CONSTRAINT [FK_QueueDetail_Queue] FOREIGN KEY ([QueueID]) REFERENCES [dbo].[Queue] ([QueueID]),
	CONSTRAINT [FK_QueueDetail_Status] FOREIGN KEY ([StatusID]) REFERENCES [dbo].[Status] ([StatusID]),
	CONSTRAINT [FK_QueueDetail_Table] FOREIGN KEY ([TableID]) REFERENCES [dbo].[Table] ([TableID]),
	CONSTRAINT [FK_QueueDetail_PackageLoadStep] FOREIGN KEY ([PackageLoadStepID]) REFERENCES [dbo].[PackageLoadStep] ([PackageLoadStepID])
)
