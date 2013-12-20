CREATE TABLE [Balancing].[Queries] (
    [QueryId]      INT           IDENTITY (1, 1) NOT NULL,
    [DataSourceId] INT           NULL,
    [QueryName]    VARCHAR (200) NULL,
    [QueryText]    VARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([QueryId] ASC),
    CONSTRAINT [FK_DataSourceId] FOREIGN KEY ([DataSourceId]) REFERENCES [Balancing].[DataSources] ([DataSourceId])
);

