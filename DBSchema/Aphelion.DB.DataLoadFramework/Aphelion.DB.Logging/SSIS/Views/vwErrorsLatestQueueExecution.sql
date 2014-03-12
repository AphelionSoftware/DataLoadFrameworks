CREATE VIEW [SSIS].[vwErrorsLatestQueueExecution] 

as

select TOP 2147483647 * from dbo.sysssislog 
where executionid = (select top 1 executionid from ssis.[vwLatestQueueExecutions] order by endtime desc)
and event like '%error%'
order by id desc