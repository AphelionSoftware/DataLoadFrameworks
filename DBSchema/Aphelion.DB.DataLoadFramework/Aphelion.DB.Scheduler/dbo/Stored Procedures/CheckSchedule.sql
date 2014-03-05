
-- =============================================
-- Author:		Geoffrey Smith
-- Create date: 19 December 2013
-- Description:	Check schedule for jobs that must be created
-- Example:
    /*
        EXEC [dbo].CheckSchedule
    */           
-- =============================================
CREATE PROCEDURE [dbo].[CheckSchedule]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRANSACTION

    --initialize variables
    DECLARE @dtDateTime     DATETIME = GETDATE()
    DECLARE @dDate          DATE = @dtDateTime
          , @strDayOfWeek   VARCHAR(50) = DATENAME(WEEKDAY,@dtDateTime)
          , @intDayOfMonth  INT = DATEPART(DAY,@dtDateTime)
          , @timTime        TIME = @dtDateTime
    
	BEGIN TRY
        --deactivate expired schedules
        UPDATE [dbo].Schedule
        SET Active = 0
        WHERE EndDate IS NOT NULL
          AND EndDate <= @dtDateTime
          AND Active = 1

        --get schedules for today's pending jobs up to current time
        SELECT DISTINCT 
			   S.ScheduleID
			 , CASE WHEN SCD.ScheduleCubeDetailID IS NULL
					THEN CAST(0 AS BIT)
					ELSE CAST(1 AS BIT) END AS IsCubeSchedule
        FROM Schedule	S
		JOIN FrequencyType FT
			ON S.FrequencyTypeID = FT.FrequencyTypeID
		LEFT JOIN ScheduleCubeDetail SCD
			ON S.ScheduleID = SCD.ScheduleID
		WHERE S.Active = 1
          AND S.StartTime <= @timTime --schedule start time must be less than current time
		  AND S.EndTime >= @timTime --schedule end time must be greater than current time
          AND ((FT.FrequencyTypeName = 'Monthly'
                AND S.[DayOfMonth] = @intDayOfMonth
                AND CONVERT(DATE,ISNULL(S.LastRunDate,'1 Jan 1900')) < @dDate --if LastRunDate today then schedule has already run
               )
               OR (FT.FrequencyTypeName = 'Weekly'
                   AND S.[DayOfWeek] = @strDayOfWeek
                   AND CONVERT(DATE,ISNULL(S.LastRunDate,'1 Jan 1900')) < @dDate --if LastRunDate today then schedule has already run
                  )
               OR (FT.FrequencyTypeName = 'Daily'
                   AND CONVERT(DATE,ISNULL(S.LastRunDate,'1 Jan 1900')) < @dDate --if LastRunDate today then schedule has already run
                  )
               OR (FT.FrequencyTypeName = 'Minutes'
                   AND DATEDIFF(MI,ISNULL(S.LastRunDate,'1 Jan 1900'),@dtDateTime) >= S.FrequencyInterval
                  )
               OR (FT.FrequencyTypeName = 'Hourly'
                   AND DATEDIFF(HH,ISNULL(S.LastRunDate,'1 Jan 1900'),@dtDateTime) >= S.FrequencyInterval
                  )
              )
                   
  --      --insert jobs for pending schedules
  --      INSERT INTO [dbo].Job
		--OUTPUT INSERTED.ID
  --      INTO @tblJobID 
  --      SELECT NULL --ExternalID
  --           , PES.ScheduleID
  --           , ES.ApplicationInstanceID
  --           , ES.IsBatch
  --           , 1 --IsBatchComplete
  --           , GETDATE()
  --           , ES.CreatedBy
  --      FROM @tblPendingSchedule    PES
  --      JOIN [dbo].Schedule               ES
  --          ON PES.ScheduleID = ES.ID
        
  --      --insert process queue entries for pending jobs
  --      INSERT INTO [dbo].ProcessQueue
  --      SELECT J.ID --JobID
  --           , ESD.TableID
  --           , 0    --StatusID
  --           , ESD.StartPartitionValue
  --           , ESD.EndPartitionValue
  --           , GETDATE() --EnqueuedTime
  --           , NULL --StarTime
  --           , NULL --EndTime
  --      FROM [dbo].Job    J
		--JOIN @tblJobID	JI
		--	ON J.ID = JI.JobID
  --      JOIN [dbo].Schedule ES
  --          ON J.ScheduleID = ES.ID
  --      JOIN [dbo].ScheduleDetail ESD
  --          ON ES.ID = ESD.ScheduleID
  --      JOIN @tblPendingSchedule PES
  --          ON J.ScheduleID = PES.ScheduleID

		----update LastRunDate for  schedules
		--UPDATE [dbo].Schedule
		--SET LastRunDate = GETDATE()
		--FROM @tblPendingSchedule PES
		--JOIN [dbo].Schedule	ES
		--	ON ES.ID = PES.ScheduleID

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