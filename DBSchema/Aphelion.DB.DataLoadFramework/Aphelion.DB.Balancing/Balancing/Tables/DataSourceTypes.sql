CREATE TABLE [Balancing].[DataSourceTypes] (
    [DataSourceTypeID]   INT           IDENTITY (1, 1) NOT NULL,
    [DataSourceTypeName] VARCHAR (250) NOT NULL,
    CONSTRAINT [PK_DataSourceTypeID] PRIMARY KEY CLUSTERED ([DataSourceTypeID] ASC)
);

