-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE Procedure [CubeProcessingController].[ProcessBatch]
	@JobID varchar(255)
as

begin

	update [CubeProcessingController].Job set IsBatchComplete = 1 where ExternalID = @JobID

end

