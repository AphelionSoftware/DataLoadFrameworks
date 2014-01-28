--Force schedules with SSIS

-- =============================================
-- Author:		Geoffrey Smith
-- Create date: 19 December 2013
-- Description:	Force job creation for expected schedule
-- Example:
    /*
        EXEC [dbo].ForceExpectedSchedule
            1
    */           
-- =============================================
CREATE PROCEDURE [dbo].[ForceExpectedSchedule]
    @intExpectedScheduleID  INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRANSACTION

    BEGIN TRY
        --insert job schedule
        INSERT INTO [dbo].Job
        SELECT NULL --ExternalID
             , ES.ID --ExpectedScheduleID
             , ES.ApplicationInstanceID
             , ES.IsBatch
             , 1 --IsBatchComplete
             , GETDATE()
             , ES.CreatedBy
        FROM [dbo].ExpectedSchedule               ES
        WHERE ID = @intExpectedScheduleID
        
        --insert process queue entries for pending job
        INSERT INTO [dbo].ProcessQueue
        SELECT J.ID --JobID
             , ESD.TableID
             , 0    --StatusID
             , ESD.StartPartitionValue
             , ESD.EndPartitionValue
             , GETDATE() --EnqueuedTime
             , NULL --StarTime
             , NULL --EndTime
        FROM [dbo].Job    J
        JOIN [dbo].ExpectedSchedule ES
            ON J.ExpectedScheduleID = ES.ID
        JOIN [dbo].ExpectedScheduleDetail ESD
            ON ES.ID = ESD.ExpectedScheduleID
        WHERE ES.ID = @intExpectedScheduleID

        --update LastRunDate for expected schedule
		UPDATE [dbo].ExpectedSchedule
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