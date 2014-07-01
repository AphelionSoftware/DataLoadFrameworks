
CREATE VIEW [SSIS].[vwLatestPackagesRunTimes]
as

select TOP 2147483647 
	   StartSSIS.[id]
      ,StartSSIS.[event]
      ,StartSSIS.[computer]
      ,StartSSIS.[operator]
      ,StartSSIS.[source]
	  ,DATEDIFF(s,StartSSIS.[starttime], EndSSIS.[Endtime] ) RunTime
      ,StartSSIS.[sourceid]
      ,StartSSIS.[executionid]
      ,StartSSIS.[starttime]
	  ,EndSSIS.[endtime]
 from dbo.sysssislog  StartSSIS
LEFT JOIN dbo.sysssislog  EndSSIS
on endssis.executionid = (select top 1 executionid from ssis.[vwLatestExecutions])
AND	 EndSSIS.event = 'User:PackageEnd'
and StartSSIS.SourceID = EndSSIS.SourceID
where StartSSIS.executionid = (select top 1 executionid from ssis.[vwLatestExecutions])
and StartSSIS.event = 'User:PackageStart'

order by StartSSIS.[starttime] ASC
GO


