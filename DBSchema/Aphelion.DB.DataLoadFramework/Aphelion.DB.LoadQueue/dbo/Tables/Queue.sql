/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : All queue items - data load, cube processing etc.
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

CREATE TABLE [dbo].[Queue]
(
	[QueueID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [QueueLoadTypeID]	INT NOT NULL,
	[StatusID]            INT      NOT NULL,
	[IsBatch]             BIT CONSTRAINT [DF_Job_IsBatch] DEFAULT ((0)) NOT NULL,
    [IsBatchComplete]     BIT CONSTRAINT [DF_Job_IsBatchComplete] DEFAULT ((0)) NOT NULL,
    [StartTime]           DATETIME NULL,
    [EndTime]             DATETIME NULL,
	[sys_CreatedOn]   DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]   NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
	CONSTRAINT [FK_Queue_QueueLoadType] FOREIGN KEY ([QueueLoadTypeID]) REFERENCES [dbo].[QueueLoadType] ([QueueLoadTypeID]),
	CONSTRAINT [FK_Queue_Status] FOREIGN KEY ([StatusID]) REFERENCES [dbo].[Status] ([StatusID])
)
