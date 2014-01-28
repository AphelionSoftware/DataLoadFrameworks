--drop  TABLE [dbo].[DIM_ExclusionReason]


CREATE TABLE [dbo].[DIM_ExclusionReason](
	[ExclusionReasonKey] [smallint] IDENTITY(1,1) NOT NULL,
	[ExclusionReasonName] [varchar](255) NOT NULL,
	[ExclusionTypeKey] [smallint] NOT NULL,
	[ExclusionLevelKey] [smallint] NOT NULL,
	[DAXDateFieldName] [varchar](255) NULL,
	[DAXFieldName] [varchar](255) NOT NULL,
	[DAXKeyFieldName] [varchar](255) NULL,
	[DAXObjectKeyFieldName] [varchar](255) NULL,
	[DestinationFieldName] [varchar](255) NULL,
	[BoundaryValue] [float] NOT NULL,
	[BoundaryComparison] [char](2) NOT NULL,	
	[SecondaryBoundaryValue] [float] NOT NULL DEFAULT 0,
	[SecondaryComparison] [char](2) NOT NULL DEFAULT '',		
	[IsCurrentRecord] [bit] NULL,
	[IsActive] [bit] NOT NULL,
	[CreateBatchKey] [int] NULL,
	[UpdateBatchKey] [int] NULL,
	[OrganisationGroupKey] [int] NOT NULL,
 CONSTRAINT [PK_DIM_ExclusionReasons] PRIMARY KEY CLUSTERED 
(
	[ExclusionReasonKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Dimensions]
) ON [Dimensions]

GO

SET ANSI_PADDING ON
GO

ALTER TABLE [dbo].[DIM_ExclusionReason] ADD  CONSTRAINT [DF_DIM_ExclusionReason_DimExclusionTypeKey]  DEFAULT ((0)) FOR [ExclusionTypeKey]
GO

ALTER TABLE [dbo].[DIM_ExclusionReason] ADD  CONSTRAINT [DF_DIM_ExclusionReason_DimExclusionLevelKey]  DEFAULT ((0)) FOR [ExclusionLevelKey]
GO

ALTER TABLE [dbo].[DIM_ExclusionReason] ADD  CONSTRAINT [DF_DIM_ExclusionReason_BoundaryComparison]  DEFAULT (' =') FOR [BoundaryComparison]
GO

ALTER TABLE [dbo].[DIM_ExclusionReason] ADD  CONSTRAINT [DF_DIM_ExclusionReason_OrganisationGroupKey]  DEFAULT ((1)) FOR [OrganisationGroupKey]
GO
/*
ALTER TABLE [dbo].[DIM_ExclusionReason]  WITH CHECK ADD  CONSTRAINT [FK_DIM_ExclusionReason_DIM_ExclusionLevel] FOREIGN KEY([DimExclusionLevelKey])
REFERENCES [dbo].[DIM_ExclusionLevel] ([ExclusionLevelKey])
GO

ALTER TABLE [dbo].[DIM_ExclusionReason] CHECK CONSTRAINT [FK_DIM_ExclusionReason_DIM_ExclusionLevel]
GO

ALTER TABLE [dbo].[DIM_ExclusionReason]  WITH CHECK ADD  CONSTRAINT [FK_DIM_ExclusionReason_DIM_ExclusionType] FOREIGN KEY([DimExclusionTypeKey])
REFERENCES [dbo].[DIM_ExclusionType] ([ExclusionTypeKey])
GO

ALTER TABLE [dbo].[DIM_ExclusionReason] CHECK CONSTRAINT [FK_DIM_ExclusionReason_DIM_ExclusionType]
GO*/