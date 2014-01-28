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
[dbo].Status
*************************************************************************************/
--Populate Status default entry
IF NOT EXISTS (SELECT 1
			   FROM [dbo].[Status]
			  )
BEGIN
	SET IDENTITY_INSERT [dbo].[Status] ON
	INSERT INTO [dbo].[Status]( StatusID
						, StatusName
						, [StatusDescription]
						)
	SELECT -1
		 , 'Busy'
		 , 'The request is currently busy'
	UNION
	SELECT 0
		 , 'Queued'
		 , 'The request has been queued'
	UNION
	SELECT 1
		 , 'Complete'
		 , 'The request has completed successfully'
	UNION
	SELECT 2
		 , 'Failed'
		 , 'The request has failed'
	SET IDENTITY_INSERT [dbo].[Status] OFF
END


/*************************************************************************************
[dbo].QueueLoadType
*************************************************************************************/
--Populate QueueLoadType default entry
IF NOT EXISTS (SELECT 1
			   FROM [dbo].[QueueLoadType]
			  )
BEGIN
	SET IDENTITY_INSERT [dbo].[QueueLoadType] ON
	INSERT INTO [dbo].[QueueLoadType]( QueueLoadTypeID
						, QueueLoadTypeName
						, QueueLoadTypeDescription
						)
	SELECT 1
		 , 'information_schema'
		 , 'information_schema logging'
	UNION
	SELECT 2
		 , 'package'
		 , 'SSIS packages'
	UNION
	SELECT 3
		 , 'cube process'
		 , 'cube processing'
	UNION
	SELECT 4
		 , 'balancing test'
		 , 'balancing tests'
	SET IDENTITY_INSERT [dbo].[QueueLoadType] OFF
END



/*************************************************************************************
[dbo].StepType
*************************************************************************************/
--Populate StepType default entry
IF NOT EXISTS (SELECT 1
			   FROM [dbo].[StepType]
			  )
BEGIN
	SET IDENTITY_INSERT [dbo].[StepType] ON
	INSERT INTO [dbo].[StepType]( StepTypeID
						, StepTypeName
						, StepTypeCode
						)
	SELECT 1
		 , 'Prerun'
		 , 'Prerun step such as information_schema compare'
	UNION
	SELECT 2
		 , 'TableLoad'
		 , 'Standard table load'
	UNION
	SELECT 3
		 , 'Postrun'
		 , 'Postrun step such as balancing tests'
	SET IDENTITY_INSERT [dbo].[StepType] OFF
END
