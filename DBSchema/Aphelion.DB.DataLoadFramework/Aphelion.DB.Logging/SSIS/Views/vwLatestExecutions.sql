CREATE VIEW [SSIS].[vwLatestExecutions]
as
/* This has a lower cost than the correspondingly simpler looking query in comments, due to use of filtered indexes on records with PackageStart and PackageEnd*/
SELECT 
	StartLog.computer
	, StartLog.operator
	,StartLog.executionid
	, StartLog.starttime
	, EndLog.endtime
	, DATEDIFF(s, StartLog.starttime, EndLog.endtime) RunTimeSeconds
	, DATEDIFF(s, StartLog.starttime, EndLog.endtime) / 60 RunTimeMinutes
	, StartLog.[source] StartSource
, EndLog.[source] EndSource
FROM dbo.sysssislog StartLog
INNER JOIN 
	(SELECT TOP 1 executionid AS LatestExecutionID,
	computer
	FROM dbo.sysssislog
	WHERE  [Event] = 'PackageStart'
	GROUP BY computer
		   , executionid
		   , endtime
	ORDER BY endtime DESC
	) Latest
	ON StartLog.executionid = Latest.LatestExecutionID
LEFT JOIN dbo.sysssislog EndLog
	ON StartLog.executionid = EndLog.executionid
	AND  EndLog.[event] = 'PackageEnd'
WHERE StartLog.[event] ='PackageStart'



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