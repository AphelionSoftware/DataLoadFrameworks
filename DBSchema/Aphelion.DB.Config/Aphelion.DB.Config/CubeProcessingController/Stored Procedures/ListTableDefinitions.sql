/*
* @author Louis van der Merwe lsv@rmb.co.za
* 
*/
CREATE PROCEDURE [CubeProcessingController].[ListTableDefinitions]
	@Application varchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		   [DBTableName] as [Table]
		  ,[IsPartitioned] as [Is Partitioned]
	  FROM [CubeProcessingController].[Table] t, [CubeProcessingController].[Application] a
	  where t.ApplicationID = a.ID
	  and a.Name = @Application

END

