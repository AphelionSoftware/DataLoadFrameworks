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
    [ScheduleID]            INT IDENTITY (1, 1) NOT NULL,
	[ApplicationID]			INT NOT NULL,
    [ScheduleName]          VARCHAR (100)  NOT NULL,
    [ScheduleDescription]   VARCHAR (1000) NULL,
	[QueueLoadTypeID]		BIGINT NULL, --from LoadQueue database (etl or cube processing)
	[PackageLoadID]			BIGINT NULL, --from LoadQueue database
    [IsBatch]               BIT NULL, --for cube processing
    [FrequencyTypeID]       INT NOT NULL, --FrequencyType lookup - Daily, Weekly, Monthly
	[FrequencyInterval]		INT NULL, --Every x days/weeks/months
    [StartTime]             TIME(7) NOT NULL, --time of day that schedule must run or start running
	[EndTime]				TIME(7) NULL, --time of day schedule must stop running if hourly/minutes
    [StartDate]             DATETIME       NOT NULL, --when schedule should be active from
    [EndDate]               DATETIME       NULL, --when schedule should stop being active
    [DayOfWeek]             VARCHAR (50)   NULL, --monday, tuesday, wednesday etc.
    [DayOfMonth]            INT            NULL, --1 - 31
    [RunBalancing]			BIT DEFAULT(0) NOT NULL,
	[RunSchemaCompare]		BIT DEFAULT(0) NOT NULL,
	[RunFKChecks]			BIT DEFAULT(0) NOT NULL,
    [LastRunDate]           DATETIME       NULL,
    [Active]                BIT DEFAULT (1)      NOT NULL,
	[sys_CreatedOn]   DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]   NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  NVARCHAR (255) DEFAULT ('Unknown') NOT NULL, 
    CONSTRAINT [PK_Schedule] PRIMARY KEY ([ScheduleID]),
    CONSTRAINT [FK_Schedule_Application] FOREIGN KEY ([ApplicationID]) REFERENCES [dbo].[Application] ([ApplicationID]),
	CONSTRAINT [FK_Schedule_FrequencyType] FOREIGN KEY ([FrequencyTypeID]) REFERENCES [dbo].[FrequencyType] ([FrequencyTypeID])
);

