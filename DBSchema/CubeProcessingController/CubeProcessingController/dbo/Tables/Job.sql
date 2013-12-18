CREATE TABLE [dbo].[Job] (
    [ID]                    INT              IDENTITY (1, 1) NOT NULL,
    [ExternalID]            UNIQUEIDENTIFIER NOT NULL,
    [ApplicationInstanceID] INT              NOT NULL,
    [IsBatch]               BIT              CONSTRAINT [DF_Job_IsBatch] DEFAULT ((0)) NOT NULL,
    [IsBatchComplete]       BIT              CONSTRAINT [DF_Job_IsBatchComplete] DEFAULT ((0)) NOT NULL,
    [CreatedDate]           DATETIME         NOT NULL,
    [CreatedBy]             VARCHAR (100)    NOT NULL,
    CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Job_ApplicationInstance] FOREIGN KEY ([ApplicationInstanceID]) REFERENCES [dbo].[ApplicationInstance] ([ID]),
    CONSTRAINT [UK_Job] UNIQUE NONCLUSTERED ([ExternalID] ASC)
);

