CREATE TABLE [Balancing].[Reports] (
    [ReportId]         INT           IDENTITY (1, 1) NOT NULL,
    [FunctionalAreaId] INT           NULL,
    [TestId]           INT           NULL,
    [TestResult]       VARCHAR (300) NULL,
    [TestDateTime]     DATETIME      DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ReportId] ASC),
    CONSTRAINT [FK_FunctionalAreaId] FOREIGN KEY ([FunctionalAreaId]) REFERENCES [Balancing].[FunctionalAreas] ([FunctionalAreaId]),
    CONSTRAINT [FK_TestId] FOREIGN KEY ([TestId]) REFERENCES [Balancing].[Tests] ([TestId])
);

