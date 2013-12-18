-- =============================================
-- Author:		Louis van der Merwe
-- =============================================
CREATE PROCEDURE [dbo].[getRequestParameters]
										@RequestID int,
										@JobID int,
										@isBatch bit
AS
BEGIN
	SET NOCOUNT ON;

	if (@isBatch = 1)
		select * from v_RequestParameters where JobID = @JobID order by RequestID asc
	else
		select * from v_RequestParameters where RequestID = @RequestID

END

