CREATE VIEW [SSIS].[vwLatestExecutions]
as
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
INNER JOIN 
	(SELECT MAX(ExecutionID) LatestExecutionID,
	Computer
	FROM dbo.sysssislog
	WHERE  [Event] = 'PackageStart'
	GROUP BY Computer) Latest

	ON StartLog.ExecutionID = Latest.LatestExecutionID
LEFT JOIN dbo.sysssislog EndLog
	ON StartLog.ExecutionID = EndLog.ExecutionID
	AND  EndLog.[Event] = 'PackageEnd'

WHERE StartLog.[Event] ='PackageStart'



/*
SELECT 
	SYSSSISLOG.Computer
	, SYSSSISLOG.Operator
	,LatestExecutionID
	, Min(StartTime) StartTime
	, MAX(EndTime) EndTime
	 , DATEDIFF(s, Min(StartTime), MAX(EndTime)) RunTimeSeconds
		 , DATEDIFF(s, Min(StartTime), MAX(EndTime)) / 60 RunTimeMinutes
FROM dbo.sysssislog
INNER JOIN 
	(SELECT MAX(ExecutionID) LatestExecutionID,
	Computer
	FROM dbo.sysssislog
	WHERE  [Event] = 'PackageStart'
	GROUP BY Computer) Latest

	ON SYSSSISLOG.ExecutionID = Latest.LatestExecutionID
	GROUP BY SYSSSISLOG.Computer
	, SYSSSISLOG.Operator
	,LatestExecutionID 
*/