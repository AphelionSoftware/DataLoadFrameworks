﻿/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : All cube tables and source database table detail
				   Specific for cube tables
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

CREATE TABLE [dbo].[CubeTable] (
    [CubeTableID]              INT           IDENTITY (1, 1) NOT NULL,
    [ApplicationID]   INT           NOT NULL,
    [TableName]     VARCHAR (255) NOT NULL,
    [CubeTableName]   VARCHAR (255) NOT NULL,
    [IsPartitioned]   BIT           CONSTRAINT [DF_TableDefinition_IsPartitioned] DEFAULT ((0)) NOT NULL,
    [PartitionColumn] VARCHAR (50)  NULL,
	[sys_CreatedOn]   DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]   NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    CONSTRAINT [PK_CubeTable] PRIMARY KEY CLUSTERED ([CubeTableID] ASC),
    CONSTRAINT [FK_CubeTable_Application] FOREIGN KEY ([ApplicationID]) REFERENCES [dbo].[Application] ([ApplicationID])
);

