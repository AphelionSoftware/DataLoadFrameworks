CREATE TABLE [ETL].[PackageLoad] (
    [PackageLoadID]   INT            IDENTITY (1, 1) NOT NULL,
    [PackageLoadName] VARCHAR (255)  NOT NULL,
    [PackageLoadCode] VARCHAR (255)  NOT NULL,
    [Active]          INT            CONSTRAINT [DF_DimPackageLoad_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedOn]   DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]   NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    CONSTRAINT [PK_PackageLoad] PRIMARY KEY CLUSTERED ([PackageLoadID] ASC) WITH (FILLFACTOR = 20)
);

