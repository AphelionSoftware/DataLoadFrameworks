/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : Application
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

CREATE TABLE [dbo].[Application] (
    [ApplicationID]             INT           IDENTITY (1, 1) NOT NULL,
    [ApplicationName]           VARCHAR (255) NOT NULL,
    [ApplicationDescription]    VARCHAR (500) NULL,
    [DatabaseServer] VARCHAR (255) NOT NULL, 
    [DatabaseName] VARCHAR(255) NOT NULL, 
    [CubeServer] VARCHAR(255) NULL, 
    [CubeName] VARCHAR(255) NULL, 
	[LogServer] VARCHAR(255) NULL,
	[TargetMachine] NVARCHAR(500) NULL,
	[LoadQueueServer] VARCHAR(255) NULL,
	[LoadQueueDatabaseName] VARCHAR(255) NULL,
	[LoadQueueUsername] VARCHAR(255) NULL,
	[LoadQueuePassword] VARCHAR(255) NULL,
    [AdminEmail] VARCHAR(255) NULL, 
	[sys_CreatedOn]   DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]   NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED ([ApplicationID] ASC)
);

