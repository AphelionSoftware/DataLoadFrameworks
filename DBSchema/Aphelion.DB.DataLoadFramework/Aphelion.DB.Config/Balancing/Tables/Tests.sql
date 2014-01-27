CREATE TABLE [Balancing].[Tests] (
    [TestID]             INT           IDENTITY (1, 1) NOT NULL,
    [TestName] VARCHAR(300) NULL, 
	[FunctionalAreaID]            INT           NOT NULL,
    [ExpectedResult]     VARCHAR (MAX) NULL,
    [ExpectedResultText] VARCHAR (MAX) NULL,
    
    PRIMARY KEY CLUSTERED ([TestID] ASC),
    CONSTRAINT [FK_FunctionalAreaID] FOREIGN KEY ([FunctionalAreaID]) REFERENCES [Balancing].FunctionalAreas ([FunctionalAreaID])
);

