/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : Types of statuses - queued, busy, complete, failed
				   -1 - Busy
				   0 - Queued
				   1 - Complete
				   2 - Failed
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

CREATE TABLE [dbo].[Status] (
    [StatusID]          INT           IDENTITY (1, 1) NOT NULL,
    [StatusName]        VARCHAR (255)  NOT NULL,
    [StatusDescription] VARCHAR (255) NOT NULL,
	[sys_CreatedOn]   DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]   NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED ([StatusID] ASC)
);

