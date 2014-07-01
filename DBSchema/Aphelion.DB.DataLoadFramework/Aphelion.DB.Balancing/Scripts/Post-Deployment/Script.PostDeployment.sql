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

IF NOT EXISTS (SELECT TOP 1 1 FROM dbo.Number)
BEGIN
	DECLARE @i	INT = 1
		  , @j	INT = 10000
	WHILE @i <= @j
	BEGIN
		INSERT INTO dbo.Number
		SELECT @i

		SET @i = @i + 1
	END
END