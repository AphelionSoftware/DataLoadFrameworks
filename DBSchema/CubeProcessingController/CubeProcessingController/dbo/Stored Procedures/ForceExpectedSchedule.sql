-- =============================================
-- Author:		Geoffrey Smith
-- Create date: 19 December 2013
-- Description:	Force job creation for expected schedule
-- Example:
    /*
        EXEC ForceExpectedSchedule
            1
    */           
-- =============================================
CREATE PROCEDURE dbo.ForceExpectedSchedule
    @intExpectedScheduleID  INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRANSACTION

    BEGIN TRY
        --insert job schedule
        INSERT INTO Job
        SELECT NULL --ExternalID
             , ES.ID --ExpectedScheduleID
             , ES.ApplicationInstanceID
             , ES.IsBatch
             , 1 --IsBatchComplete
             , GETDATE()
             , ES.CreatedBy
        FROM ExpectedSchedule               ES
        WHERE ID = @intExpectedScheduleID
        
        --insert process queue entries for pending job
        INSERT INTO ProcessQueue
        SELECT J.ID --JobID
             , ESD.TableID
             , 0    --StatusID
             , ESD.StartPartitionValue
             , ESD.EndPartitionValue
             , GETDATE() --EnqueuedTime
             , NULL --StarTime
             , NULL --EndTime
        FROM Job    J
        JOIN ExpectedSchedule ES
            ON J.ExpectedScheduleID = ES.ID
        JOIN ExpectedScheduleDetail ESD
            ON ES.ID = ESD.ExpectedScheduleID
        WHERE ES.ID = @intExpectedScheduleID

        --update LastRunDate for expected schedule
		UPDATE ExpectedSchedule
		SET LastRunDate = GETDATE()
		WHERE ID = @intExpectedScheduleID

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
GO

