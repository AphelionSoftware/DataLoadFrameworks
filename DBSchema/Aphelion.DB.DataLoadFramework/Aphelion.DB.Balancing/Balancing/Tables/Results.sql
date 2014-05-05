CREATE TABLE [Balancing].[Results] (
    [RunID]        INT        NOT NULL,
    [ResultID]     INT        IDENTITY (1, 1) NOT NULL,
    [QueryID]      INT        NOT NULL,
    [TestResult]   FLOAT (53) NULL,
    [TestDateTime] DATETIME   CONSTRAINT [DF__Results__TestDat__1DE57479] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ResultID] PRIMARY KEY CLUSTERED ([ResultID] ASC),
    CONSTRAINT [FK_Results_QueryID] FOREIGN KEY ([QueryID]) REFERENCES [Balancing].[Queries] ([QueryID]),
    CONSTRAINT [FK_Results_Run] FOREIGN KEY ([RunID]) REFERENCES [Balancing].[Run] ([RunID])
);





