/*
* @author Louis van der Merwe lsv@rmb.co.za
* 
*/

CREATE procedure [CubeProcessingController].[ListJobs]
as
begin

	SELECT 
		  [ExternalID] as [Job ID]
		  ,a.Name as [Appliction]
		  ,ai.ExternalReference as [Instance]
		  ,[CreatedDate] as [Created Date]
		  ,[CreatedBy] as [Created By]
	  FROM [CubeProcessingController].[Job] j, [CubeProcessingController].[Application] a, [CubeProcessingController].[ApplicationInstance] ai
	  where ai.ID = j.ApplicationInstanceID
	  and a.ID = ai.ApplicationID


end
