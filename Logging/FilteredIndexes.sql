-- ==================================================
-- Create index template for SQL Azure Database
-- ==================================================
DROP INDEX IX_ExecutionsByStart on [dbo].[sysssislog]
CREATE INDEX IX_ExecutionsByStart
ON dbo.sysssislog
(
	ExecutionID, Computer
) 
INCLUDE (Operator, Starttime, [Source])
WHERE [Event] = 'PackageStart'

GO 
DROP  INDEX IX_ExecutionsByEnd ON [dbo].[sysssislog]
CREATE INDEX IX_ExecutionsByEnd
ON dbo.sysssislog
(
	ExecutionID, Computer
) 
INCLUDE (Operator, Endtime, [Source])
WHERE[Event] ='PackageEnd'
