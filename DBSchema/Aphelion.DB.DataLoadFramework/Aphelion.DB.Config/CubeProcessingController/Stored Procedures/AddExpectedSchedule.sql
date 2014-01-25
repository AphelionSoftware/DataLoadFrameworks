-- =============================================
-- Author:		Geoffrey Smith
-- Create date: 19 December 2013
-- Description:	Adds expected schedule and expected schedule detail entries
-- Example:
    /*
        DECLARE @TableList [CubeProcessingController].TABLELISTTYPE
        INSERT INTO @TableList
        SELECT 'Test', NULL, NULL

        EXEC [CubeProcessingController].AddExpectedSchedule
            'ExternalReference'
            , @TableList
            , 'test'
            , 'description'
            , 'test user'
            , 'D'
            , '13:00:00'
    */           
-- =============================================
CREATE PROCEDURE [CubeProcessingController].AddExpectedSchedule
      @strApplicationInstanceExternalReference  VARCHAR(255)
    , @tblTableList             [CubeProcessingController].[TableListType] READONLY
    , @strName                  VARCHAR(100)
    , @strDescription           VARCHAR(1000) = NULL
    , @strCreatedBy             VARCHAR(100)
    , @strFrequency             VARCHAR(50) --D,W,M -> Daily, Weekly, Monthly
    , @timTime                  TIME
    , @dtStartDate              DATETIME = NULL -- default to GETDATE()
    , @dtEndDate                DATETIME = NULL
    , @strDayOfWeek             VARCHAR(50) = NULL
    , @intDayOfMonth            INT = NULL
    , @intDailyFrequency        INT = NULL
    , @strDailyFrequencyType    VARCHAR(50) = NULL -- Minutes, Hours, Seconds
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRANSACTION

    --initialize variables
    DECLARE @intTableListCount      INT
          , @intExpectedScheduleID  INT

    SELECT @intTableListCount = COUNT(1) FROM @tblTableList

    BEGIN TRY
        --run sanity checks
		--check if expected schedule already exists
		IF EXISTS (SELECT 1 FROM [CubeProcessingController].ExpectedSchedule WHERE Name = @strName)
			RAISERROR( 'Expected Schedule with same name already exists', 11, 1)

        --check table list contains data
        IF @intTableListCount = 0
            RAISERROR( 'Table list is empty', 11, 1)

        --check application exists
        IF NOT EXISTS (SELECT 1 FROM [CubeProcessingController].ApplicationInstance WHERE ExternalReference = @strApplicationInstanceExternalReference)
            RAISERROR( 'Application does not exist', 11, 1)

        --check table list contains valid tables
        IF NOT EXISTS (SELECT 1
                        FROM [CubeProcessingController].ApplicationInstance AI
                        JOIN [CubeProcessingController].[Table]             T
                            ON AI.ApplicationID = T.ApplicationID
                        JOIN @tblTableList       TL
                            ON T.DBTableName = TL.Name
                        WHERE AI.ExternalReference = @strApplicationInstanceExternalReference
                        )
            RAISERROR( 'Table list contains invalid tables', 11, 1)

        --insert expected schedule entry
        INSERT INTO [CubeProcessingController].ExpectedSchedule
        SELECT AI.ID    --ApplicationInstanceID
             , CASE WHEN @intTableListCount = 1
                    THEN 0
                    ELSE 1 END --IsBatch
             , @strName
             , @strDescription
             , @strCreatedBy
             , @strFrequency
             , @timTime
             , @dtStartDate
             , @dtEndDate
             , @strDayOfWeek
             , @intDayOfMonth
             , @intDailyFrequency
             , @strDailyFrequencyType
             , NULL --LastRunDate
			 , 1 --Active
        FROM [CubeProcessingController].ApplicationInstance    AI
        WHERE AI.ExternalReference = @strApplicationInstanceExternalReference

        SET @intExpectedScheduleID = SCOPE_IDENTITY()

        --insert expected schedule detail entry
        INSERT INTO [CubeProcessingController].ExpectedScheduleDetail
        SELECT @intExpectedScheduleID
             , T.ID
             , TL.StartPartitionValue
             , TL.EndPartitionValue
        FROM @tblTableList  TL
        JOIN [CubeProcessingController].[Table] T
            ON TL.Name = T.DBTableName
        JOIN [CubeProcessingController].ApplicationInstance AI
            ON T.ApplicationID = AI.ApplicationID
        WHERE AI.ExternalReference = @strApplicationInstanceExternalReference
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

