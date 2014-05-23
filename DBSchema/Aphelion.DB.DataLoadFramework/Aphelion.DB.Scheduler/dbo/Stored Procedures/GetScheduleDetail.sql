
-- =============================================
-- Author:		Geoffrey Smith
-- Create date: 3 March 2014
-- Description:	Get schedule detail for specific ScheduleID
--				This information is used to insert the Queue entry into the LoadQueue database
-- Example:
    /*
        EXEC [dbo].GetScheduleDetail 1
    */           
-- =============================================
CREATE PROCEDURE [dbo].[GetScheduleDetail]
	@intScheduleID  INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRANSACTION

    --initialize variables
	DECLARE @bitIsCubeSchedule	BIT = 0
    
	BEGIN TRY
        --check if cube schedule
		IF EXISTS (SELECT TOP 1 ScheduleCubeDetailID
				   FROM ScheduleCubeDetail
				   WHERE ScheduleID = @intScheduleID
				  )
		BEGIN
			SELECT @bitIsCubeSchedule = 1
		END

		IF @bitIsCubeSchedule = 0 --get info for normal etl job, single record
		BEGIN
			SELECT A.LoadQueueServer
				 , S.QueueLoadTypeID
				 , S.PackageLoadID
				 , S.RunBalancing
				 , S.RunSchemaCompare
				 , S.RunFKChecks
				 , A.LoadQueueUsername
				 , A.LoadQueuePassword
				 , A.LoadQueueDatabaseName
			FROM Schedule	S
			JOIN [Application]	A
				ON S.ApplicationID = A.ApplicationID
			WHERE ScheduleID = @intScheduleID
		END
		ELSE
		BEGIN --get info for cube processing job, multiple records
			SELECT A.LoadQueueServer
				 , S.QueueLoadTypeID
				 , S.PackageLoadID
				 , S.RunBalancing
				 , S.RunSchemaCompare
				 , S.RunFKChecks
				 , S.IsBatch
				 , SCD.CubeTableID
				 , SCD.StartPartitionValue
				 , SCD.EndPartitionValue
				 , A.LoadQueueUsername
				 , A.LoadQueuePassword
				 , A.LoadQueueDatabaseName
			FROM Schedule	S
			JOIN [Application]	A
				ON S.ApplicationID = A.ApplicationID
			JOIN ScheduleCubeDetail	SCD
				ON S.ScheduleID = SCD.ScheduleID
			WHERE S.ScheduleID = @intScheduleID
		END

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