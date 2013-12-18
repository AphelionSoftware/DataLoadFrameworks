CREATE TABLE [dbo].[ApplicationInstance] (
    [ID]                            INT           IDENTITY (1, 1) NOT NULL,
    [ApplicationID]                 INT           NOT NULL,
    [ExternalReference]             VARCHAR (255) NOT NULL,
    [Description]                   VARCHAR (255) NOT NULL,
    [CubeServer_Hostname]           VARCHAR (100) NOT NULL,
    [CubeServer_Database]           VARCHAR (100) NOT NULL,
    [CubeServer_CubeName]           VARCHAR (100) NOT NULL,
    [CubeServer_DataSourceViewName] VARCHAR (100) NOT NULL,
    [CubeServer_ConnectionString]   VARCHAR (255) NOT NULL,
    [Admin_Email]                   VARCHAR (255) NOT NULL,
    CONSTRAINT [PK_ApplicationInstance] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ApplicationInstance_Application] FOREIGN KEY ([ApplicationID]) REFERENCES [dbo].[Application] ([ID]),
    CONSTRAINT [UX_ApplicationInstance_External] UNIQUE NONCLUSTERED ([ExternalReference] ASC)
);

