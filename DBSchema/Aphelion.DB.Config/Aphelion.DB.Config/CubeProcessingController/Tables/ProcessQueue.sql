CREATE TABLE [CubeProcessingController].[ProcessQueue] (
    [ID]                  INT      IDENTITY (1, 1) NOT NULL,
    [JobID]               INT      NOT NULL,
    [TableID]             INT      NOT NULL,
    [StatusID]            INT      NOT NULL,
    [StartPartitionValue] INT      NULL,
    [EndPartitionValue]   INT      NULL,
    [EnqueuedTime]        DATETIME NOT NULL,
    [StartTime]           DATETIME NULL,
    [EndTime]             DATETIME NULL,
    CONSTRAINT [PK_Partition] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ProcessQueue_Job] FOREIGN KEY ([JobID]) REFERENCES [CubeProcessingController].[Job] ([ID]),
    CONSTRAINT [FK_ProcessQueue_Status] FOREIGN KEY ([StatusID]) REFERENCES [CubeProcessingController].[Status] ([ID]),
    CONSTRAINT [FK_ProcessQueue_TableDefinition] FOREIGN KEY ([TableID]) REFERENCES [CubeProcessingController].[Table] ([ID])
);

