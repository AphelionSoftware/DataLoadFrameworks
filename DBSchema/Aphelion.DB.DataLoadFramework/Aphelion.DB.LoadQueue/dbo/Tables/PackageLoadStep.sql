/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : Packages in a load as well as their step order
				   Steps with same PackageLoadStepOrder can run in parallel
    Author       : Geoffrey Smith Aphelion Software
    Date         : 28 Jan 2014
    Version      : 1.0
    Referenced By: 
    References   : 
    ------------------------------------------------------------------------------------------  

           
    History:  
    --------  
    Date       Modifier    Version  Reason  
    --------   ----------  -------- -------  

      

**********************************************************************************************/

CREATE TABLE [dbo].[PackageLoadStep] (
    [PackageLoadStepID]   INT            IDENTITY (1, 1) NOT NULL,
    [PackageLoadID]       INT            NOT NULL,
    [StepTypeID]          INT            NOT NULL,
	[PackageID]			  INT			 NOT NULL,
    [PackageLoadStepName] VARCHAR (255)  NOT NULL,
    [PackageLoadStepCode] VARCHAR (255)  NOT NULL,
	[PackageLoadStepOrder] INT NOT NULL,
    [Active]              INT            CONSTRAINT [DF_DimPackageLoadStep_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedOn]   DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]   NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    CONSTRAINT [PK_PackageLoadStep] PRIMARY KEY CLUSTERED ([PackageLoadStepID] ASC) WITH (FILLFACTOR = 20),
    CONSTRAINT [FK_PackageLoadStep_PackageLoad] FOREIGN KEY ([PackageLoadID]) REFERENCES [dbo].[PackageLoad] ([PackageLoadID]),
    CONSTRAINT [FK_PackageLoadStep_StepType] FOREIGN KEY ([StepTypeID]) REFERENCES [dbo].[StepType] ([StepTypeID]),
	CONSTRAINT [FK_PackageLoadStep_Package] FOREIGN KEY ([PackageID]) REFERENCES [dbo].[Package] ([PackageID])
);

