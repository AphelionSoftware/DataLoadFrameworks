CREATE TABLE [Balancing].[Reports] (
    [ReportID]         INT           IDENTITY (1, 1) NOT NULL,
    [FunctionalAreaID] INT           NULL,
    [TestID]           INT           NULL,
    [TestResult]       VARCHAR (300) NULL,
    [TestDateTime]     DATETIME      DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ReportID] ASC),
    CONSTRAINT [FK_Reports_FunctionalAreaId] FOREIGN KEY ([FunctionalAreaID]) REFERENCES [Balancing].[FunctionalAreas] ([FunctionalAreaID]),
    CONSTRAINT [FK_TestId] FOREIGN KEY ([TestID]) REFERENCES [Balancing].[Tests] ([TestID])
);

