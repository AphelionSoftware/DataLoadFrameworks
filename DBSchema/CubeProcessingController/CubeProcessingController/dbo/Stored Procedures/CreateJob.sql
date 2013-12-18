/*
* @author Louis van der Merwe lsv@rmb.co.za
* 
*/
CREATE procedure [dbo].[CreateJob] 

	@ApplicationInstance varchar(255),
	@CreatedBy varchar(100),
	@JobID varchar(255) output,
	@isBatch bit = 0

AS
BEGIN

declare @ApplicationInstanceID int

	set nocount on

	select @ApplicationInstanceID = ID from dbo.applicationinstance where externalreference = @ApplicationInstance

	if (@ApplicationInstanceID is null)
	begin
		RAISERROR ('Invalid @ApplicationInstanceID', 16, 1) with NOWAIT
		return
	end

	DECLARE @uniqueID uniqueidentifier

	set @uniqueID = NEWID();

	insert into dbo.Job([ExternalID], [ApplicationInstanceID], [IsBatch], [IsBatchComplete],[CreatedDate],[CreatedBy]) values (@uniqueID, @ApplicationInstanceID, @isBatch, 0, CURRENT_TIMESTAMP, @CreatedBy);

	If @@Error = 0 
	Begin
		set @jobid = convert(varchar(255), @uniqueID);  
	End
	 
end
