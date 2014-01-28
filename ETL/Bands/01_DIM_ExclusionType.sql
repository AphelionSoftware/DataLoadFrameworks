
--DROP TABLE [dbo].[DIM_ExclusionType]
CREATE TABLE [dbo].[DIM_ExclusionType](
	[ExclusionTypeKey] [smallint] IDENTITY(1,1) NOT NULL,
	[ExclusionTypeName] [varchar](255) NULL,
	[ExclusionTypeCode] [varchar](10) NULL,
	[IsCurrentRecord] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreateBatchKey] [int] NULL,
	[UpdateBatchKey] [int] NULL,
 CONSTRAINT [PK_DIM_ExclusionTypes] PRIMARY KEY CLUSTERED 
(
	[ExclusionTypeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Dimensions]
) ON [Dimensions]

GO

SET ANSI_PADDING ON
GO


