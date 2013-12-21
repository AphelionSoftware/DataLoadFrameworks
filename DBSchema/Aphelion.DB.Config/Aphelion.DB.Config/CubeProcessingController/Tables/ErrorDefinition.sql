CREATE TABLE [CubeProcessingController].[ErrorDefinition] (
    [ID]          INT           NOT NULL IDENTITY,
    [Description] VARCHAR (255) NOT NULL,
    [isWarning]   BIT           CONSTRAINT [DF_ErrorDefinition_isWarning] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ErrorDefinition] PRIMARY KEY CLUSTERED ([ID] ASC)
);

