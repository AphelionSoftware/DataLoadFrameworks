CREATE TYPE [dbo].[TableListType] AS TABLE
(
	Name VARCHAR(255) NOT NULL
	, StartPartitionValue VARCHAR(1000)
	, EndPartitionValue VARCHAR(1000)
)
