CREATE TABLE [Balancing].[Reports] (
    [ReportID]         INT        IDENTITY (1, 1) NOT NULL,
    [RunID]            INT        NOT NULL,
    [FunctionalAreaID] INT        NOT NULL,
    [TestID]           INT        NOT NULL,
    [QueryID]          INT        NOT NULL,
    [TestResult]       FLOAT (53) NULL,
    [TestDateTime]     DATETIME   DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ReportID] ASC),
    CONSTRAINT [FK_Reports_FunctionalAreaId] FOREIGN KEY ([FunctionalAreaID]) REFERENCES [Balancing].[FunctionalAreas] ([FunctionalAreaID]),
    CONSTRAINT [FK_Reports_QueryID] FOREIGN KEY ([QueryID]) REFERENCES [Balancing].[Queries] ([QueryID]),
    CONSTRAINT [FK_Reports_TestID] FOREIGN KEY ([TestID]) REFERENCES [Balancing].[Tests] ([TestID]),
    CONSTRAINT [FK_TestId] FOREIGN KEY ([TestID]) REFERENCES [Balancing].[Tests] ([TestID])
);



