CREATE TABLE [Balancing].[DataSources] (
    [DataSourceId]     INT           IDENTITY (1, 1) NOT NULL,
    [DataSourceTypeId] INT           NOT NULL,
    [DataSourceName]   VARCHAR (250) NOT NULL,
    [ConnectionString] VARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([DataSourceId] ASC),
    CONSTRAINT [FK_DataSourceTypeId] FOREIGN KEY ([DataSourceTypeId]) REFERENCES [Balancing].[DataSourceTypes] ([DataSourceTypeId])
);

