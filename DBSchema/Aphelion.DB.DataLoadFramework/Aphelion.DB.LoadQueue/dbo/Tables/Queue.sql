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
    Date			Modifier			Version		Reason  
    --------		----------			--------	-------  
	12 June 2014	Geoffrey Smith		1.1			Add StatusMessage column to store error message
      

**********************************************************************************************/

CREATE TABLE [dbo].[Queue]
(
	[QueueID] INT NOT NULL PRIMARY KEY IDENTITY, 
	[SchedulerID]		BIGINT NULL, --if queued by scheduler
    [QueueLoadTypeID]	INT NOT NULL, --package or cubes processing
	[StatusID]          INT NOT NULL,
	[StatusMessage]     NVARCHAR(4000) NULL,
	[PackageLoadID]		INT NULL, --if package load
	[IsBatch]             BIT DEFAULT (0) NOT NULL, --if cube process
    [IsBatchComplete]     BIT DEFAULT (0) NOT NULL, --if cube process
    [StartTime]           DATETIME NULL,
    [EndTime]             DATETIME NULL,
	[RunBalancing]			BIT DEFAULT(0) NOT NULL,
	[RunSchemaCompare]		BIT DEFAULT(0) NOT NULL,
	[RunFKChecks]			BIT DEFAULT(0) NOT NULL,
	[sys_CreatedOn]   DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]   NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
	CONSTRAINT [FK_Queue_QueueLoadType] FOREIGN KEY ([QueueLoadTypeID]) REFERENCES [dbo].[QueueLoadType] ([QueueLoadTypeID]),
	CONSTRAINT [FK_Queue_Status] FOREIGN KEY ([StatusID]) REFERENCES [dbo].[Status] ([StatusID]),
	CONSTRAINT [FK_Queue_PackageLoad] FOREIGN KEY ([PackageLoadID]) REFERENCES [dbo].[PackageLoad] ([PackageLoadID])
)
