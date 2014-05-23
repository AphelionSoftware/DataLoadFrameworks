CREATE TABLE [dbo].[sysssislog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[event] [sysname] NOT NULL,
	[computer] [nvarchar](128) NOT NULL,
	[operator] [nvarchar](128) NOT NULL,
	[source] [nvarchar](1024) NOT NULL,
	[sourceid] [uniqueidentifier] NOT NULL,
	[executionid] [uniqueidentifier] NOT NULL,
	[starttime] [datetime] NOT NULL,
	[endtime] [datetime] NOT NULL,
	[datacode] [int] NOT NULL,
	[databytes] [image] NULL,
	[message] [nvarchar](2048) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)


GO

CREATE NONCLUSTERED INDEX [IX_ExecutionsByEnd] ON [dbo].[sysssislog]
(
	[executionid] ASC,
	[computer] ASC
)
INCLUDE ( 	[operator],
	[endtime],
	[source]) 
WHERE ([event]='PackageEnd')
WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)

GO

CREATE NONCLUSTERED INDEX [IX_ExecutionsByStart] ON [dbo].[sysssislog]
(
	[executionid] ASC,
	[computer] ASC
)
INCLUDE ( 	[operator],
	[starttime],
	[source]) 
WHERE ([event]='PackageStart')
WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)