--DROP TABLE [dbo].[FACT_VehicleExclusion]
CREATE TABLE [dbo].[FACT_VehicleExclusion](
	[VehicleExclusionKey] [int] IDENTITY(1,1) NOT NULL,
	[VehicleKey] [int] NULL,
	[VehicleExclusionDateKey] [date] NOT NULL,
	[ExcludeVehicleReasonID] [smallint] NULL,
	[VehicleExclusionConfirmedID] [smallint] NULL,
	[VehicleExclusionComment] [nvarchar](max) NULL,
	[VehicleExclusionConfirmedDateKey] [date] NULL,
	[OrganisationKey] [int] NOT NULL,
 CONSTRAINT [PK_FACT_VehicleExclusion] PRIMARY KEY CLUSTERED 
(
	[VehicleExclusionDateKey] ASC,
	[VehicleExclusionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/*
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
*/