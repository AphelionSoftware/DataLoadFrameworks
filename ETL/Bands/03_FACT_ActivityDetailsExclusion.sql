--DROP TABLE [dbo].[FACT_ActivityDetailsExclusion]
CREATE TABLE [dbo].[FACT_ActivityDetailsExclusion](
    [ActivityDetailsExclusionKey]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [ActivityDetailKey]                       BIGINT         NOT NULL,
    [ActivityStartDateKey]                    DATE           NOT NULL,
    [ActivityExclusionDateKey]                DATE           NOT NULL,
    [ActivitySummaryKey]                      BIGINT         NOT NULL,
    [OrganisationKey]                         INT            NOT NULL,
    [VehicleKey]                              INT            NULL,
    [ExcludeOdometerReasonID]                 SMALLINT       NULL,
    [ExcludeEngineSecondsReasonID]            SMALLINT       NULL,
    [ExcludeDistanceReasonID]                 SMALLINT       NULL,
    [ExcludeDurationReasonID]                 SMALLINT       NULL,
    [ExcludeDrivingTimeReasonID]              SMALLINT       NULL,
    [ExcludeStandingTimeReasonID]             SMALLINT       NULL,
    [ExcludeMaxSpeedReasonID]                 SMALLINT       NULL,
    [ExcludeSpeedTimeReasonID]                SMALLINT       NULL,
    [ExcludeSpeedOccursReasonID]              SMALLINT       NULL,
    [ExcludeMaxBrakingReasonID]               SMALLINT       NULL,
    [ExcludeBrakeTimeReasonID]                SMALLINT       NULL,
    [ExcludeBrakeOccursReasonID]              SMALLINT       NULL,
    [ExcludeMaxAccelReasonID]                 SMALLINT       NULL,
    [ExcludeAccelTimeReasonID]                SMALLINT       NULL,
    [ExcludeAccelOccursReasonID]              SMALLINT       NULL,
    [ExcludeMaxRPReasonID]                    SMALLINT       NULL,
    [ExcludeRPMTimeReasonID]                  SMALLINT       NULL,
    [ExcludeRPMOccursReasonID]                SMALLINT       NULL,
    [ExcludeOutOfGreenBandTimeReasonID]       SMALLINT       NULL,
    [ExcludeExcessiveIdleTimeReasonID]        SMALLINT       NULL,
    [ExcludeExcessiveIdleOccursReasonID]      SMALLINT       NULL,
    [ExcludeIdleTimeReasonID]                 SMALLINT       NULL,
    [ExcludeEngineSecondsTimeReasonID]        SMALLINT       NULL,
    [ExcludeNoGoZoneEntryReasonID]            SMALLINT       NULL,
    [ExcludePassengersReasonID]               SMALLINT       NULL,
    [ExcludeFuelUsedMeasuredReasonID]         SMALLINT       NULL,
    [ExcludeFuelUsedCalculatedReasonID]       SMALLINT       NULL,
    [ExcludeNightDurationReasonID]            SMALLINT       NULL,
    [ExcludeAfterHoursDurationReasonID]       SMALLINT       NULL,
    [ExcludeTotalCarbonEmissionReasonID]      SMALLINT       NULL,
    [ExcludeTotalCO2EmissionReasonID]         SMALLINT       NULL,
    [ExcludeRoadSpeedTimeReasonID]            SMALLINT       NULL,
    [ExcludeRoadSpeedOccursReasonID]          SMALLINT       NULL,
    [ActivityDetailExclusionConfirmedID]      SMALLINT       NULL,
    [ActivityDetailExclusionComment]          NVARCHAR (MAX) NULL,
    [ActivityDetailExclusionConfirmedDateKey] DATE           NULL,
  CONSTRAINT [PK_FACT_ActivityDetailsExclusion] PRIMARY KEY CLUSTERED 
(
  [ActivityStartDateKey] ASC,
  [ActivityDetailsExclusionKey] ASC
) 
) ON [MonthPartitions] (ActivityStartDateKey)
GO
/*
ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeAccelOccursReasonID FOREIGN KEY
  (
  ExcludeAccelOccursReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
  GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeAccelTimeReasonID FOREIGN KEY
  (
  ExcludeAccelTimeReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeAfterHoursDurationReasonID FOREIGN KEY
  (
  ExcludeAfterHoursDurationReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeBrakeOccursReasonID FOREIGN KEY
  (
  ExcludeBrakeOccursReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeBrakeTimeReasonID FOREIGN KEY
  (
  ExcludeBrakeTimeReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeDistanceReasonID FOREIGN KEY
  (
  ExcludeDistanceReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeDrivingTimeReasonID FOREIGN KEY
  (
  ExcludeDrivingTimeReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeDurationReasonID FOREIGN KEY
  (
  ExcludeDurationReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
	FK_FACT_ActivityDetailsExclusion_ExcludeEngineSecondsReasonID FOREIGN KEY
	(
	ExcludeEngineSecondsReasonID
	) REFERENCES dbo.DIM_ExclusionReason
	(
	ExclusionReasonKey
	)
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeEngineSecondsTimeReasonID FOREIGN KEY
  (
  ExcludeEngineSecondsTimeReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeExcessiveIdleOccursReasonID FOREIGN KEY
  (
  ExcludeExcessiveIdleOccursReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeExcessiveIdleTimeReasonID FOREIGN KEY
  (
  ExcludeExcessiveIdleTimeReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeFuelUsedMeasuredReasonID FOREIGN KEY
  (
  ExcludeFuelUsedMeasuredReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeFueUsedCalculatedReasonID FOREIGN KEY
  (
  ExcludeFuelUsedCalculatedReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeIdleTimeReasonID FOREIGN KEY
  (
  ExcludeIdleTimeReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeMaxAccelReasonID FOREIGN KEY
  (
  ExcludeMaxAccelReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeMaxBrakingReasonID FOREIGN KEY
  (
  ExcludeMaxBrakingReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeMaxRPReasonID FOREIGN KEY
  (
  ExcludeMaxRPReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeMaxSpeedReasonID FOREIGN KEY
  (
  ExcludeMaxSpeedReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeNightDurationReasonID FOREIGN KEY
  (
  ExcludeNightDurationReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeNoGoZoneEntryReasonID FOREIGN KEY
  (
  ExcludeNoGoZoneEntryReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeOdometerReasonID FOREIGN KEY
  (
  ExcludeOdometerReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeOutOfGreenBandTimeReasonID FOREIGN KEY
  (
  ExcludeOutOfGreenBandTimeReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludePassengersReasonID FOREIGN KEY
  (
  ExcludePassengersReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeRoadSpeedOccursReasonID FOREIGN KEY
  (
  ExcludeRoadSpeedOccursReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeRoadSpeedTimeReasonID FOREIGN KEY
  (
  ExcludeRoadSpeedTimeReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeRPMOccursReasonID FOREIGN KEY
  (
  ExcludeRPMOccursReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeRPMTimeReasonID FOREIGN KEY
  (
  ExcludeRPMTimeReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeSpeedOccursReasonID FOREIGN KEY
  (
  ExcludeSpeedOccursReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeSpeedTimeReasonID FOREIGN KEY
  (
  ExcludeSpeedTimeReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeStandingTimeReasonID FOREIGN KEY
  (
  ExcludeStandingTimeReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeTotalCarbonEmissionReasonID FOREIGN KEY
  (
  ExcludeTotalCarbonEmissionReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ExcludeTotalCO2EmissionReasonID FOREIGN KEY
  (
  ExcludeTotalCO2EmissionReasonID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
  FK_FACT_ActivityDetailsExclusion_ActivityDetailExclusionConfirmedID FOREIGN KEY
  (
  ActivityDetailExclusionConfirmedID
  ) REFERENCES dbo.DIM_ExclusionReason
  (
  ExclusionReasonKey
  )
GO

*/