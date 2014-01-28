--USE MiXData
/*

DELETE FROM [dbo].[DIM_ExclusionType] 
DBCC CHECKIDENT('DIM_ExclusionType', RESEED, 0)

*/
SET IDENTITY_INSERT  [dbo].[DIM_ExclusionType] ON
INSERT INTO [dbo].[DIM_ExclusionType]
           ([ExclusionTypeKey]
		   ,[ExclusionTypeName]
		   ,ExclusionTypeCode
           ,[IsCurrentRecord]
           ,[IsActive])
		   SELECT 0, 'Not excluded', 'NOTEX', 1, 1 UNION ALL
		   SELECT -1 ,'Manually marked', 'MANUAL', 1, 1 UNION ALL
		   SELECT -11,'Statistically identified - Clustering', 'CLUSTER', 1, 1 
SET IDENTITY_INSERT  [dbo].[DIM_ExclusionType] OFF
GO

INSERT INTO [dbo].[DIM_ExclusionType]
           ([ExclusionTypeName]
		   ,ExclusionTypeCode
           ,[IsCurrentRecord]
           ,[IsActive])
	 SELECT 'Rules Based - Event Level', 'EVT', 1, 1 UNION ALL
     SELECT 'Rules Based - Maximum', 'MAX', 1, 1 UNION ALL
	 SELECT 'Rules Based - Minimum', 'MIN', 1, 1 UNION ALL
	 SELECT 'Rules Based - Count', 'COUNT', 1, 1 UNION ALL
	 SELECT 'Rules Based - Average', 'AVERAGE', 1, 1 UNION ALL
	 SELECT 'Rules Based - Standard Deviation', 'STDEV.P', 1, 1 UNION ALL
	 SELECT 'Rules Based - Percentage', 'PERC', 1, 1 
	 
	 





