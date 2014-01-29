CREATE TABLE [Balancing].[Queries] (
    [TestID] INT NOT NULL, 
	[DataSourceID] INT NOT NULL,
	[QueryID]      INT IDENTITY (1, 1) NOT NULL,
	[QueryName]    VARCHAR (300) NULL,
    [QueryText]    VARCHAR (MAX) NULL,

    CONSTRAINT [PK_QueryID] PRIMARY KEY CLUSTERED ([QueryID] ASC),
    CONSTRAINT [FK_Queries_DataSourceId] FOREIGN KEY ([DataSourceID]) REFERENCES [Balancing].[DataSources] ([DataSourceID]),
	CONSTRAINT [FK_Queries_TestId] FOREIGN KEY ([TestID]) REFERENCES [Balancing].[Tests] ([TestID]),
	CONSTRAINT [Only_one_query_allowed_per_TestID_per_DataSourceID] UNIQUE (TestID,DatasourceID)
);

