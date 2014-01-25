CREATE TABLE [CubeProcessingController].[ErrorLog] (
    [ID]                INT           IDENTITY (1, 1) NOT NULL,
    [ErrorDefinitionID] INT           CONSTRAINT [DF_ErrorLog_ErrorCode] DEFAULT ((2)) NOT NULL,
    [ProcessQueueID]    INT           NOT NULL,
    [Message]           VARCHAR (MAX) NOT NULL,
    [LogTime]           DATETIME      NOT NULL,
    CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ErrorLog_ErrorDefinition] FOREIGN KEY ([ErrorDefinitionID]) REFERENCES [CubeProcessingController].[ErrorDefinition] ([ID]),
    CONSTRAINT [FK_ErrorLog_ProcessQueue] FOREIGN KEY ([ProcessQueueID]) REFERENCES [CubeProcessingController].[ProcessQueue] ([ID])
);

