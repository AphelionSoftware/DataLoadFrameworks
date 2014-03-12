CREATE VIEW [SSIS].[vwLatestQueueExecutions]
AS
/* This has a lower cost than the correspondingly simpler looking query in comments, due to use of filtered indexes on records with PackageStart and PackageEnd*/
SELECT 
	StartLog.Computer
	, StartLog.Operator
	,StartLog.ExecutionID
	, StartLog.StartTime
	, EndLog.EndTime
	, DATEDIFF(s, StartLog.StartTime, EndLog.EndTime) RunTimeSeconds
	,  DATEDIFF(s, StartLog.StartTime, EndLog.EndTime) / 60 RunTimeMinutes
	, StartLog.[Source] StartSource
, EndLog.[Source] EndSource
FROM dbo.sysssislog StartLog
INNER JOIN (SELECT TOP 1 
				   ExecutionID AS LatestExecutionID
				 , Computer
			FROM dbo.sysssislog
			WHERE [Event] = 'User:PackageStart'
			  AND [Source] = '100_PackageIterator' --This will pick up the last time the controller ran and had a job to process
			GROUP BY Computer
				   , ExecutionID
				   , endtime
			ORDER BY endtime DESC
		   ) Latest
	ON StartLog.ExecutionID = Latest.LatestExecutionID
LEFT JOIN dbo.sysssislog EndLog
	ON StartLog.ExecutionID = EndLog.ExecutionID
	AND EndLog.[Event] = 'PackageEnd'
WHERE StartLog.[Event] ='PackageStart'