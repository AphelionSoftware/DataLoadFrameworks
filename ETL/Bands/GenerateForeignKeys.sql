select 'ALTER TABLE dbo.FACT_ActivityDetailsExclusion ADD CONSTRAINT
	FK_FACT_ActivityDetailsExclusion_' + column_name + ' FOREIGN KEY
	(
	' + column_name + '
	) REFERENCES dbo.DIM_ExclusionReason
	(
	ExclusionReasonKey
	)' from INFORMATION_SCHEMA.COLUMNS
where table_name = 'Fact_ActivityDetailsExclusion'
and COLUMN_name like 'Exclude%'