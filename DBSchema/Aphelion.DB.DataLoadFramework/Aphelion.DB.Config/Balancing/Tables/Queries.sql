CREATE TABLE [Balancing].[Queries] (
    [QueryID]      INT           IDENTITY (1, 1) NOT NULL,
    [DataSourceID] INT           NULL,
    [QueryName]    VARCHAR (200) NULL,
    [QueryText]    VARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([QueryID] ASC),
    CONSTRAINT [FK_DataSourceId] FOREIGN KEY ([DataSourceID]) REFERENCES [Balancing].[DataSources] ([DataSourceID])
);

