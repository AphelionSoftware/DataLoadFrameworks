--check schedules with SSIS

-- =============================================
-- Author:		Geoffrey Smith
-- Create date: 19 December 2013
-- Description:	Check  schedule for jobs that must be created and create job entries
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
          , @strDayOfMonth  INT = DATEPART(DAY,@dtDateTime)
          , @timTime        TIME = @dtDateTime
    
    DECLARE @tblPendingSchedule TABLE
        ( ScheduleID    INT
        )

	DECLARE @tblJobID TABLE
		( JobID	INT
		)

    BEGIN TRY
        --deactivate expired schedules
        UPDATE [dbo].Schedule
        SET Active = 0
        WHERE EndDate IS NOT NULL
          AND EndDate <= @dtDateTime
          AND Active = 1

        --get  schedules for today's pending jobs up to current time
        INSERT INTO @tblPendingSchedule
        SELECT DISTINCT 
			   S.ScheduleID
        FROM [dbo].Schedule	S
		LEFT JOIN (SELECT DISTINCT
						  J.ScheduleID
						, PQ.StatusID
				   FROM [dbo].Job	J
				   JOIN [dbo].ProcessQueue PQ
					   ON J.ID = PQ.JobID
				   WHERE PQ.StatusID NOT IN (1,2)
				  ) SJ --all jobs where status complete or failed
			ON ES.ID = SJ.ScheduleID
        WHERE ISNULL(SJ.StatusID,1) != 0	--check for existing queued scheduled job
		  AND ISNULL(SJ.StatusID,1) != -1	--check for existing in process scheduled job
		  AND ES.Active = 1
          AND ES.[Time] <= @timTime
          AND ((ES.Frequency = 'M'
                AND ES.[DayOfMonth] = @strDayOfMonth
                AND CONVERT(DATE,ISNULL(ES.LastRunDate,'1 Jan 1900')) < @dDate --if LastRunDate today then schedule has already run
               )
               OR (ES.Frequency = 'W'
                   AND ES.[DayOfWeek] = @strDayOfWeek
                   AND CONVERT(DATE,ISNULL(ES.LastRunDate,'1 Jan 1900')) < @dDate
                  )
               OR (ES.Frequency = 'D'
                   AND ES.DailyFrequencyType IS NULL
                   AND CONVERT(DATE,ISNULL(ES.LastRunDate,'1 Jan 1900')) < @dDate
                  )
               OR (ES.Frequency = 'D'
                   AND ES.DailyFrequencyType = 'M' --minutes
                   AND DATEDIFF(MI,ISNULL(ES.LastRunDate,'1 Jan 1900'),@dtDateTime) >= DailyFrequency
                  )
               OR (ES.Frequency = 'D'
                   AND ES.DailyFrequencyType = 'H' --hours
                   AND DATEDIFF(HH,ISNULL(ES.LastRunDate,'1 Jan 1900'),@dtDateTime) >= DailyFrequency
                  )
               OR (ES.Frequency = 'D'
                   AND ES.DailyFrequencyType = 'S' --seconds
                   AND DATEDIFF(SS,ISNULL(ES.LastRunDate,'1 Jan 1900'),@dtDateTime) >= DailyFrequency
                  )
              )
                   
        --insert jobs for pending schedules
        INSERT INTO [dbo].Job
		OUTPUT INSERTED.ID
        INTO @tblJobID 
        SELECT NULL --ExternalID
             , PES.ScheduleID
             , ES.ApplicationInstanceID
             , ES.IsBatch
             , 1 --IsBatchComplete
             , GETDATE()
             , ES.CreatedBy
        FROM @tblPendingSchedule    PES
        JOIN [dbo].Schedule               ES
            ON PES.ScheduleID = ES.ID
        
        --insert process queue entries for pending jobs
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
		JOIN @tblJobID	JI
			ON J.ID = JI.JobID
        JOIN [dbo].Schedule ES
            ON J.ScheduleID = ES.ID
        JOIN [dbo].ScheduleDetail ESD
            ON ES.ID = ESD.ScheduleID
        JOIN @tblPendingSchedule PES
            ON J.ScheduleID = PES.ScheduleID

		--update LastRunDate for  schedules
		UPDATE [dbo].Schedule
		SET LastRunDate = GETDATE()
		FROM @tblPendingSchedule PES
		JOIN [dbo].Schedule	ES
			ON ES.ID = PES.ScheduleID

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