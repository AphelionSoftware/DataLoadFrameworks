USE [MiXData]
GO
/****** Object:  View [orgHier].[Organisation]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [orgHier].[Organisation]
GO
CREATE VIEW [orgHier].[Organisation]
AS 


select 
	 os.LocalKey [OrganisationKey]
      ,[LoadDate]
      ,[CreateDate]
      ,[Active]
      ,[Code]
      ,[Name]
      ,[Description]
      ,[OrganisationGroupKey]
      ,[OrganisationKey] [dboOrganisationKey]
from MiXAggregator.DBO.Organisation O 
inner join MiXAggregator.[dbo].[OrgShift] OS on O.OrganisationKey = OS.GroupKey





GO
/****** Object:  View [Cube].[Dim_GeoLocations]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[Dim_GeoLocations]
GO
CREATE VIEW [Cube].[Dim_GeoLocations]
as
SELECT  
DGL.[GeoLocationKey]
,DGL.[OrganisationKey]
,DGL.[LocationPoint]
,DGL.[Longitude]
,DGL.[Latitude]
,DGL.[StreetLevelName]
,DGL.[GeographyKey]
,DGL.[CreateBatchKey]
,DGL.[UpdateBatchKey]
,ORG.OrganisationGroupKey
FROM [dbo].[DIM_GeoLocations] DGL
INNER JOIN orgHier.Organisation ORG ON ORG.OrganisationKey = DGL.OrganisationKey
 
GO
/****** Object:  View [Cube].[Dim_Passengers]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[Dim_Passengers]

GO
CREATE VIEW [Cube].[Dim_Passengers]
as
SELECT 
DP.[PassengerKey]
,DP.[StartDateKey]
,DP.[EndDateKey]
,DP.[IsCurrentRecord]
,DP.[OrganisationKey]
,DP.[HostID]
,DP.[PassengerGUID]
,DP.[PassengerName]
,DP.[CreateBatchKey]
,DP.[UpdateBatchKey]
,ORG.OrganisationGroupKey
FROM [dbo].[DIM_Passengers] DP
INNER JOIN orgHier.Organisation ORG ON ORG.OrganisationKey = DP.OrganisationKey

 
GO
/****** Object:  View [Cube].[DIM_SimpleScoreCriteria]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[DIM_SimpleScoreCriteria]
GO
CREATE VIEW [Cube].[DIM_SimpleScoreCriteria]
AS
SELECT  DSSC.[ScoreCriteriaKey]
,case when DSSC.[StartDateKey] < '1900-01-01' then '1900-01-01' else DSSC.[StartDateKey] end [StartDateKey] 
,case when DSSC.[EndDateKey] < '1900-01-01' then '1900-01-01' else DSSC.[EndDateKey] end [EndDateKey]
,DSSC.[IsCurrentRecord]
,DSSC.[IsActive]
,DSSC.[OrganisationKey]
,DSSC.[HostID]
,DSSC.[EventDescriptionKey]
,DSSC.[TriggerID]
,DSSC.[ScoreDuration]
,DSSC.[ScoreSeverity]
,DSSC.[ScoreWeight]
,DSSC.[UTCOffsetKey]
,DSSC.[CreateBatchKey]
,DSSC.[UpdateBatchKey]
,ORG.OrganisationGroupKey
FROM [dbo].[DIM_SimpleScoreCriteria] DSSC
INNER JOIN orgHier.Organisation ORG ON ORG.OrganisationKey = DSSC.OrganisationKey

 
GO
/****** Object:  View [Cube].[DIM_Trailers]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON


DROP VIEW [Cube].[DIM_Trailers]
GO
GO

CREATE VIEW [Cube].[DIM_Trailers]
AS
SELECT  DT.[TrailerKey]
      ,case when DT.[StartDateKey] < '1990-01-01' then '1990-01-01' else DT.[StartDateKey] end [StartDateKey]
      ,case when DT.[EndDateKey] < '1990-01-01' then '1990-01-01' else DT.[EndDateKey] end [EndDateKey]
      ,DT.[IsCurrentRecord]
      ,DT.[IsActive]
      ,DT.[OrganisationKey]
      ,DT.[HostID]
      ,DT.[TrailerGUID]
      ,DT.[TrailerAssetNumber]
      ,DT.[TrailerRegNumber]
      ,DT.[TrailerDescription]
      ,DT.[TrailerUnitID]
      ,DT.[SiteGUID]
      ,DT.[UnitTypeLookupKey]
      ,DT.[UTCOffsetKey]
      ,DT.[CreateBatchKey]
      ,DT.[UpdateBatchKey]
	  ,ORG.OrganisationGroupKey
FROM [dbo].[DIM_Trailers] DT
INNER JOIN orgHier.Organisation ORG ON ORG.OrganisationKey = DT.OrganisationKey
WHERE Org.Active = 1
 

GO
/****** Object:  View [Cube].[Fact_ActivityDetails]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Cube].[Fact_ActivityDetails]
as
SELECT
FAD.[ActivityDetailKey]
,FAD.[ActivitySummaryKey]
,FAD.[OrganisationKey]
,FAD.[HostID]
,FAD.[VehicleSiteKey]
,case when FAD.[ActivityStartDateKey] < '1900-01-01' then '1900-01-01' else FAD.[ActivityStartDateKey] end [ActivityStartDateKey]
,case when FAD.[ActivityEndDateKey] < '1900-01-01' then '1900-01-01' else FAD.[ActivityEndDateKey] end [ActivityEndDateKey]
,FAD.[ActivityStartTime]
,FAD.[ActivityEndTime]
,case when FAD.[ActivityStartDateTime] < '1900-01-01' then '1900-01-01' else FAD.[ActivityStartDateTime] end [ActivityStartDateTime]
,case when FAD.[ActivityEndDateTime] < '1900-01-01' then '1900-01-01' else FAD.[ActivityEndDateTime] end [ActivityEndDateTime]
,case when FAD.[MovementStartDateKey] < '1900-01-01' then '1900-01-01' else FAD.[MovementStartDateKey] end [MovementStartDateKey]
,case when FAD.[MovementEndDateKey] < '1900-01-01' then '1900-01-01' else FAD.[MovementEndDateKey] end [MovementEndDateKey]
,FAD.[MovementStartTime]
,FAD.[MovementEndTime]
,case when FAD.[MovementStartDateTime] < '1900-01-01' then '1900-01-01' else FAD.[MovementStartDateTime] end [MovementStartDateTime]
,case when FAD.[MovementEndDateTime] < '1900-01-01' then '1900-01-01' else FAD.[MovementEndDateTime] end [MovementEndDateTime]
,FAD.[NextMovementActivityDetailKey]
,case when FAD.[NextMovementStartDateTime] < '1900-01-01' then '1900-01-01' else FAD.[NextMovementStartDateTime] end [NextMovementStartDateTime]
,FAD.[IsLastMovement]
,FAD.[StartOdometer]
,FAD.[EndOdometer]
,FAD.[StartEngineSeconds]
,FAD.[EndEngineSeconds]
,FAD.[StartGeoLocationKey]
,FAD.[EndGeoLocationKey]
,FAD.[DistanceTravelled]
,FAD.[Duration]
,FAD.[DrivingTime]
,FAD.[StandingTime]
,FAD.[DriverKey]
,FAD.[VehicleKey]
,FAD.[MaxSpeed]
,FAD.[SpeedTime]
,FAD.[SpeedOccurs]
,FAD.[MaxBrake]
,FAD.[BrakeTime]
,FAD.[BrakeOccurs]
,FAD.[MaxAccel]
,FAD.[AccelTime]
,FAD.[AccelOccurs]
,FAD.[MaxRPM]
,FAD.[RPMTIme]
,FAD.[RPMOccurs]
,FAD.[OutOfGreenBandTime]
,FAD.[ExcessiveIdleTime]
,FAD.[ExcessiveIdleOccurs]
,FAD.[IdleTime]
,FAD.[IdleOccurs]
,FAD.[EngineSeconds]
,FAD.[NoGoZoneEntry]
,FAD.[Passengers]
,FAD.[FuelUsedMeasured]
,FAD.[FuelUsedCalculated]
,FAD.[FuelUsedHierarchy]
,FAD.[NightDuration]
,FAD.[AfterHoursDuration]
,FAD.[TotalCarbonEmission]
,FAD.[TotalCO2Emission]
,FAD.[PulseParameterKey]
,FAD.[PulseValue]
,FAD.[UTCOffsetKey]
,FAD.[IsDeleted]
,FAD.[CreateBatchKey]
,FAD.[UpdateBatchKey]
,ORG.OrganisationGroupKey
,cast(convert(char(8),case when FAD.[ActivityStartDateTime] < '1900-01-01' then '1900-01-01' else FAD.[ActivityStartDateTime] end,112) as int) [ActivityStartDateLocalKey]
,datediff(MI,cast(case when FAD.[ActivityStartDateTime] < '1900-01-01' then '1900-01-01' else FAD.[ActivityStartDateTime] end as date),cast(case when FAD.[ActivityStartDateTime] < '1900-01-01' then '1900-01-01' else FAD.[ActivityStartDateTime] end as datetime)) [ActivityStartTimeLocalKey]
,cast(convert(char(8),SWITCHOFFSET(case when FAD.[ActivityStartDateTime] < '1900-01-01' then '1900-01-01' else FAD.[ActivityStartDateTime] end,'+00:00'),112) as int) [ActivityStartDateUTCKey]
,datediff(MI,cast(case when FAD.[ActivityStartDateTime] < '1900-01-01' then '1900-01-01' else FAD.[ActivityStartDateTime] end as date),cast(SWITCHOFFSET(case when FAD.[ActivityStartDateTime] < '1900-01-01' then '1900-01-01' else FAD.[ActivityStartDateTime] end,'+00:00') as datetime)) [ActivityStartTimeUTCKey]
FROM [dbo].[FACT_ActivityDetails] FAD
INNER JOIN orgHier.Organisation ORG ON ORG.OrganisationKey = FAD.OrganisationKey
WHERE Org.Active = 1
 
GO
/****** Object:  View [Cube].[Fact_ActivitySummary]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[Fact_ActivitySummary] 
GO
CREATE VIEW [Cube].[Fact_ActivitySummary] 
as
SELECT
FAS.[ActivitySummaryKey]
,FAS.[OrganisationKey]
,FAS.[HostID]
,FAS.[UnitTripNumber]
,FAS.[ActivityStartDateKey]
,FAS.[ActivityEndDateKey]
,FAS.[ActivityStartTime]
,FAS.[ActivityEndTime]
,FAS.[ActivityStartDateTime]
,FAS.[ActivityEndDateTime]
,FAS.[VehicleKey]
,FAS.[DriverKey]
,FAS.[OriginalDriverKey]
,FAS.[OriginalDriverSiteKey]
,FAS.[OriginalVehicleSiteKey]
,FAS.[UTCOffsetKey]
,FAS.[TotalFuelUsedMeasured]
,FAS.[TotalFuelUsedCalculated]
,FAS.[StartOdometer]
,FAS.[EndOdometer]
,FAS.[StartEngineSeconds]
,FAS.[EndEngineSeconds]
,FAS.[StartGeoLocationKey]
,FAS.[EndGeoLocationKey]
,FAS.[AverageSimpleDriverScore]
,FAS.[TotalDuration]
,FAS.[TotalDistanceTravelled]
,FAS.[TotalDrivingTime]
,FAS.[TotalEngineSeconds]
,FAS.[MaxSpeed]
,FAS.[MaxAccel]
,FAS.[MaxBrake]
,FAS.[MaxRPM]
,FAS.[TotalIdleTime]
,FAS.[TotalPassengers]
,FAS.[TotalStandingTime]
,FAS.[TotalNightDuration]
,FAS.[TotalAfterHoursDuration]
,FAS.[TotalCarbonEmission]
,FAS.[TotalCO2Emission]
,FAS.[TripClassificationLookupKey]
,FAS.[TripClassificationHierarchy]
,FAS.[IsDutchTaxTripClassification]
,FAS.[MovementCount]
,FAS.[IsDeleted]
,FAS.[CreateBatchKey]
,FAS.[UpdateBatchKey]
,ORG.OrganisationGroupKey
FROM [dbo].[FACT_ActivitySummary] FAS
INNER JOIN orgHier.Organisation ORG ON ORG.OrganisationKey = FAS.OrganisationKey
WHERE Org.Active = 1
 
GO
/****** Object:  View [Cube].[Fact_EventDetails]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
DROP VIEW [Cube].[Fact_EventDetails]
GO
CREATE VIEW [Cube].[Fact_EventDetails]
AS 
SELECT 
FED.[EventDetailKey]
,FED.[OrganisationKey]
,FED.[HostID]
,FED.[DriverKey]
,FED.[VehicleKey]
,FED.[TrailerKey]
,FED.[EventDescriptionKey]
,FED.[EventTypeLookupKey]
,FED.[ActivityDetailKey]
,case when FED.[EventStartDateKey] < '1900-01-01' then '1900-01-01' else FED.[EventStartDateKey] end [EventStartDateKey] 
,case when FED.[EventEndDateKey] < '1900-01-01' then '1900-01-01' else FED.[EventEndDateKey] end [EventEndDateKey]
,FED.[EventStartTime]
,FED.[EventEndTime]
,case when FED.[EventStartDateTime] < '1900-01-01' then '1900-01-01' else FED.[EventStartDateTime] end [EventStartDateTime]
,case when FED.[EventEndDateTime] < '1900-01-01' then '1900-01-01' else FED.[EventEndDateTime] end [EventEndDateTime]
,FED.[StartOdometer]
,FED.[EndOdometer]
,FED.[EventValue]
,FED.[StartGeoLocationKey]
,FED.[EndGeoLocationKey]
,FED.[TotalOccurs]
,FED.[TotalTime]
,FED.[ParameterKey]
,FED.[Litres]
,FED.[PulseParameterKey]
,FED.[PulseValue]
,FED.[UTCOffsetKey]
,FED.[IsDeleted]
,FED.[CreateBatchKey]
,FED.[UpdateBatchKey]
,NULL [VideoKey]
,ORG.OrganisationGroupKey
FROM [dbo].[FACT_EventDetails] FED
INNER JOIN orgHier.Organisation ORG ON ORG.OrganisationKey = FED.OrganisationKey
WHERE Org.Active = 1
 
GO
/****** Object:  View [Cube].[FACT_EventRoadspeedLimits]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON

DROP VIEW [Cube].[FACT_EventRoadspeedLimits]
GO

CREATE VIEW [Cube].[FACT_EventRoadspeedLimits]
as

SELECT FERL.[EventDetailKey]
      ,FERL.[EventStartDateKey]
      ,FERL.[SpeedLimit]
      ,FERL.[IsDeleted]
      ,FERL.[CreateBatchKey]
      ,FERL.[UpdateBatchKey]
	  ,ORG.OrganisationGroupKey
  FROM [dbo].[FACT_EventRoadspeedLimits] FERL
  INNER JOIN orgHier.Organisation ORG ON ORG.OrganisationKey = FERL.OrganisationKey

GO
/****** Object:  View [Cube].[Fact_FuelCapture]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[Fact_FuelCapture]
GO
CREATE VIEW [Cube].[Fact_FuelCapture]
as 
SELECT  
FC.[FuelCapturekey]
,FC.[OrganisationKey]
,FC.[HostID]
,FC.[VehicleKey]
,case when FC.[FillDateKey] < '1900-01-01' then '1900-01-01' else FC.[FillDateKey] end [FillDateKey]
,case when FC.[FillTime] < '1900-01-01' then '1900-01-01' else FC.[FillTime] end [FillTime]
,FC.[FillDateTime]
,case when FC.[PreviousFillDateTime] < '1900-01-01' then '1900-01-01' else FC.[PreviousFillDateTime] end [PreviousFillDateTime]
,FC.[Litres]
,FC.[BaseCost]
,FC.[BaseCurrencyKey]
,FC.[FillOdometer]
,FC.[PreviousFillOdometer]
,FC.[EngineSeconds]
,FC.[PreviousEngineSeconds]
,FC.[DistanceTravelled]
,FC.[FillFuelConsumption]
,FC.[ActivityDetailKey]
,FC.[FuelStopGeoLocationKey]
,FC.[UTCOffsetKey]
,FC.[IsDeleted]
,FC.[CreateBatchKey]
,FC.[UpdateBatchKey]
,ORG.OrganisationGroupKey
FROM [dbo].[FACT_FuelCapture] FC
INNER JOIN orgHier.Organisation ORG ON ORG.OrganisationKey = FC.OrganisationKey
WHERE Org.Active = 1
 
GO
/****** Object:  View [Cube].[Fact_PassengerActivities]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[Fact_PassengerActivities]
GO
CREATE VIEW [Cube].[Fact_PassengerActivities]
as
SELECT 
FPA.[PassengerActivityKey]
,FPA.[OrganisationKey]
,FPA.[HostID]
,FPA.[PassengerKey]
,FPA.[VehicleKey]
,FPA.[ActivitySummaryKey]
,FPA.[ActivityDetailKey]
,FPA.[IdentifiedDateKey]
,FPA.[IdentifiedTime]
,FPA.[IdentifiedDateTime]
,FPA.[Odometer]
,FPA.[UTCOffsetKey]
,FPA.[IsDeleted]
,FPA.[CreateBatchKey]
,FPA.[UpdateBatchKey]
,ORG.OrganisationGroupKey
FROM [dbo].[FACT_PassengerActivities] FPA
INNER JOIN orgHier.Organisation ORG ON ORG.OrganisationKey = FPA.OrganisationKey
WHERE Org.Active = 1
 
GO
/****** Object:  View [Cube].[Fact_ShapeVisits]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[Fact_ShapeVisits]


GO
CREATE VIEW [Cube].[Fact_ShapeVisits]
as
SELECT  
[ShapeVisitKey]
,FSV.[OrganisationKey]
,[VisitDateKey]
,[ShapeKey]
,[VehicleKey]
,[DriverKey]
,[DurationAtLocation]
,[NumberOfVisits]
,[NumberOfUniqueVisits]
,[UTCOffsetKey]
,[CreateBatchKey]
,[UpdateBatchKey]
,ORG.OrganisationGroupKey
FROM [dbo].[FACT_ShapeVisits] FSV
INNER JOIN orgHier.Organisation ORG ON ORG.OrganisationKey = FSV.OrganisationKey
WHERE Org.Active = 1
 
GO
/****** Object:  View [Cube].[Fact_SimpleScoreDetails]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[Fact_SimpleScoreDetails]
GO
CREATE VIEW [Cube].[Fact_SimpleScoreDetails]
as

SELECT   FSS.[SimpleScoreKey]
,FSS.[OrganisationKey]
,FSS.[ActivityDetailKey]
,FSS.[ActivityStartDateKey]
,FSS.[DriverKey]
,FSS.[VehicleKey]
,FSS.[DistanceTravelled]
,FSS.[DrivingTime]
,FSS.[Duration]
,FSS.[MaxSpeed]
,FSS.[SpeedTime]
,FSS.[SpeedOccurs]
,FSS.[SpeedScore]
,FSS.[SpeedScoreCiteriaKey]
,FSS.[MaxBrake]
,FSS.[BrakeTime]
,FSS.[BrakeOccurs]
,FSS.[BrakeScore]
,FSS.[BrakeScoreCiteriaKey]
,FSS.[MaxAccel]
,FSS.[AccelTime]
,FSS.[AccelOccurs]
,FSS.[AccelScore]
,FSS.[AccelScoreCiteriaKey]
,FSS.[MaxRPM]
,FSS.[RPMTime]
,FSS.[RPMOccurs]
,FSS.[RPMScore]
,FSS.[RPMScoreCiteriaKey]
,FSS.[OutOfGreenBandTime]
,FSS.[OutOfGreenBandScore]
,FSS.[OutOfGreenbandScoreCiteriaKey]
,FSS.[ExcessiveIdleOccurs]
,FSS.[ExcessiveIdleTime]
,FSS.[ExcessiveIdleScore]
,FSS.[ExcessiveIdleScoreCiteriaKey]
,FSS.[IsDeleted]
,FSS.[CreateBatchKey]
,FSS.[UpdateBatchKey]
,org.OrganisationGroupKey
FROM [dbo].[FACT_SimpleScoreDetails] FSS
INNER JOIN orgHier.Organisation ORG ON ORG.OrganisationKey = FSS.OrganisationKey
WHERE Org.Active = 1
 
GO
/****** Object:  View [Cube].[GeoLocationsToShapes]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[GeoLocationsToShapes]
GO
CREATE VIEW [Cube].[GeoLocationsToShapes]
as

SELECT 
DGLS.[GeoLocationToShapeKey]
,DGLS.[GeoLocationKey]
,DGLS.[ShapeKey]
,DGLS.[CreateBatchKey]
,DGLS.[UpdateBatchKey]
,ORG.OrganisationGroupKey
FROM [dbo].[DIM_GeoLocationsToShapes] DGLS
INNER JOIN dbo.DIM_Shapes DS on DGLS.ShapeKey = DS.ShapeKey
INNER JOIN orgHier.Organisation ORG ON ORG.OrganisationKey = DS.OrganisationKey
 
GO
/****** Object:  View [Cube].[Site]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[Site]
GO
CREATE VIEW [Cube].[Site]
AS
SELECT 
  [SiteKey] = CASE WHEN os.KeyShift < 0 THEN os.KeyShift -S.SiteKey ELSE S.SiteKey END,
  null [LoadDate],
  null [CreateDate],
  1 [Active],
  os.GroupKey [OrganisationKey],
  s.HostID [HostID],
  Null [HostName], 
  s.[SiteName] [Code],
  s.[SiteName] [Name],
  s.[SiteName] [Description]
FROM [dbo].[DIM_Sites] S
INNER JOIN [MiXAggregator].[dbo].[OrgShift] OS on s.OrganisationKey = os.LocalKey 

GO
/****** Object:  View [Cube].[User_Site_Bridge]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON

DROP VIEW [Cube].[User_Site_Bridge]
GO

CREATE VIEW [Cube].[User_Site_Bridge]
AS
WITH OrgSites(SiteKey, NodeKey) AS 
(
	select SiteKey,OrgHierarchykey [NodeKey] from [MiXAggregator].[orgHier].[HierarchySite] where active = 1
	UNION ALL
	SELECT h.SiteKey,n.NodeParent FROM OrgSites h inner join [MiXAggregator].[orgHier].[OrgHierarchy] n on h.NodeKey = n.Nodekey where n.NodeParent is not null  
)
select 
  b.UserKey,
  [SiteKey] = CASE WHEN os.KeyShift < 0 THEN os.KeyShift -S.SiteKey ELSE S.SiteKey END ,
  u.LoginName
from OrgSites t 
inner join [MiXAggregator].[orgHier].[User_Hierarchy_Bridge] b on b.OrgHierarchykey = t.NodeKey 
inner join [MiXAggregator].[dbo].[User] U on u.userKey = B.userKey
inner join [Cube].[Site] S on S.SiteKey = t.SiteKey
inner join [MiXAggregator].dbo.OrgShift OS on OS.[GroupKey] = s.OrganisationKey

GO
/****** Object:  View [Cube].[Dim_Sites]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP VIEW [Cube].[Dim_Sites]
GO

CREATE VIEW [Cube].[Dim_Sites]
as
SELECT 
DS.[SiteKey],
DS.[OrganisationKey],
DS.[HostID],
DS.[SiteName],
ORG.OrganisationGroupKey
FROM [dbo].[DIM_Sites] DS
inner join orgHier.Organisation ORG on ORG.OrganisationKey = DS.OrganisationKey 

GO
/****** Object:  View [Cube].[Dim_OrganisationHierarchy]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
DROP VIEW [Cube].[Dim_OrganisationHierarchy]

GO
CREATE VIEW [Cube].[Dim_OrganisationHierarchy]
AS
SELECT
  [SiteKey] = CASE WHEN md.IsThisMachine = 1 THEN -hs.SiteKey + MD.IntAddition ELSE hs.SiteKey END,
  [Level1]  = l2.NodeName ,
  [Level2]  = l3.NodeName ,
  [Level3]  = l4.NodeName ,
  [Level4]  = l5.NodeName ,
  [Level5]  = l6.NodeName ,
  [Level6]  = l7.NodeName ,
  [Level7]  = l8.NodeName ,
  [Level8]  = l9.NodeName ,
  [Level9]  = l10.NodeName ,
  [Level10] = null,
  og.OrganisationGroupKey
FROM
           [MiXAggregator].[dbo].[OrganisationGroup]      OG
inner join [MiXAggregator].[dbo].[Organisation]           O   on O.OrganisationGroupKey  = OG.OrganisationGroupKey
inner join [MiXAggregator].[dbo].[MachineDetails]         MD  on md.MachineDetailsKey    = o.SourceMachineDetailsKey 
inner join [MiXAggregator].[orgHier].[OrgHierarchyDetail] OD  on od.OrganisationGroupKey = og.OrganisationGroupKey  
inner join [MiXAggregator].[orgHier].[OrgHierarchy]       l1  on l1.OrganisationGroupKey = og.OrganisationGroupKey
left  join [MiXAggregator].[orgHier].[OrgHierarchy]       l2  on l1.Nodekey = l2.NodeParent 
left  join [MiXAggregator].[orgHier].[OrgHierarchy]       l3  on l2.Nodekey = l3.NodeParent 
left  join [MiXAggregator].[orgHier].[OrgHierarchy]       l4  on l3.Nodekey = l4.NodeParent 
left  join [MiXAggregator].[orgHier].[OrgHierarchy]       l5  on l4.Nodekey = l5.NodeParent 
left  join [MiXAggregator].[orgHier].[OrgHierarchy]       l6  on l5.Nodekey = l6.NodeParent 
left  join [MiXAggregator].[orgHier].[OrgHierarchy]       l7  on l6.Nodekey = l7.NodeParent 
left  join [MiXAggregator].[orgHier].[OrgHierarchy]       l8  on l7.Nodekey = l8.NodeParent 
left  join [MiXAggregator].[orgHier].[OrgHierarchy]       l9  on l8.Nodekey = l9.NodeParent 
left  join [MiXAggregator].[orgHier].[OrgHierarchy]       l10 on l9.Nodekey = l10.NodeParent 
inner join [MiXAggregator].[orgHier].[HierarchySite]      hs  on hs.OrgHierarchykey = COALESCE(l10.nodekey,l9.nodekey,l8.nodekey,l7.nodekey,l6.nodekey,l5.nodekey,l4.nodekey,l3.nodekey,l2.nodekey,l1.nodekey)
inner join [Cube].[Site]                                  s   on s.SiteKey          = hs.SiteKey
                                                             and s.OrganisationKey  = o.OrganisationKey
where l1.NodeParent is null 
union
select
  t.SiteKey,
  case when depth >= 1 then 'Unassigned' else null end [Level1],
  case when depth >= 2 then 'Unassigned' else null end [Level2],
  case when depth >= 3 then 'Unassigned' else null end [Level3],
  case when depth >= 4 then 'Unassigned' else null end [Level4],
  case when depth >= 5 then 'Unassigned' else null end [Level5],
  case when depth >= 6 then 'Unassigned' else null end [Level6],
  case when depth >= 7 then 'Unassigned' else null end [Level7],
  case when depth >= 8 then 'Unassigned' else null end [Level8],
  case when depth >= 9 then 'Unassigned' else null end [Level9],
  case when depth >= 10 then 'Unassigned' else null end [Level10],
  od.OrganisationGroupKey
from
  [MiXAggregator].[orgHier].[OrgHierarchyDetail] od
  cross join
 (select
    s.SiteKey  [SiteKey]
  from
  [Cube].[Dim_Sites] s
  inner join 
  [MiXAggregator].[dbo].[OrgShift] OS on os.LocalKey = s.OrganisationKey
  where CASE WHEN os.KeyShift < 0 THEN os.KeyShift -S.SiteKey ELSE S.SiteKey END NOT IN (select SiteKey from [MiXAggregator].[orgHier].[HierarchySite])  ) t

GO
/****** Object:  View [Cube].[Dim_Drivers]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON

DROP VIEW [Cube].[Dim_Drivers]
GO


CREATE VIEW [Cube].[Dim_Drivers]
as

SELECT DD.[DriverKey]
      ,case when [StartDateKey] < '1900-03-01' then '1900-03-01' else [StartDateKey] end [StartDateKey]
      ,case when [EndDateKey] < '1900-03-01' then '1900-03-01' else [EndDateKey] end [EndDateKey]
      ,DD.[IsCurrentRecord]
      ,DD.[OrganisationKey]
      ,DD.[HostID]
      ,DD.[DriverGUID]
      ,DD.[IsActive]
      ,DS.[SiteKey]
      ,DD.[DriverName]
      ,DD.[DriverEmployeeNumber]
      ,DD.[DriverExtendedID]
      ,DD.[ConfigurationGroupName]
      ,DD.[UTCOffsetKey]
      ,DD.[CreateBatchKey]
      ,DD.[UpdateBatchKey]
	  ,Org.OrganisationGroupKey
  FROM [dbo].[DIM_Drivers] DD
  inner join dbo.DIM_Sites  DS on DS.SiteKey = dd.SiteKey
  inner join orgHier.Organisation ORG on ORG.OrganisationKey = DD.OrganisationKey 



GO
/****** Object:  View [Cube].[DimOrganisations]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[DimOrganisations]
GO
CREATE VIEW [Cube].[DimOrganisations]
as
SELECT  
Org.Name OrganisationName
,Org.Code OrganisationCode
,DO.[OrganisationKey]
,DO.[HostID]
,DO.[OrganisationName] OriginalOrganisationName
,DO.[DealerName]
,DO.[DealerTelNo]
,DO.[OrganisationGUID]
,DO.[MemberOfOrganisationKey]
,DO.[CountryCode]
,DO.[Language]
,DO.[IsActive]
,DO.[MapProviderKey]
,DO.[DBVersion]
,DO.[DutchTaxEventID]
,DO.[UTCOffsetKey]
,DO.[CreateBatchKey]
,DO.[UpdateBatchKey]
,ORG.OrganisationGroupKey 
FROM [dbo].[DIM_Organisations] DO
INNER JOIN orgHier.Organisation ORG ON ORG.OrganisationKey = DO.OrganisationKey
 
GO
/****** Object:  View [Cube].[Dim_EventDescriptions]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[Dim_EventDescriptions]
GO
CREATE VIEW [Cube].[Dim_EventDescriptions]
as
SELECT  DE.[EventDescriptionKey]
      ,DE.[OrganisationKey]
      ,DE.[HostID]
      ,DE.[EventName]
      ,DE.[ParameterKey]
      ,DE.[SummaryTypeLookupKey]
      ,DE.[CreateBatchKey]
      ,DE.[UpdateBatchKey]
	  ,ORG.OrganisationGroupKey
  FROM [dbo].[DIM_EventDescriptions] DE
  inner join orgHier.Organisation ORG on ORG.OrganisationKey = DE.OrganisationKey 


GO
/****** Object:  View [Cube].[Dim_Vehicles]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP  VIEW [Cube].[Dim_Vehicles]
GO
CREATE VIEW [Cube].[Dim_Vehicles]
as
SELECT 
[VehicleKey]
,DV.[OrganisationKey]
,case when [StartDateKey] < '1900-01-01' then '1900-01-01' else [StartDateKey] end [StartDateKey]
,case when [EndDateKey] < '1900-01-01' then '1900-01-01' else [EndDateKey] end [EndDateKey]
,[IsCurrentRecord]
,[IsActive]
,[HostID]
,[SiteKey]
,[VehicleGUID]
,[VehicleDescription]
,[SiteGUID]
,[LastServiceDateKey]
,[IsYellowEquip]
,[RegNumber]
,[ServiceByDistance]
,[ServiceByDate]
,[ServiceByEngineSeconds]
,[NextServiceDueDistance]
,[NextServiceDueDateKey]
,[NextServiceDueEngineSeconds]
,[DefaultDriverGUID]
,[TargetFuelConsumption]
,[TargetFuelConsumptionHourly]
,[ScoreTriggerOverspeeding]
,[ScoreTriggerOverRevving]
,[ScoreTriggerOverHarshDeceleration]
,[ScoreTriggerOverHarshAccelleration]
,[TermScriptConfigGroup]
,[ConfigurationGroupNameID]
,[ConfigurationGroupName]
,[FuelTypeLookupKey]
,[EstimateCO2EmissionGramsperKm]
,[UnitTypeLookupKey]
,[BatteryVoltage]
,[CurrentDeviceDriverVersion]
,[LastDeviceDriverUploadDateTime]
,[LastConfigurationUploadDateTime]
,[LastDeviceChangeDateTime]
,[LastEventChangeDateTime]
,[CreateDateKey]
,[IsMeasuringFuel]
,[IsCofiguredForMeasuringFuel]
,[UTCOffsetKey]
,[CreateBatchKey]
,[UpdateBatchKey]
,ORG.OrganisationGroupKey
FROM [dbo].[DIM_Vehicles] DV
INNER JOIN orgHier.Organisation ORG ON ORG.OrganisationKey = DV.OrganisationKey
WHERE Org.Active = 1
 
GO
/****** Object:  View [Cube].[DIM_Trailer]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[DIM_Trailer]
GO
CREATE VIEW [Cube].[DIM_Trailer]
AS
SELECT  DT.[TrailerKey],
  CASE 
    WHEN DT.[StartDateKey] < '1990-01-01' 
	  THEN '1990-01-01' 
	ELSE DT.[StartDateKey] 
  END [StartDateKey],
  CASE 
    WHEN DT.[EndDateKey] < '1990-01-01' 
	  THEN '1990-01-01' 
	ELSE DT.[EndDateKey] 
  END [EndDateKey],
  DT.[IsCurrentRecord],
  DT.[IsActive],
  DT.[OrganisationKey],
  DT.[HostID],
  DT.[TrailerGUID],
  DT.[TrailerAssetNumber],
  DT.[TrailerRegNumber],
  DT.[TrailerDescription],
  DT.[TrailerUnitID],
  DT.[SiteGUID],
  DT.[UnitTypeLookupKey],
  DT.[UTCOffsetKey],
  DT.[CreateBatchKey],
  DT.[UpdateBatchKey],
  ORG.[OrganisationGroupKey]
FROM [dbo].[DIM_Trailers] DT
INNER JOIN orgHier.Organisation ORG ON ORG.OrganisationKey = DT.OrganisationKey
WHERE Org.Active = 1
GO
/****** Object:  View [Cube].[DIM_Shapes]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP  VIEW [Cube].[DIM_Shapes]
GO
CREATE VIEW [Cube].[DIM_Shapes]
AS
SELECT 
  [ShapeKey],
  DS.[OrganisationKey],
  DS.[HostID],
  DS.[SiteKey],
  DS.[ShapeType],
  DS.[ShapeName],
  DS.[ShapeBoundaryType],
  DS.[ShapeBoundary],
  DS.[ShapeTaxTypeLookupKey],
  DS.[IsDeleted],
  DS.[CreateBatchKey],
  DS.[UpdateBatchKey],
  ORG.[OrganisationGroupKey]
FROM [dbo].[DIM_Shapes] DS
INNER JOIN [orgHier].[Organisation] ORG ON ORG.OrganisationKey = DS.OrganisationKey
GO
/****** Object:  View [Cube].[DIM_ReportingGroups]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP VIEW [Cube].[DIM_ReportingGroups]
GO

CREATE VIEW [Cube].[DIM_ReportingGroups]
AS
SELECT 
DRG.[ReportingGroupKey]
,DRG.[OrganisationKey]
,DRG.[ReportingGroupTypeLookupKey]
,DRG.[HostID]
,DRG.[ReportingGroupGUID]
,DRG.[ReportingGroupName]
,DV.VehicleKey
,DRG.[ReportingGroupParentKey]
,DRG.[CreateBatchKey]
,DRG.[UpdateBatchKey]
,ORG.OrganisationGroupKey 
FROM 
[dbo].[DIM_ReportingGroups] DRG
inner join [dbo].[DIM_Vehicles] DV on DRG.MemberGUID = DV.[VehicleGUID] and drg.OrganisationKey = dv.OrganisationKey
INNER JOIN orgHier.Organisation ORG ON ORG.OrganisationKey = DRG.OrganisationKey

 

GO
/****** Object:  View [Cube].[User_Hierarchy_Bridge]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[User_Hierarchy_Bridge]
GO
CREATE VIEW [Cube].[User_Hierarchy_Bridge]
AS
WITH
OrgSites(SiteKey, [OrgHierarchykey],OrganisationKey) AS
(
  SELECT
    [SiteKey] = CASE WHEN os.KeyShift < 0 THEN os.KeyShift -S.SiteKey ELSE S.SiteKey END,
    hs.OrgHierarchyKey,
    s.OrganisationKey
  FROM
    dbo.DIM_Sites S
    INNER JOIN [MiXAggregator].dbo.OrgShift            OS on OS.LocalKey = S.OrganisationKey
    INNER JOIN [MiXAggregator].orgHier.[HierarchySite] HS on hs.SiteKey = CASE WHEN os.KeyShift < 0 THEN os.KeyShift -S.SiteKey ELSE S.SiteKey END
  UNION ALL
  SELECT
    OS.SiteKey,
    oh.NodeParent,
    [OrganisationKey] = -1
  FROM
    OrgSites OS
      INNER JOIN
    [MiXAggregator].[orgHier].[OrgHierarchy] OH ON OH.Nodekey = os.OrgHierarchykey
  WHERE OH.NodeParent IS NOT NULL
)
--get users with access
SELECT
  UHB.UserKey,
  [SiteKey] = CASE WHEN o.KeyShift < 0 THEN o.KeyShift -S.SiteKey ELSE S.SiteKey END,
  org.OrganisationGroupKey,
  md.FMOnlineDBServerName + '\' +  u.LoginName [LoginName]
FROM OrgSites OS
inner join
[Cube].[Site] S on OS.SiteKey = S.SiteKey
inner join [MiXAggregator].[orgHier].[User_Hierarchy_Bridge] UHB on UHB.OrgHierarchykey  = Os.OrgHierarchykey
inner join [MiXAggregator].dbo.[User]                        u   on u.UserKey            = UHB.UserKey
inner join
[MiXAggregator].dbo.OrgShift                      O   on O.GroupKey    = s.OrganisationKey 
inner join
[MiXAggregator].dbo.Organisation                  org on org.OrganisationKey  = s.OrganisationKey
inner join [MiXAggregator].dbo.MachineDetails                MD  on MD.MachineDetailsKey = u.SourceMachineDetailsKey
union all
--all administrators have acces to all sites
select
  u.UserKey,
  [SiteKey] = CASE WHEN o.KeyShift < 0 THEN o.KeyShift -S.SiteKey ELSE S.SiteKey END,
  org.OrganisationGroupKey,
  md.FMOnlineDBServerName + '\' +  u.LoginName [LoginName] 
FROM
  [Cube].[Site] S
cross join (select u.UserKey from [MiXAggregator].dbo.[User] u where u.isAdministrator = 1  ) ad
inner join [MiXAggregator].dbo.[User]         u   on u.UserKey            = ad.UserKey
inner join [MiXAggregator].dbo.Organisation   org on org.OrganisationKey  = s.OrganisationKey
                                                    and org.OrganisationGroupKey = u.OrganisationGroupKey 
inner join [MiXAggregator].dbo.OrgShift       O   on O.GroupKey           = s.OrganisationKey 
inner join [MiXAggregator].dbo.MachineDetails MD  on MD.MachineDetailsKey = org.SourceMachineDetailsKey

GO
/****** Object:  View [Cube].[Dim_Dates]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[Dim_Dates]
GO
CREATE VIEW [Cube].[Dim_Dates] 

AS
SELECT [DateKey]
      ,DateID = CAST(CONVERT(varchar(8), DateKey, 112) as INT)
      ,[DayOfYear]
      ,[DayOfMonth]
      ,[DayOfWeek]
      ,[DayOfWeekLookupRID]
      ,[MonthOfYear]
      ,[MonthOfYearLookupRID]
      ,[WeekOfYear]
      ,[WeekOfMonth]
      ,[Year]
      ,[Quarter]
      ,[QuarterLookupRID]
      ,[IsLastDayOfMonth]
      ,[CreateBatchKey]
      ,[UpdateBatchKey]
  FROM [dbo].[DIM_Dates]
GO
/****** Object:  View [Cube].[Dim_Geography]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[Dim_Geography]
GO
CREATE VIEW [Cube].[Dim_Geography]
as

SELECT DG.[GeographyKey]
      ,DG.[Continent]
      ,DG.[Country]
      ,DG.[Region]
      ,DG.[City]
      ,DG.[Town]
      ,DG.[Suburb]
      ,DG.[PostCode]
      ,DG.[ReverseGeo]
      ,DG.[CreateBatchKey]
      ,DG.[UpdateBatchKey]
  FROM [dbo].[DIM_Geography] as DG
GO
/****** Object:  View [Cube].[DIM_TableColumnLookups]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
DROP VIEW [Cube].[DIM_TableColumnLookups]
GO
CREATE VIEW [Cube].[DIM_TableColumnLookups]
AS
SELECT
[LookupRID]
,[LookupTable]
,[LookupColumn]
,[LookupKey]
,[LabelText]
,[LabelResource]
,[CreateBatchKey]
,[UpdateBatchKey]
FROM [dbo].[DIM_TableColumnLookups]
GO
/****** Object:  View [Cube].[Dim_Time]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[Dim_Time]
GO
CREATE VIEW [Cube].[Dim_Time]
AS
SELECT TOP 1440 
  (ROW_NUMBER() over(order by dd.DateKey) -1) AS [TimeKey],
  cast(dateadd(MI,(ROW_NUMBER() over(order by dd.DateKey) -1),'1900-01-01 00:00:00.000') as time) [Time],
  right(cast(dateadd(MI,(ROW_NUMBER() over(order by dd.DateKey) -1),'1900-01-01 00:00:00.000')  as varchar(30)),7) [TimeName],
  DATEPART(HH,cast(dateadd(MI,(ROW_NUMBER() over(order by dd.DateKey) -1),'1900-01-01 00:00:00.000') as time)) [hourNumber],
  DATEPART(MI,cast(dateadd(MI,(ROW_NUMBER() over(order by dd.DateKey) -1),'1900-01-01 00:00:00.000') as time)) [MinuteNumber],
  CASE 
    WHEN DATEPART(HH,cast(dateadd(MI,(ROW_NUMBER() over(order by dd.DateKey) -1),'1900-01-01 00:00:00.000') as time)) <= 11 
	  THEN 'AM' 
	ELSE 'PM' 
  END [Period]
FROM [dbo].[DIM_Dates] dd
GO
/****** Object:  View [Cube].[Users]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[Users]
GO
CREATE VIEW [Cube].[Users]
AS
select 
	U.UserKey,
	md.FMOnlineDBServerName  +'\'+ u.LoginName [FMWebUserName],
	'' [ADUserName],
	u.OrganisationGroupKey,
	u.isAdministrator [isAdministrator]
from MiXAggregator.dbo.[User] U
inner join MiXAggregator.dbo.MachineDetails MD on u.SourceMachineDetailsKey = md.MachineDetailsKey 

GO
/****** Object:  View [Cube].[Users_Site_Bridge_ToDelete]    Script Date: 2012/12/05 10:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [Cube].[Users_Site_Bridge_ToDelete]
GO
CREATE VIEW [Cube].[Users_Site_Bridge_ToDelete]
AS
SELECT 
	[UserKey],
	[SiteKey]
FROM [orgHier].[Users_Site_Bridge]
where [IsActive] = 1


GO
