/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : Schedule
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

CREATE TABLE [dbo].[Schedule] (
    [ScheduleID]                    INT            IDENTITY (1, 1) NOT NULL,
	[ApplicationID]			INT NOT NULL,
	[QueueLoadTypeID]	INT NULL,
    [IsBatch]               BIT            NOT NULL,
    [ScheduleName]                  VARCHAR (100)  NOT NULL,
    [ScheduleDescription]           VARCHAR (1000) NULL,
    [Frequency]             VARCHAR (50)   NOT NULL,
    [Time]                  TIME (7)       NOT NULL,
    [StartDate]             DATETIME       NOT NULL,
    [EndDate]               DATETIME       NULL,
    [DayOfWeek]             VARCHAR (50)   NULL,
    [DayOfMonth]            INT            NULL,
    [DailyFrequency]        INT            NULL,
    [DailyFrequencyType]    VARCHAR (50)   NULL,
    [LastRunDate]           DATETIME       NULL,
    [Active]                BIT      DEFAULT (1)      NOT NULL,
	[sys_CreatedOn]   DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]   NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  NVARCHAR (255) DEFAULT ('Unknown') NOT NULL, 
    CONSTRAINT [PK_Schedule] PRIMARY KEY ([ScheduleID]),
    CONSTRAINT [FK_Schedule_Application] FOREIGN KEY ([ApplicationID]) REFERENCES [dbo].[Application] ([ApplicationID])
);

