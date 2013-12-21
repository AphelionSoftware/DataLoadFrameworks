﻿/*
* @author Louis van der Merwe lsv@rmb.co.za
* 
*/

CREATE Procedure [CubeProcessingController].[QueryJobStatus]
	@JobID varchar(255)
as

--exec [CubeProcessingController].[QueryJobStatus] 'A25C0F8B-E736-4EC6-AAF7-E774A4A88D99'

begin

	select
		j.ExternalID as [Job ID]
		, a.Name as [Appliction]
		, ai.ExternalReference as [Instance]
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
		[CubeProcessingController].[Job] j inner join [CubeProcessingController].[ProcessQueue] p on p.JobID = j.ID
		inner join [CubeProcessingController].ApplicationInstance ai on ai.ID = j.ApplicationInstanceID
		inner join [CubeProcessingController].[Application] a on a.ID = ai.ApplicationID
		inner join [CubeProcessingController].[Table] t on t.ApplicationID = a.ID and t.ID = p.TableID
		inner join [CubeProcessingController].[Status] s on s.ID = p.StatusID
		left outer join [CubeProcessingController].[ErrorLog] e on e.ProcessQueueID = p.ID 
		left join [CubeProcessingController].[ErrorDefinition] ed on ed.ID = e.ErrorDefinitionID		
	where
		j.ExternalID = @JobID
	order by p.ID asc
		 

end
