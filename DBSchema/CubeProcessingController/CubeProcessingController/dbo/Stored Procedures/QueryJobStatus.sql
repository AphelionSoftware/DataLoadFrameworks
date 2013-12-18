/*
* @author Louis van der Merwe lsv@rmb.co.za
* 
*/

CREATE Procedure [dbo].[QueryJobStatus]
	@JobID varchar(255)
as

--exec [dbo].[QueryJobStatus] 'A25C0F8B-E736-4EC6-AAF7-E774A4A88D99'

begin

	select
		j.ExternalID as [Job ID]
		, a.Name as [Appliction]
		, ai.externalreference as [Instance]
		, p.ID as [Request ID]
		, t.DBTableName as [Table]
		, s.Name as [Request Status]
		, p.EnqueuedTime [Enqueued Time]
		, p.StartTime [Start Time]
		, p.EndTime [End Time]
		, ed.Description [Error Description]
		, e.Message [Message]
		, ed.ID [Error Code]
		, ed.isWarning [Is Warning]
	from 
		[job] j inner join [ProcessQueue] p on p.jobid = j.ID
		inner join [applicationInstance] ai on ai.id = j.ApplicationInstanceID
		inner join [application] a on a.id = ai.applicationid
		inner join [Table] t on t.applicationid = a.id and t.ID = p.TableID
		inner join [Status] s on s.ID = p.StatusID
		left outer join [ErrorLog] e on e.ProcessQueueID = p.ID 
		left join [ErrorDefinition] ed on ed.ID = e.ErrorDefinitionID		
	where
		j.ExternalID = @JobID
	order by p.ID asc
		 

end
