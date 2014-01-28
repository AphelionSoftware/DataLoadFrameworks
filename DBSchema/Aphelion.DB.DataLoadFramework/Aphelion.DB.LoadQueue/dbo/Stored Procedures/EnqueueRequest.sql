
-- =============================================
-- Author:		Geoffrey Smith Aphelion
-- Create date: 29 November 2013
-- Description:	Enqueue processing request
-- =============================================

CREATE PROCEDURE [dbo].[EnqueueRequest]
	@JobReference varchar(255),
	@TableName varchar(255),
	@StartPartitionValue int = null,
	@EndPartitionValue int = null
AS
BEGIN
	SET NOCOUNT ON;

	declare
		@JobID int,
		@ApplicationID int,
		@TableID int,
		@PartitionValueRequired bit = 0,
		@STATUS_ENQUEUED int = 0   

	select @JobID = ID from [dbo].Job where ExternalID = convert(uniqueidentifier, @JobReference)

	if (@JobID is null)
	begin
		RAISERROR ('Invalid @JobReference', 16, 1) with NOWAIT
		return
	end

	select @ApplicationID = ApplicationID from [dbo].ApplicationInstance a, [dbo].Job j where a.ID = j.ApplicationInstanceID and j.ID = @JobID

	if (@ApplicationID is null)
	begin
		RAISERROR ('Invalid @ApplicationID', 16, 1) with NOWAIT
		return
	end

	select @TableID = ID from [dbo].[Table] where ApplicationID = @ApplicationID and DBTableName = @TableName

	if (@TableID is null)
	begin
		RAISERROR ('Invalid @TableName', 16, 1) with NOWAIT
		return
	end

	select @PartitionValueRequired = 1 from [dbo].[Table] where ID = @TableID and IsPartitioned = 1

	if (@PartitionValueRequired = 1 and (@StartPartitionValue is null OR @EndPartitionValue is null))
	begin
		RAISERROR ('Table Requires Partition Value', 16, 1) with NOWAIT
		return
	end

	INSERT INTO [dbo].[ProcessQueue]
			   ([JobID]
			   ,[TableID]
			   ,[StatusID]
			   ,[StartPartitionValue]
			   ,[EndPartitionValue]
			   ,[EnqueuedTime]
			   ,[StartTime]
			   ,[EndTime])
		 VALUES
			   (@JobID
			   ,@TableID
			   ,@STATUS_ENQUEUED
			   ,@StartPartitionValue
			   ,@EndPartitionValue
			   ,CURRENT_TIMESTAMP
			   ,null
			   ,null)

END