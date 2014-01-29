CREATE TABLE [Balancing].[DataSources] (
    [DataSourceID]     INT           IDENTITY (1, 1) NOT NULL,
    [DataSourceTypeID] INT           NOT NULL,
    [DataSourceName]   VARCHAR (250) NOT NULL,
    [ConnectionString] VARCHAR (500) NULL,
    CONSTRAINT [PK_DataSourceID] PRIMARY KEY CLUSTERED ([DataSourceID] ASC),
    CONSTRAINT [FK_DataSourceTypeId] FOREIGN KEY ([DataSourceTypeID]) REFERENCES [Balancing].[DataSourceTypes] ([DataSourceTypeID])
);

