-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE Procedure [dbo].[ProcessBatch]
	@JobID varchar(255)
as

begin

	update Job set IsBatchComplete = 1 where ExternalID = @JobID

end

