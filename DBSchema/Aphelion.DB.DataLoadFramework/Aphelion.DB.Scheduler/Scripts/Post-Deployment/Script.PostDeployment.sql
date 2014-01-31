/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/*************************************************************************************
[dbo].[FrequencyType]
*************************************************************************************/
--Populate [FrequencyType] default entry
IF NOT EXISTS (SELECT 1
			   FROM [dbo].[FrequencyType]
			  )
BEGIN
	SET IDENTITY_INSERT [dbo].[FrequencyType] ON
	INSERT INTO [dbo].[FrequencyType]( FrequencyTypeID
						, FrequencyTypeName
						, FrequencyTypeDescription
						)
	SELECT 1
		 , 'Daily'
		 , NULL
	UNION
	SELECT 2
		 , 'Weekly'
		 , NULL
	UNION
	SELECT 3
		 , 'Monthly'
		 , NULL
	UNION
	SELECT 4
		 , 'Hourly'
		 , NULL
	UNION
	SELECT 5
		 , 'Minutes'
		 , NULL
	SET IDENTITY_INSERT [dbo].[FrequencyType] OFF
END

