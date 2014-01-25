CREATE TABLE [CubeProcessingController].[Status] (
    [ID]          INT           NOT NULL IDENTITY,
    [Name]        VARCHAR (50)  NOT NULL,
    [Description] VARCHAR (255) NOT NULL,
    CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED ([ID] ASC)
);

