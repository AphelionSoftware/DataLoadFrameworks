CREATE TABLE [dbo].[ExpectedSchedule]
(
	[ID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ApplicationInstanceID] INT NOT NULL, 
    [IsBatch] BIT NOT NULL, 
	[Name] VARCHAR(100) NOT NULL,
	[Description] VARCHAR(1000) NULL,
    [CreatedBy] VARCHAR(100) NOT NULL, 
    [Frequency] VARCHAR(50) NOT NULL, 
    [Time] TIME NOT NULL, 
    [StartDate] DATETIME NOT NULL, 
    [EndDate] DATETIME NULL, 
    [DayOfWeek] VARCHAR(50) NULL, 
    [DayOfMonth] INT NULL, 
    [DailyFrequency] INT NULL, 
    [DailyFrequencyType] VARCHAR(50) NULL, 
    [LastRunDate] DATETIME NULL, 
    [Active] BIT NOT NULL, 
    CONSTRAINT [FK_ExpectedSchedule_ApplicationInstance] FOREIGN KEY ([ApplicationInstanceID]) REFERENCES [ApplicationInstance]([ID]) 
)
