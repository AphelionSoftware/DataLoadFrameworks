/*
* @author Louis van der Merwe lsv@rmb.co.za
* 
*/

CREATE procedure [dbo].[ListJobs]
as
begin

	SELECT 
		  [ExternalID] as [Job ID]
		  ,a.Name as [Appliction]
		  ,ai.externalreference as [Instance]
		  ,[CreatedDate] as [Created Date]
		  ,[CreatedBy] as [Created By]
	  FROM [dbo].[Job] j, [dbo].[Application] a, [dbo].[ApplicationInstance] ai
	  where ai.ID = j.ApplicationInstanceID
	  and a.ID = ai.applicationID


end
