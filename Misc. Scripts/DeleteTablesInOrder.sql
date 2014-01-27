
if object_id('tempdb..#nodes') IS NOT NULL
	DROP TABLE #nodes 
	;
with cte (

	Root_TABLE_NAME ,
	Root_TABLE_SCHEMA ,
	TABLE_CATALOG,
	TABLE_SCHEMA,
	TABLE_NAME,
	COLUMN_NAME,
	DATA_TYPE,
	IS_NULLABLE,
	CONSTRAINT_NAME,
	
	UNIQUE_TABLE_SCHEMA,
	UNIQUE_TABLE_NAME,
	UNIQUE_COLUMN_NAME
	, cteLEVEL
)
as

 (SELECT
 
	Root_TABLE_NAME = base.TABLE_NAME,
	Root_TABLE_SCHEMA = base.TABLE_SCHEMA,
	base.TABLE_CATALOG,
	base.TABLE_SCHEMA,
	base.TABLE_NAME,
	base.COLUMN_NAME,
	base.DATA_TYPE,
	base.IS_NULLABLE,
	ccu.CONSTRAINT_NAME,
	UniqueCol.TABLE_SCHEMA UNIQUE_TABLE_SCHEMA,
	
	UniqueCol.TABLE_NAME UNIQUE_TABLE_NAME,
	UniqueCol.COLUMN_NAME UNIQUE_COLUMN_NAME
	, 0 as cteLevel
FROM
INFORMATION_SCHEMA.COLUMNS base
inner join INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE CCU
on base.COLUMN_NAME = CCU.COLUMN_NAME
and base.TABLE_NAME = ccu.TABLE_NAME
and base.TABLE_SCHEMA = CCU.TABLE_SCHEMA
inner join INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC
	ON CCU.CONSTRAINT_SCHEMA = rc.CONSTRAINT_SCHEMA
	and ccu.CONSTRAINT_NAME = rc.CONSTRAINT_NAME
inner join INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE refCCU
ON refCCU.CONSTRAINT_SCHEMA = rc.UNIQUE_CONSTRAINT_SCHEMA
	and refCCU.CONSTRAINT_NAME = rc.UNIQUE_CONSTRAINT_NAME
inner join INFORMATION_SCHEMA.COLUMNS UniqueCol
	on UniqueCol.COLUMN_NAME = refCCU.COLUMN_NAME
	and UniqueCol.TABLE_NAME = refCCU.TABLE_NAME
	and UniqueCol.TABLE_SCHEMA = refCCU.TABLE_SCHEMA

	--where  base.TABLE_NAME in ('FactActivityDetail')

UNION ALL

SELECT

	Root_TABLE_NAME = cte.Root_TABLE_NAME,
	Root_TABLE_SCHEMA = cte.Root_TABLE_SCHEMA,
	base.TABLE_CATALOG,
	base.TABLE_SCHEMA,
	base.TABLE_NAME,
	base.COLUMN_NAME,
	base.DATA_TYPE,
	base.IS_NULLABLE,
	ccu.CONSTRAINT_NAME,
	UniqueCol.TABLE_SCHEMA UNIQUE_TABLE_SCHEMA,
	UniqueCol.TABLE_NAME UNIQUE_TABLE_NAME,
	UniqueCol.COLUMN_NAME UNIQUE_COLUMN_NAME
	,
		cte.cteLEVEL + 1 AS cteLEVEL
FROM
INFORMATION_SCHEMA.COLUMNS base
inner join INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE CCU
on base.COLUMN_NAME = CCU.COLUMN_NAME
and base.TABLE_NAME = ccu.TABLE_NAME
and base.TABLE_SCHEMA = CCU.TABLE_SCHEMA
inner join INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC
	ON CCU.CONSTRAINT_SCHEMA = rc.CONSTRAINT_SCHEMA
	and ccu.CONSTRAINT_NAME = rc.CONSTRAINT_NAME
inner join INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE refCCU
ON refCCU.CONSTRAINT_SCHEMA = rc.UNIQUE_CONSTRAINT_SCHEMA
	and refCCU.CONSTRAINT_NAME = rc.UNIQUE_CONSTRAINT_NAME
inner join INFORMATION_SCHEMA.COLUMNS UniqueCol
	on UniqueCol.COLUMN_NAME = refCCU.COLUMN_NAME
	and UniqueCol.TABLE_NAME = refCCU.TABLE_NAME
	and UniqueCol.TABLE_SCHEMA = refCCU.TABLE_SCHEMA

	inner join cte
	on cte.UNIQUE_TABLE_SCHEMA = base.TABLE_SCHEMA
		and cte.UNIQUE_TABLE_NAME = base.TABLE_NAME
		and NOT cte.CONSTRAINT_NAME = ccu.CONSTRAINT_NAME
		
	--where not base.TABLE_NAME in ('FactUnitConversion')
	)
	select * 
	INTO #Nodes
	from cte
	--where Root_TABLE_NAME like 'factactivityd%'


	select /*TABLE_CATALOG,
	TABLE_SCHEMA ,
	TABLE_NAME,*/
	'delete from [' + src.TABLE_SCHEMA + '].[' + src.TABLE_NAME + ']
	' + 
	ISNULL('WHERE ' + kcu.COLUMN_NAME + ' > 0',''),
	max(cteLEVEL) from (
	select  
	TABLE_CATALOG,
	TABLE_SCHEMA ,
	TABLE_NAME,
	cteLEVEL
	 from #Nodes
	union 
	select --#Nodes.Root_Table_Name
	TABLE_CATALOG,
	UNIQUE_TABLE_SCHEMA,
	UNIQUE_TABLE_NAME, 
	cteLevel + 1
	FROM #Nodes N
	) src
	
	left join 
	(
	select ccu.* from INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU
	inner join INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE ccu
	on kcu.CONSTRAINT_NAME = ccu.CONSTRAINT_NAME
	and kcu.CONSTRAINT_SCHEMA = ccu.CONSTRAINT_SCHEMA
	where kcu.CONSTRAINT_NAME like 'pk%'
	)
	 	KCU
	on src.TABLE_CATALOG = kcu.TABLE_CATALOG
	and src.TABLE_SCHEMA = kcu.TABLE_schema
	and src.TABLE_NAME = kcu.TABLE_NAME


	where 
	src.table_schema not in ('Balancing')
	and src.table_name not like '%type%'
	and src.table_name not like '%Reason%'
	and src.table_name not like '%Term%'
	and src.table_name not like '%Band%'
	and src.table_name not like '%Status%'
	and src.table_name not like '%Date%'
	and src.table_name not like '%Period%'
	and src.table_name not in (

	'DimConveyanceBand'
	,'DimCommunicationLanguage'
	,''
	
	
	)


	 --and src.table_name like 'fact%'
	GROUP BY src.TABLE_CATALOG,
	src.TABLE_SCHEMA ,
	src.TABLE_NAME,kcu.COLUMN_NAME
	 
	 order by 2 asc
	drop table #nodes
