
-- =============================================
-- Author:		Geoffrey Smith
-- Create date: 19 December 2013
-- Description:	Adds expected schedule and expected schedule detail entries
-- Example:
    /*
        DECLARE @TableList [dbo].TABLELISTTYPE
        INSERT INTO @TableList
        SELECT 'Test', NULL, NULL

        EXEC [dbo].AddSchedule
            'ExternalReference'
            , @TableList
            , 'test'
            , 'description'
            , 'test user'
            , 'D'
            , '13:00:00'
    */           
-- =============================================
CREATE PROCEDURE [dbo].[AddSchedule]
      @intApplicationID			INT
	, @intQueueLoadTypeID		INT = NULL --from LoadQueue database
    , @tblTableList             [dbo].[TableListType] READONLY --from LoadQueue database
	, @intPackageLoadID			INT --from LoadQueue database
    , @strName                  VARCHAR(100)
    , @strDescription           VARCHAR(1000) = NULL
    , @strCreatedBy             VARCHAR(100)
    , @intFrequencyTypeID       INT -- Daily, Weekly, Monthly
	, @intFrequencyInterval		INT -- every x days/weeks/months
    , @timStartTime             TIME
	, @timEndTime             TIME
    , @dtStartDate              DATETIME = NULL -- default to GETDATE()
    , @dtEndDate                DATETIME = NULL
    , @strDayOfWeek             VARCHAR(50) = NULL
    , @intDayOfMonth            INT = NULL
	, @intDailyFrequencyTypeID  INT = NULL -- Minutes, Hours, Seconds
    , @intDailyFrequencyValue   INT = NULL
	, @bitRunBalancing			BIT = 0
	, @bitRunSchemaCompare		BIT = 0
	, @bitRunFKChecks			BIT = 0
    
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRANSACTION

    --initialize variables
    DECLARE @intTableListCount      INT
          , @intScheduleID  INT

    SELECT @intTableListCount = COUNT(1) FROM @tblTableList

    BEGIN TRY
        --run sanity checks
		--check if expected schedule already exists
		IF EXISTS (SELECT 1 FROM [dbo].Schedule WHERE ScheduleName = @strName)
			RAISERROR( 'Expected Schedule with same name already exists', 11, 1)

        --check table list contains data
        IF @intTableListCount = 0
            RAISERROR( 'Table list is empty', 11, 1)

        --check application exists
        IF NOT EXISTS (SELECT 1 FROM [dbo].[Application] WHERE ApplicationID = @intApplicationID)
            RAISERROR( 'Application does not exist', 11, 1)

        --check table list contains valid tables
		/*
        IF NOT EXISTS (SELECT 1
                        FROM [dbo].ApplicationInstance AI
                        JOIN [dbo].[Table]             T
                            ON AI.ApplicationID = T.ApplicationID
                        JOIN @tblTableList       TL
                            ON T.DBTableName = TL.Name
                        WHERE AI.ExternalReference = @strApplicationInstanceExternalReference
                        )
            RAISERROR( 'Table list contains invalid tables', 11, 1)
		*/

        --insert expected schedule entry
        INSERT INTO [dbo].Schedule
        SELECT @intApplicationID
             , @strName
             , @strDescription
			 , @intQueueLoadTypeID
			 , @intPackageLoadID
             , CASE WHEN @intTableListCount = 1
                    THEN 0
                    ELSE 1 END --IsBatch
             , @intFrequencyTypeID
			 , @intFrequencyInterval
             , @timStartTime
			 , @timEndTime
             , @dtStartDate
             , @dtEndDate
             , @strDayOfWeek
             , @intDayOfMonth
			 , @bitRunBalancing
			 , @bitRunSchemaCompare
			 , @bitRunFKChecks
             , NULL --LastRunDate
			 , 1 --Active
			 , NULL
			 , @strCreatedBy
			 , NULL
			 , NULL

        SET @intScheduleID = SCOPE_IDENTITY()

        --insert expected schedule detail entry
		--add logic to check if table list or package load step list
        INSERT INTO [dbo].ScheduleCubeDetail ( ScheduleID
										 , TableID
										 , StartPartitionValue
										 , EndPartitionValue
										 )
        SELECT @intScheduleID
             , TL.ID
             , TL.StartPartitionValue
             , TL.EndPartitionValue
        FROM @tblTableList  TL
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
