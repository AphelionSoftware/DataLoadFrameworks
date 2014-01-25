CREATE TABLE [CubeProcessingController].[Application] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (255) NOT NULL,
    [Description] TEXT          NULL,
    CONSTRAINT [PK_Database] PRIMARY KEY CLUSTERED ([ID] ASC)
);

