CREATE VIEW [SSIS].[vwLatestQueueExecutions]
AS
/* This has a lower cost than the correspondingly simpler looking query in comments, due to use of filtered indexes on records with PackageStart and PackageEnd*/
SELECT 
	StartLog.computer
	, StartLog.operator
	,StartLog.executionid
	, StartLog.starttime
	, EndLog.endtime
	, DATEDIFF(s, StartLog.starttime, EndLog.endtime) RunTimeSeconds
	,  DATEDIFF(s, StartLog.starttime, EndLog.endtime) / 60 RunTimeMinutes
	, StartLog.[source] StartSource
, EndLog.[source] EndSource
FROM dbo.sysssislog StartLog
INNER JOIN (SELECT TOP 1 
				   executionid AS LatestExecutionID
				 , computer
			FROM dbo.sysssislog
			WHERE [Event] = 'User:PackageStart'
			  AND [Source] = '100_PackageIterator' --This will pick up the last time the controller ran and had a job to process
			GROUP BY computer
				   , executionid
				   , endtime
			ORDER BY endtime DESC
		   ) Latest
	ON StartLog.executionid = Latest.LatestExecutionID
LEFT JOIN dbo.sysssislog EndLog
	ON StartLog.executionid = EndLog.executionid
	AND EndLog.[event] = 'PackageEnd'
WHERE StartLog.[event] ='PackageStart'