CREATE TABLE [ETL].[PackageLoadStep] (
    [PackageLoadStepID]   INT            IDENTITY (1, 1) NOT NULL,
    [PackageLoadID]       INT            NOT NULL,
    [StepTypeID]          INT            NOT NULL,
    [PackageLoadStepName] VARCHAR (255)  NOT NULL,
    [PackageLoadStepCode] VARCHAR (255)  NOT NULL,
    [Active]              INT            CONSTRAINT [DF_DimPackageLoadStep_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedOn]       DATETIME       CONSTRAINT [DF__PackageLo__sys_C__34C8D9D1] DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]       NVARCHAR (255) CONSTRAINT [DF__PackageLo__sys_C__35BCFE0A] DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]      DATETIME       CONSTRAINT [DF__PackageLo__sys_M__36B12243] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]      NVARCHAR (255) CONSTRAINT [DF__PackageLo__sys_M__37A5467C] DEFAULT ('Unknown') NOT NULL,
    CONSTRAINT [PK_PackageLoadStep] PRIMARY KEY CLUSTERED ([PackageLoadStepID] ASC) WITH (FILLFACTOR = 20),
    CONSTRAINT [FK_PackageLoadStep_PackageLoad] FOREIGN KEY ([PackageLoadID]) REFERENCES [ETL].[PackageLoad] ([PackageLoadID]),
    CONSTRAINT [FK_PackageLoadStep_PackageLoadStep] FOREIGN KEY ([PackageLoadStepID]) REFERENCES [ETL].[PackageLoadStep] ([PackageLoadStepID]),
    CONSTRAINT [FK_PackageLoadStep_StepType] FOREIGN KEY ([StepTypeID]) REFERENCES [ETL].[StepType] ([StepTypeID])
);

