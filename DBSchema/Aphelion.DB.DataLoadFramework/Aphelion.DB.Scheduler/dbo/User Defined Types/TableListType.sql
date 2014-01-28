CREATE TYPE [dbo].[TableListType] AS TABLE (
    [ID]	INT  NOT NULL,
    [StartPartitionValue] VARCHAR (1000) NULL,
    [EndPartitionValue]   VARCHAR (1000) NULL);

