/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : Schedule details
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

CREATE TABLE [dbo].[ScheduleDetail] (
    [ScheduleDetailID]                  INT            IDENTITY (1, 1) NOT NULL,
    [ScheduleID]  INT            NOT NULL,
	[PackageLoadStepID]		INT NULL,
    [TableID]             INT            NULL,
    [StartPartitionValue] VARCHAR (1000) NULL,
    [EndPartitionValue]   VARCHAR (1000) NULL,
	[sys_CreatedOn]   DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]   NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    CONSTRAINT [FK_ScheduleDetail_Schedule] FOREIGN KEY ([ScheduleID]) REFERENCES [dbo].[Schedule] ([ScheduleID]), 
    CONSTRAINT [PK_ScheduleDetail] PRIMARY KEY ([ScheduleDetailID])
);

