CREATE TABLE [Balancing].[QueryTestMap]
(
	[QueryTestMapID] INT IDENTITY (1,1) NOT NULL PRIMARY KEY, 
    [TestID] INT NULL, 
    [QueryID] INT NULL, 
    CONSTRAINT [FK_QueryTestMap_Tests] FOREIGN KEY (TestID) REFERENCES Balancing.Tests(TestID), 
    CONSTRAINT [FK_QueryTestMap_Queries] FOREIGN KEY (QueryID) REFERENCES Balancing.Queries(QueryID)
)
