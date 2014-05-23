/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : All data loads - Loads will contain packages and their order of execution
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

CREATE TABLE [dbo].[PackageLoad] (
    [PackageLoadID]   INT            IDENTITY (1, 1) NOT NULL,
    [PackageLoadName] VARCHAR (255)  NOT NULL,
    [PackageLoadCode] VARCHAR (255)  NOT NULL,
	[MaxParallel]	  INT			 NULL,
    [Active]          INT            CONSTRAINT [DF_DimPackageLoad_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedOn]   DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]   NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    CONSTRAINT [PK_PackageLoad] PRIMARY KEY CLUSTERED ([PackageLoadID] ASC)
);

