CREATE TABLE [Balancing].[Errors] (
    [RunID]        INT      NOT NULL,
    [ErrorID]      INT      IDENTITY (1, 1) NOT NULL,
    [QueryID]      INT      NOT NULL,
    [TestDateTime] DATETIME DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_ErrorID] PRIMARY KEY CLUSTERED ([ErrorID] ASC),
    CONSTRAINT [FK_Errors_QueryID] FOREIGN KEY ([QueryID]) REFERENCES [Balancing].[Queries] ([QueryID])
);

