CREATE TABLE [CubeProcessingController].[ExpectedScheduleDetail]
(
	[ID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ExpectedScheduleID] INT NOT NULL, 
    [TableID] INT NOT NULL, 
    [StartPartitionValue] VARCHAR(1000) NULL, 
    [EndPartitionValue] VARCHAR(1000) NULL, 
    CONSTRAINT [FK_ExpectedScheduleDetail_ExpectedSchedule] FOREIGN KEY ([ExpectedScheduleID]) REFERENCES [CubeProcessingController].[ExpectedSchedule]([ID]), 
    CONSTRAINT [FK_ExpectedScheduleDetail_Table] FOREIGN KEY ([TableID]) REFERENCES [CubeProcessingController].[Table]([ID])
)
