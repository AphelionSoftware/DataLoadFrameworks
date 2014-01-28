

CREATE TABLE [dbo].[DIM_ExclusionLevel](
	[ExclusionLevelKey] [smallint] IDENTITY(1,1) NOT NULL,
	[ExclusionLevelName] [varchar](255) NOT NULL,
	[ExclusionLevelCode] [varchar](20) NOT NULL,
	[CompareValueLevelCode] [varchar](10) NOT NULL,
	[CompareValueLevelName] [varchar](255) NOT NULL,
	[CompareToLevelCode] [varchar](10) NOT NULL,
	[CompareToLevelName] [varchar](255) NOT NULL,
	[DestinationTableName] [varchar](255) NOT NULL,
	[IsCurrentRecord] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreateBatchKey] [int] NULL,
	[UpdateBatchKey] [int] NULL,
 CONSTRAINT [PK_DIM_ExclusionLevels] PRIMARY KEY CLUSTERED 
(
	[ExclusionLevelKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Dimensions]
) ON [Dimensions]

GO

SET ANSI_PADDING ON
GO


