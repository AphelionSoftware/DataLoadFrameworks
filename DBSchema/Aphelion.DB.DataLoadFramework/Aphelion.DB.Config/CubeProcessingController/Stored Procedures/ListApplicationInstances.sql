/*
* @author Louis van der Merwe lsv@rmb.co.za
* 
*/
CREATE PROCEDURE [CubeProcessingController].[ListApplicationInstances]	
	@Application varchar(255) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if (@Application is null)
	begin
		SELECT 
			   a.[Name] as [Application]
			  ,[ExternalReference] as [Instance]
			  ,i.[Description] as [Description]
		  FROM [CubeProcessingController].[ApplicationInstance] i, [CubeProcessingController].[Application] a
		  where a.ID = i.ApplicationID
	end
	else
		begin
			SELECT 
				   a.[Name] as [Application]
				  ,[ExternalReference] as [Instance]
				  ,i.[Description] as [Description]
			  FROM [CubeProcessingController].[ApplicationInstance] i, [CubeProcessingController].[Application] a
			  where a.ID = i.ApplicationID
			  and a.Name = @Application
		end
		  

END

