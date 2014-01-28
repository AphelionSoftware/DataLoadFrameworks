/*
* @author Louis van der Merwe lsv@rmb.co.za
* 
*/
CREATE PROCEDURE [dbo].[ListApplications]
AS
BEGIN
	SET NOCOUNT ON;

		SELECT 
			   [Name] as [Application]
			  ,[Description] as [Description]
		  FROM [dbo].[Application]

END