CREATE TABLE [ETL].[DWLoaderStepDetails] (
    [DWLoaderStepDetailsID]   INT            IDENTITY (1, 1) NOT NULL,
    [PackageLoadStepID]       INT            NOT NULL,
    [DWLoaderStepDetailsName] VARCHAR (255)  NOT NULL,
    [DWLoaderStepDetailsCode] VARCHAR (255)  NOT NULL,
    [Active]                  INT            CONSTRAINT [DF_DimDWLoaderStepDetails_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedOn]           DATETIME       CONSTRAINT [DF_DWLoaderStepDetails_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]           NVARCHAR (255) CONSTRAINT [DF_DWLoaderStepDetails_CreatedBy] DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]          DATETIME       CONSTRAINT [DF_DWLoaderStepDetails_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]          NVARCHAR (255) CONSTRAINT [DF_DWLoaderStepDetails_ModifiedBy] DEFAULT ('Unknown') NOT NULL,
    CONSTRAINT [PK_DWLoaderStepDetails] PRIMARY KEY CLUSTERED ([DWLoaderStepDetailsID] ASC) WITH (FILLFACTOR = 20),
    CONSTRAINT [FK_DWLoaderStepDetails_PackageLoad] FOREIGN KEY ([PackageLoadStepID]) REFERENCES [ETL].[PackageLoadStep] ([PackageLoadStepID])
);

