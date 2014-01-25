/*
* @author Louis van der Merwe lsv@rmb.co.za
* 
*/
CREATE procedure [CubeProcessingController].[CreateJob] 

	@ApplicationInstance varchar(255),
	@CreatedBy varchar(100),
	@JobID varchar(255) output,
	@isBatch bit = 0

AS
BEGIN

declare @ApplicationInstanceID int

	set nocount on

	select @ApplicationInstanceID = ID from [CubeProcessingController].ApplicationInstance where ExternalReference = @ApplicationInstance

	if (@ApplicationInstanceID is null)
	begin
		RAISERROR ('Invalid @ApplicationInstanceID', 16, 1) with NOWAIT
		return
	end

	DECLARE @uniqueID uniqueidentifier

	set @uniqueID = NEWID();

	insert into [CubeProcessingController].Job([ExternalID], [ApplicationInstanceID], [IsBatch], [IsBatchComplete],[CreatedDate],[CreatedBy]) values (@uniqueID, @ApplicationInstanceID, @isBatch, 0, CURRENT_TIMESTAMP, @CreatedBy);

	If @@Error = 0 
	Begin
		set @JobID = convert(varchar(255), @uniqueID);  
	End
	 
end
