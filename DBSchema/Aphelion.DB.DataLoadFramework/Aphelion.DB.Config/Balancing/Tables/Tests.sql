CREATE TABLE [Balancing].[Tests] (
    [TestId]             INT           IDENTITY (1, 1) NOT NULL,
    [QueryId]            INT           NULL,
    [ExpectedResult]     VARCHAR (MAX) NULL,
    [ExpectedResultText] VARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([TestId] ASC),
    CONSTRAINT [FK_QueryId] FOREIGN KEY ([QueryId]) REFERENCES [Balancing].[Queries] ([QueryId])
);

