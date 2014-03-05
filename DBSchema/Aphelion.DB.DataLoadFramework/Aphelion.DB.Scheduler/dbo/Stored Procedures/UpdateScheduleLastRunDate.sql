
-- =============================================
-- Author:		Geoffrey Smith
-- Create date: 3 March 2014
-- Description:	Update Schedule LastRunDate after Queue entry has been inserted in LoadQueue
-- Example:
    /*
        EXEC [dbo].[UpdateScheduleLastRunDate] 1
    */           
-- =============================================
CREATE PROCEDURE [dbo].[UpdateScheduleLastRunDate]
	@intScheduleID  INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRANSACTION

    BEGIN TRY
        UPDATE Schedule
		SET LastRunDate = GETDATE()
		WHERE ScheduleID = @intScheduleID

    END TRY
    BEGIN CATCH
        SELECT ERROR_NUMBER() AS ErrorNumber
             , ERROR_SEVERITY() AS ErrorSeverity
             , ERROR_STATE() AS ErrorState
             , ERROR_PROCEDURE() AS ErrorProcedure
             , ERROR_LINE() AS ErrorLine
             , ERROR_MESSAGE() AS ErrorMessage

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
    END CATCH

    IF @@TRANCOUNT > 0
        COMMIT TRANSACTION;
END