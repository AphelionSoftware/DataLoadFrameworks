/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : Frequency Type - Daily, Weekly, Monthly, Hourly, Minutes
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

CREATE TABLE [dbo].[FrequencyType] (
    [FrequencyTypeID]             INT           IDENTITY (1, 1) NOT NULL,
    [FrequencyTypeName]           VARCHAR (255) NOT NULL,
    [FrequencyTypeDescription]    VARCHAR (500) NULL,
	[sys_CreatedOn]   DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]   NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    CONSTRAINT [PK_FrequencyType] PRIMARY KEY CLUSTERED ([FrequencyTypeID] ASC)
);

