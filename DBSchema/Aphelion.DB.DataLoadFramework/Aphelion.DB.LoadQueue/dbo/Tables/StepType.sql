/****************************************************************************************  
    COMMENTS:  
    ---------  
    Synopsis     : Types of package steps - prerun, postrun
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

CREATE TABLE [dbo].[StepType] (
    [StepTypeID]     INT            IDENTITY (1, 1) NOT NULL,
    [StepTypeName]   VARCHAR (255)  NOT NULL,
    [StepTypeCode]   VARCHAR (255)  NOT NULL,
    [Active]         INT            CONSTRAINT [DF_StepType_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedOn]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_CreatedBy]  NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    [sys_ModifiedOn] DATETIME       DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] NVARCHAR (255) DEFAULT ('Unknown') NOT NULL,
    CONSTRAINT [PK_StepType] PRIMARY KEY CLUSTERED ([StepTypeID] ASC) WITH (FILLFACTOR = 20)
);

