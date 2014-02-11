CREATE VIEW [SSIS].[vwPackageSummaryLatestExecution] 

as

select TOP 2147483647 * from dbo.sysssislog 
where executionid = (select top 1 executionid from SSIS.vwLatestExecutions)
and event like '%package%'
order by id desc