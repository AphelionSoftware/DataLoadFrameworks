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
ErrorDefinition
*************************************************************************************/
--Populate ErrorDefinition default entry
IF NOT EXISTS (SELECT 1
			   FROM ErrorDefinition
			  )
BEGIN
	SET IDENTITY_INSERT ErrorDefinition ON
	INSERT INTO ErrorDefinition( ID
							   , [Description]
							   , isWarning
							   )
	SELECT 1
		 , 'General Error'
		 , 0
	UNION
	SELECT 2
		 , 'General Warning'
		 , 1
	UNION
	SELECT 3
		 , 'Processing Error'
		 , 0
	SET IDENTITY_INSERT ErrorDefinition OFF
END


/*************************************************************************************
Status
*************************************************************************************/
--Populate ErrorDefinition default entry
IF NOT EXISTS (SELECT 1
			   FROM [Status]
			  )
BEGIN
	SET IDENTITY_INSERT [Status] ON
	INSERT INTO [Status]( ID
						, Name
						, [Description]
						)
	SELECT -1
		 , 'Processing'
		 , 'The request is currently busy processing'
	UNION
	SELECT 0
		 , 'Queued'
		 , 'The request has been queued for processing'
	UNION
	SELECT 1
		 , 'Complete'
		 , 'The request has been processed successfully'
	UNION
	SELECT 2
		 , 'Failed'
		 , 'The request has failed to process successfully'
	SET IDENTITY_INSERT [Status] OFF
END