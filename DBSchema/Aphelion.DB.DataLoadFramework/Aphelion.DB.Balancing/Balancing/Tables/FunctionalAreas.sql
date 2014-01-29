CREATE TABLE [Balancing].[FunctionalAreas] (
    [FunctionalAreaID]   INT           IDENTITY (1, 1) NOT NULL,
    [FunctionalAreaName] VARCHAR (300) NOT NULL,
    CONSTRAINT [PK_FunctionalAreaID] PRIMARY KEY CLUSTERED ([FunctionalAreaID] ASC)
);

