USE [MiXData]
GO

/*
DELETE FROM [dbo].[DIM_ExclusionLevel] 
DBCC CHECKIDENT('DIM_ExclusionLevel', RESEED, 0)

*/
SET IDENTITY_INSERT  [dbo].[DIM_ExclusionLevel] ON

INSERT INTO [dbo].[DIM_ExclusionLevel]
           (ExclusionLevelKey
		   ,[ExclusionLevelCode]
		   ,[ExclusionLevelName]
           ,[CompareValueLevelCode]
           ,[CompareValueLevelName]
           ,[CompareToLevelCode]
           ,[CompareToLevelName]
		   ,[DestinationTableName]
           ,[IsCurrentRecord]
           ,[IsActive])
		   SELECT 0, 'INCLUDE','Include' , 'INCLUDE', 'Include', 'INCLUDE', 'Include', '',1,1  UNION ALL
		   
		   SELECT -1, 'MANUAL_SINGLE','Manually excluded a single record' , 'MAN', 'Manually', 'MAN', 'Manually', 'FACT_ActivityDetailsExclusion',1,1  UNION ALL
		   /*SELECT -2, 'MANUAL_DAILY','Manually excluded a vehicle for a day' , 'MAN', 'Manually', 'MAN', 'Manually', 'FACT_ActivityDetailsExclusion',1,1  UNION ALL*/
		   SELECT -3, 'MANUAL_VEHICLE','Manually excluded a vehicle' , 'MAN', 'Manually', 'MAN', 'Manually', 'FACT_VehicleExclusion',1,1  UNION ALL
		   SELECT -11, 'STATS_SINGLE','Statistically excluded a single record' , 'STATS', 'Statistics', 'STATS', 'Statistics', 'FACT_ActivityDetailsExclusion',1,1  UNION ALL
		   /*SELECT -12, 'STATS_DAILY','Statistically excluded a vehicle for a day' , 'STATS', 'Statistics', 'STATS', 'Statistics', 'FACT_ActivityDetailsExclusion',1,1  UNION ALL*/
		   SELECT -13, 'STATS_VEHICLE','Statistically excluded a vehicle' , 'STATS', 'Statistics', 'STATS', 'Statistics', 'FACT_ActivityDetailsExclusion',1,1
		   
SET IDENTITY_INSERT  [dbo].[DIM_ExclusionLevel] OFF


INSERT INTO [dbo].[DIM_ExclusionLevel]
           ([ExclusionLevelCode]
		   ,[ExclusionLevelName]
           ,[CompareValueLevelCode]
           ,[CompareValueLevelName]
           ,[CompareToLevelCode]
           ,[CompareToLevelName]
		   ,[DestinationTableName]
           ,[IsCurrentRecord]
           ,[IsActive])
		SELECT 'EVTABS_SINGLE','Compare a single event to an absolute value and exclude the record' , 'EVENT', 'Event level', 'ABS', 'Absolute Value', 'FACT_ActivityDetailsExclusion',1,1 UNION ALL
		SELECT 'EVTALL_SINGLE','Compare a single event to the entire dataset and exclude the record', 'EVENT', 'Event level', 'ALL', 'Entire dataset', 'FACT_ActivityDetailsExclusion',1,1 UNION ALL
		SELECT 'EVTDAILY_SINGLE','Compare a single event to the daily value rollup and exclude the record', 'EVENT', 'Event level', 'DLY', 'Daily', 'FACT_ActivityDetailsExclusion',1,1 UNION ALL
		SELECT 'EVTDAILY_VEHICLE','Compare a single event to the daily value rollup and exclude the vehicle', 'EVENT', 'Event level', 'DLY', 'Daily', 'FACT_VehicleExclusion',1,1 UNION ALL
		SELECT 'EVTALL_VEHICLE','Compare a single event to the entire dataset  and exclude the vehicle', 'EVENT', 'Event level', 'DLY', 'Daily', 'FACT_VehicleExclusion',1,1 



