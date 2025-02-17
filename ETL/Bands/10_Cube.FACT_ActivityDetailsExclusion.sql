CREATE VIEW Cube.[FACT_ActivityDetailsExclusion]
AS
SELECT  FADE.[ActivityDetailsExclusionKey]
      ,FADE.[ActivityDetailKey]
      ,FADE.[ActivityStartDateKey]
      ,FADE.[ActivityExclusionDateKey]
      ,FADE.[ActivitySummaryKey]
      ,FADE.[OrganisationKey]
      ,FADE.[VehicleKey]
      ,FADE.[ExcludeOdometerReasonID]
      ,FADE.[ExcludeEngineSecondsReasonID]
      ,FADE.[ExcludeDistanceReasonID]
      ,FADE.[ExcludeDurationReasonID]
      ,FADE.[ExcludeDrivingTimeReasonID]
      ,FADE.[ExcludeStandingTimeReasonID]
      ,FADE.[ExcludeMaxSpeedReasonID]
      ,FADE.[ExcludeSpeedTimeReasonID]
      ,FADE.[ExcludeSpeedOccursReasonID]
      ,FADE.[ExcludeMaxBrakingReasonID]
      ,FADE.[ExcludeBrakeTimeReasonID]
      ,FADE.[ExcludeBrakeOccursReasonID]
      ,FADE.[ExcludeMaxAccelReasonID]
      ,FADE.[ExcludeAccelTimeReasonID]
      ,FADE.[ExcludeAccelOccursReasonID]
      ,FADE.[ExcludeMaxRPReasonID]
      ,FADE.[ExcludeRPMTimeReasonID]
      ,FADE.[ExcludeRPMOccursReasonID]
      ,FADE.[ExcludeOutOfGreenBandTimeReasonID]
      ,FADE.[ExcludeExcessiveIdleTimeReasonID]
      ,FADE.[ExcludeExcessiveIdleOccursReasonID]
      ,FADE.[ExcludeIdleTimeReasonID]
      ,FADE.[ExcludeEngineSecondsTimeReasonID]
      ,FADE.[ExcludeNoGoZoneEntryReasonID]
      ,FADE.[ExcludePassengersReasonID]
      ,FADE.[ExcludeFuelUsedMeasuredReasonID]
      ,FADE.[ExcludeFuelUsedCalculatedReasonID]
      ,FADE.[ExcludeNightDurationReasonID]
      ,FADE.[ExcludeAfterHoursDurationReasonID]
      ,FADE.[ExcludeTotalCarbonEmissionReasonID]
      ,FADE.[ExcludeTotalCO2EmissionReasonID]
      ,FADE.[ExcludeRoadSpeedTimeReasonID]
      ,FADE.[ExcludeRoadSpeedOccursReasonID]
      ,FADE.[ActivityDetailExclusionConfirmedID]
      ,FADE.[ActivityDetailExclusionComment]
      ,FADE.[ActivityDetailExclusionConfirmedDateKey]
	  ,/*DECLARE @str varchar(5000) = 'COALESCE(FADE.ActivityDetailExclusionConfirmedID ' 


select  @str = @str + ' 
,FADE.' + column_name from INFORMATION_SCHEMA.COLUMNS
where table_name = 'FACT_ActivityDetailsExclusion'
and column_name like '%reason%'
and table_schema = 'dbo'
order by column_name

set @str  = @str + ')'

select @str*/
		  COALESCE(FADE.ActivityDetailExclusionConfirmedID  
			,FADE.ExcludeAccelOccursReasonID 
			,FADE.ExcludeAccelTimeReasonID 
			,FADE.ExcludeAfterHoursDurationReasonID 
			,FADE.ExcludeBrakeOccursReasonID 
			,FADE.ExcludeBrakeTimeReasonID 
			,FADE.ExcludeDistanceReasonID 
			,FADE.ExcludeDrivingTimeReasonID 
			,FADE.ExcludeDurationReasonID 
			,FADE.ExcludeEngineSecondsReasonID 
			,FADE.ExcludeEngineSecondsTimeReasonID 
			,FADE.ExcludeExcessiveIdleOccursReasonID 
			,FADE.ExcludeExcessiveIdleTimeReasonID 
			,FADE.ExcludeFuelUsedCalculatedReasonID 
			,FADE.ExcludeFuelUsedMeasuredReasonID 
			,FADE.ExcludeIdleTimeReasonID 
			,FADE.ExcludeMaxAccelReasonID 
			,FADE.ExcludeMaxBrakingReasonID 
			,FADE.ExcludeMaxRPReasonID 
			,FADE.ExcludeMaxSpeedReasonID 
			,FADE.ExcludeNightDurationReasonID 
			,FADE.ExcludeNoGoZoneEntryReasonID 
			,FADE.ExcludeOdometerReasonID 
			,FADE.ExcludeOutOfGreenBandTimeReasonID 
			,FADE.ExcludePassengersReasonID 
			,FADE.ExcludeRoadSpeedOccursReasonID 
			,FADE.ExcludeRoadSpeedTimeReasonID 
			,FADE.ExcludeRPMOccursReasonID 
			,FADE.ExcludeRPMTimeReasonID 
			,FADE.ExcludeSpeedOccursReasonID 
			,FADE.ExcludeSpeedTimeReasonID 
			,FADE.ExcludeStandingTimeReasonID 
			,FADE.ExcludeTotalCarbonEmissionReasonID 
			,FADE.ExcludeTotalCO2EmissionReasonID
			) AS FirstExclusionReasonID
	  ,Org.OrganisationGroupKey
  FROM [dbo].[FACT_ActivityDetailsExclusion] FADE
INNER JOIN orgHier.Organisation Org
  ON FADE.OrganisationKey = Org.dboOrganisationKey
  WHERE Org.Active = 1


