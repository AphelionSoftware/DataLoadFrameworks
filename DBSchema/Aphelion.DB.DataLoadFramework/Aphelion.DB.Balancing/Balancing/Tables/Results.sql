CREATE TABLE [Balancing].[Results] (
    [RunID]            INT        NOT NULL,
    [ResultID]         INT        IDENTITY (1, 1) NOT NULL,
    [FunctionalAreaID] INT        NOT NULL,
    [TestID]           INT        NOT NULL,
    [QueryID]          INT        NOT NULL,
    [TestResult]       FLOAT (53) NULL,
    [TestDateTime]     DATETIME   DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_ResultID] PRIMARY KEY CLUSTERED ([ResultID] ASC),
    CONSTRAINT [FK_Results_FunctionalAreaID] FOREIGN KEY ([FunctionalAreaID]) REFERENCES [Balancing].[FunctionalAreas] ([FunctionalAreaID]),
    CONSTRAINT [FK_Results_QueryID] FOREIGN KEY ([QueryID]) REFERENCES [Balancing].[Queries] ([QueryID]),
    CONSTRAINT [FK_Results_TestID] FOREIGN KEY ([TestID]) REFERENCES [Balancing].[Tests] ([TestID]),
	CONSTRAINT [FK_Results_RunID] FOREIGN KEY ([RunID]) REFERENCES [Balancing].[Run] ([RunID])
);
