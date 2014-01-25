CREATE TABLE [CubeProcessingController].[Job] (
    [ID]                    INT              IDENTITY (1, 1) NOT NULL,
    [ExternalID]            UNIQUEIDENTIFIER NULL, --allow identification by external application if any
	[ExpectedScheduleID]	INT				 NULL, --allow identification by expected schedule
    [ApplicationInstanceID] INT              NOT NULL,
    [IsBatch]               BIT              CONSTRAINT [DF_Job_IsBatch] DEFAULT ((0)) NOT NULL,
    [IsBatchComplete]       BIT              CONSTRAINT [DF_Job_IsBatchComplete] DEFAULT ((0)) NOT NULL,
    [CreatedDate]           DATETIME         NOT NULL,
    [CreatedBy]             VARCHAR (100)    NOT NULL,
    CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Job_ApplicationInstance] FOREIGN KEY ([ApplicationInstanceID]) REFERENCES [CubeProcessingController].[ApplicationInstance] ([ID]),
    CONSTRAINT [FK_Job_ExpectedSchedule] FOREIGN KEY ([ExpectedScheduleID]) REFERENCES [CubeProcessingController].[ExpectedSchedule]([ID])
);

