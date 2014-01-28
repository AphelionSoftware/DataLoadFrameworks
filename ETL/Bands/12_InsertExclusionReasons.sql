USE [MiXData]
GO


/*

delete from dbo.FACT_ActivityDetailsExclusion
DELETE FROM [dbo].[DIM_ExclusionReason] 
DBCC CHECKIDENT('DIM_ExclusionReason', RESEED, 0)

*/
SET IDENTITY_INSERT  [dbo].[DIM_ExclusionReason] ON
INSERT INTO [dbo].[DIM_ExclusionReason]
           (ExclusionReasonKey
		   ,[ExclusionReasonName]
           ,[ExclusionTypeKey]
           ,[ExclusionLevelKey]
           ,[DAXFieldName]
		    ,DestinationFieldName
           ,[BoundaryValue]
          ,[BoundaryComparison]
		 
		   ,IsActive 
           )
     SELECT 0,'Do not exclude', 0, 0, '','VehicleExclusionConfirmedID' ,100, '>',1 UNION ALL
	 SELECT -1,'ManuallyExcluded', -1, -1, '','VehicleExclusionConfirmedID' ,100, '>',1 

SET IDENTITY_INSERT  [dbo].[DIM_ExclusionReason] OFF

INSERT INTO [dbo].[DIM_ExclusionReason]
           ([ExclusionReasonName]
           ,[ExclusionTypeKey]
           ,[ExclusionLevelKey]
		   ,[DAXDateFieldName]
           ,[DAXFieldName]
		   ,[DAXKeyFieldName]
		   ,[DAXObjectKeyFieldName]
		   ,DestinationFieldName
           ,[BoundaryValue]
           ,[BoundaryComparison]	 
		   ,IsActive 
           )
     SELECT 'Test: Exclude based on max speed'
	 , 1
	 , 1
	 , 'ActivityDetails[ActivityEndDateKey]'
	 , 'ActivityDetails[MaxSpeed]'
	 , 'ActivityDetails[ActivityDetailKey]'
	 , 'ActivityDetails[VehicleKey]'
	 ,'ExcludeMaxSpeedReasonID'
	  , 160
	  , '>'
	  ,1
	  UNION ALL
	  SELECT 'Test: Exclude based on minimum distance'
	 , 1
	 , 1
	 , 'ActivityDetails[ActivityEndDateKey]'
	 , 'ActivityDetails[DistanceTravelled]'
	 , 'ActivityDetails[ActivityDetailKey]'
	 , 'ActivityDetails[VehicleKey]'
	 ,'ExcludeDistanceReasonID'
	  , 0.2
	  , '<'
	  ,1



	  UNION ALL
	  SELECT 'Test: Exclude based on braking occurences ratio'
	 , 1
	 , 1
	 , 'ActivityDetails[ActivityEndDateKey]'
	 , 'ActivityDetails[BrakeRiskScoreRatio]'
	 , 'ActivityDetails[ActivityDetailKey]'
	 , 'ActivityDetails[VehicleKey]'
	 ,'ExcludeBrakeOccursReasonID'
	  , 1
	  , '>'
	  ,1


	  UNION ALL
	  SELECT 'Test: Exclude based on speed occurences ratio'
	 , 1
	 , 1
	 , 'ActivityDetails[ActivityEndDateKey]'
	 , 'ActivityDetails[SpeedRiskScoreRatio]'
	 , 'ActivityDetails[ActivityDetailKey]'
	 , 'ActivityDetails[VehicleKey]'
	 ,'ExcludeSpeedOccursReasonID'
	  , 1
	  , '>'
	  ,1

	  


	  /*Inserts for vehicle by day
	  */
--	  update [dbo].[DIM_ExclusionReason] set IsActive = 0
INSERT INTO [dbo].[DIM_ExclusionReason]
           ([ExclusionReasonName]
           ,[ExclusionTypeKey]
           ,[ExclusionLevelKey]
		   ,[DAXDateFieldName]
           ,[DAXFieldName]
		   ,[DAXKeyFieldName]
		   ,[DAXObjectKeyFieldName]
		   ,DestinationFieldName
           ,[BoundaryValue]
           ,[BoundaryComparison]	 
		   ,IsActive 
           )
     SELECT 'Test: Exclude vehicle based on a count of exclusions for a day'
	 , 4 /*Count*/
	 , 4 /*Compare a single event to the daily value rollup and exclude the vehicle*/
	 , 'ActivityDetailsExclusion[ActivityExclusionDateKey]'
	 , 'ActivityDetailsExclusion[FirstExclusionReasonID]'
	 , 'ActivityDetailsExclusion[VehicleKey]'
	 , 'ActivityDetailsExclusion[VehicleKey]'
	 ,'ExcludeVehicleReasonID'
	  , 5
	  , '>'
	  ,1