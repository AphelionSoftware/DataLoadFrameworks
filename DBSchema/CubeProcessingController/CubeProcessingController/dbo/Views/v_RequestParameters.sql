





CREATE view [dbo].[v_RequestParameters]
as


		select 
			p.ID [RequestID],
			t.CubeTableName [CubeTable],
			t.DBTableName [DBTable],
			t.IsPartitioned [IsPartitioned],
			t.PartitionColumn [PartitionKeyName],
			p.StartPartitionValue,
			p.EndPartitionValue,
			j.ID [JobID],
			j.IsBatch [IsBatchJob],
			j.IsBatchComplete [IsBatchComplete],
			[CubeServer_Hostname],
			[CubeServer_Database],
			[CubeServer_CubeName],
			[CubeServer_DataSourceViewName],
			[CubeServer_ConnectionString],
			[Admin_Email]
		from 
			dbo.ProcessQueue p,
			dbo.Job j,
			dbo.ApplicationInstance ai,
			dbo.[Table] t
		where 
			j.ID = p.JobID
			and ai.ID = j.ApplicationInstanceID
			and t.ID = p.TableID
			and t.ApplicationID = ai.ApplicationID




