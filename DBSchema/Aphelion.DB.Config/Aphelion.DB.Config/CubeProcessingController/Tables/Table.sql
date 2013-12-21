CREATE TABLE [CubeProcessingController].[Table] (
    [ID]              INT           IDENTITY (1, 1) NOT NULL,
    [ApplicationID]   INT           NOT NULL,
    [DBTableName]     VARCHAR (255) NOT NULL,
    [CubeTableName]   VARCHAR (255) NOT NULL,
    [IsPartitioned]   BIT           CONSTRAINT [DF_TableDefinition_IsPartitioned] DEFAULT ((0)) NOT NULL,
    [PartitionColumn] VARCHAR (50)  NULL,
    CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_TableDefinition_Application] FOREIGN KEY ([ApplicationID]) REFERENCES [CubeProcessingController].[Application] ([ID])
);

