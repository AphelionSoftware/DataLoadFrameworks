/*DIM_ExclusionReasons*/

ALTER TABLE [dbo].[DIM_ExclusionReason]  WITH CHECK ADD  CONSTRAINT [FK_DIM_ExclusionReason_DIM_ExclusionLevel] FOREIGN KEY([ExclusionLevelKey])
REFERENCES [dbo].[DIM_ExclusionLevel] ([ExclusionLevelKey])
GO

ALTER TABLE [dbo].[DIM_ExclusionReason] CHECK CONSTRAINT [FK_DIM_ExclusionReason_DIM_ExclusionLevel]
GO

ALTER TABLE [dbo].[DIM_ExclusionReason]  WITH CHECK ADD  CONSTRAINT [FK_DIM_ExclusionReason_DIM_ExclusionType] FOREIGN KEY([ExclusionTypeKey])
REFERENCES [dbo].[DIM_ExclusionType] ([ExclusionTypeKey])
GO

ALTER TABLE [dbo].[DIM_ExclusionReason] CHECK CONSTRAINT [FK_DIM_ExclusionReason_DIM_ExclusionType]
GO

/*FACT_ActivityDetailsExclusion*/

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ActivityDetailExclusionConfirmedID] FOREIGN KEY([ActivityDetailExclusionConfirmedID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ActivityDetailExclusionConfirmedID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeAccelOccursReasonID] FOREIGN KEY([ExcludeAccelOccursReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeAccelOccursReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeAccelTimeReasonID] FOREIGN KEY([ExcludeAccelTimeReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeAccelTimeReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeAfterHoursDurationReasonID] FOREIGN KEY([ExcludeAfterHoursDurationReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeAfterHoursDurationReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeBrakeOccursReasonID] FOREIGN KEY([ExcludeBrakeOccursReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeBrakeOccursReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeBrakeTimeReasonID] FOREIGN KEY([ExcludeBrakeTimeReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeBrakeTimeReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeDistanceReasonID] FOREIGN KEY([ExcludeDistanceReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeDistanceReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeDrivingTimeReasonID] FOREIGN KEY([ExcludeDrivingTimeReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeDrivingTimeReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeDurationReasonID] FOREIGN KEY([ExcludeDurationReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeDurationReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeEngineSecondsReasonID] FOREIGN KEY([ExcludeEngineSecondsReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeEngineSecondsReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeEngineSecondsTimeReasonID] FOREIGN KEY([ExcludeEngineSecondsTimeReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeEngineSecondsTimeReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeExcessiveIdleOccursReasonID] FOREIGN KEY([ExcludeExcessiveIdleOccursReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeExcessiveIdleOccursReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeExcessiveIdleTimeReasonID] FOREIGN KEY([ExcludeExcessiveIdleTimeReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeExcessiveIdleTimeReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeFuelUsedMeasuredReasonID] FOREIGN KEY([ExcludeFuelUsedMeasuredReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeFuelUsedMeasuredReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeFueUsedCalculatedReasonID] FOREIGN KEY([ExcludeFuelUsedCalculatedReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeFueUsedCalculatedReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeIdleTimeReasonID] FOREIGN KEY([ExcludeIdleTimeReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeIdleTimeReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeMaxAccelReasonID] FOREIGN KEY([ExcludeMaxAccelReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeMaxAccelReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeMaxBrakingReasonID] FOREIGN KEY([ExcludeMaxBrakingReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeMaxBrakingReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeMaxRPReasonID] FOREIGN KEY([ExcludeMaxRPReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeMaxRPReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeMaxSpeedReasonID] FOREIGN KEY([ExcludeMaxSpeedReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeMaxSpeedReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeNightDurationReasonID] FOREIGN KEY([ExcludeNightDurationReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeNightDurationReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeNoGoZoneEntryReasonID] FOREIGN KEY([ExcludeNoGoZoneEntryReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeNoGoZoneEntryReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeOdometerReasonID] FOREIGN KEY([ExcludeOdometerReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeOdometerReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeOutOfGreenBandTimeReasonID] FOREIGN KEY([ExcludeOutOfGreenBandTimeReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeOutOfGreenBandTimeReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludePassengersReasonID] FOREIGN KEY([ExcludePassengersReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludePassengersReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeRoadSpeedOccursReasonID] FOREIGN KEY([ExcludeRoadSpeedOccursReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeRoadSpeedOccursReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeRoadSpeedTimeReasonID] FOREIGN KEY([ExcludeRoadSpeedTimeReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeRoadSpeedTimeReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeRPMOccursReasonID] FOREIGN KEY([ExcludeRPMOccursReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeRPMOccursReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeRPMTimeReasonID] FOREIGN KEY([ExcludeRPMTimeReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeRPMTimeReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeSpeedOccursReasonID] FOREIGN KEY([ExcludeSpeedOccursReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeSpeedOccursReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeSpeedTimeReasonID] FOREIGN KEY([ExcludeSpeedTimeReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeSpeedTimeReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeStandingTimeReasonID] FOREIGN KEY([ExcludeStandingTimeReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeStandingTimeReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeTotalCarbonEmissionReasonID] FOREIGN KEY([ExcludeTotalCarbonEmissionReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeTotalCarbonEmissionReasonID]
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeTotalCO2EmissionReasonID] FOREIGN KEY([ExcludeTotalCO2EmissionReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_ActivityDetailsExclusion] CHECK CONSTRAINT [FK_FACT_ActivityDetailsExclusion_ExcludeTotalCO2EmissionReasonID]
GO




/*FACT_VehicleExclusion*/

ALTER TABLE [dbo].[FACT_VehicleExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_VehicleExclusion_DIM_Organisations] FOREIGN KEY([OrganisationKey])
REFERENCES [dbo].[DIM_Organisations] ([OrganisationKey])
GO

ALTER TABLE [dbo].[FACT_VehicleExclusion] CHECK CONSTRAINT [FK_FACT_VehicleExclusion_DIM_Organisations]
GO

ALTER TABLE [dbo].[FACT_VehicleExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_VehicleExclusion_ExcludeVehicleReasonID] FOREIGN KEY([ExcludeVehicleReasonID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_VehicleExclusion] CHECK CONSTRAINT [FK_FACT_VehicleExclusion_ExcludeVehicleReasonID]
GO

ALTER TABLE [dbo].[FACT_VehicleExclusion]  WITH CHECK ADD  CONSTRAINT [FK_FACT_VehicleExclusion_VehicleExclusionConfirmedID] FOREIGN KEY([VehicleExclusionConfirmedID])
REFERENCES [dbo].[DIM_ExclusionReason] ([ExclusionReasonKey])
GO

ALTER TABLE [dbo].[FACT_VehicleExclusion] CHECK CONSTRAINT [FK_FACT_VehicleExclusion_VehicleExclusionConfirmedID]
GO