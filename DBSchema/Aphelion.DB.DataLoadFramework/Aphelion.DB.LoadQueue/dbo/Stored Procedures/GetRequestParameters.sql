-- =============================================
-- Author:		Louis van der Merwe
-- =============================================
CREATE PROCEDURE [dbo].[GetRequestParameters]
										@RequestID int,
										@JobID int,
										@isBatch bit
AS
BEGIN
	SET NOCOUNT ON;

	if (@isBatch = 1)
		select * from [dbo].v_RequestParameters where JobID = @JobID order by RequestID asc
	else
		select * from [dbo].v_RequestParameters where RequestID = @RequestID

END