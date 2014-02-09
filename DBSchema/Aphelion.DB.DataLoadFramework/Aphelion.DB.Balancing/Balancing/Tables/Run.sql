CREATE TABLE [Balancing].[Run] (
    [RunID]   INT           IDENTITY (1, 1) NOT NULL,
    [RunName] VARCHAR (300) NULL,
    [RunTime] DATETIME      NOT NULL,
    CONSTRAINT [PK_RunID] PRIMARY KEY CLUSTERED ([RunID] ASC)
);

