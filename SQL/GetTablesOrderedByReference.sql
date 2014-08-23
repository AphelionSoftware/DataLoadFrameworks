use Meerkat
go
IF OBJECT_ID('tempdb..#key_list') IS NOT NULL
DROP TABLE #key_list;
GO

SELECT 
	tbl.object_id,
	fk.p_tbl_col as tbl_name,
	fk.r_tbl_col as referenced_tbl,
	fk.referenced_object_id
	,fk.parent_object_id
	,tbl.object_id as rootID
INTO #key_list
FROM
(
	SELECT 
		SCHEMA_NAME(t.schema_id) +'.' + t.name as tbl_name,
		t.object_id
	FROM sys.tables as t
	where 
		t.type = 'U'
) as tbl
LEFT JOIN
(
	select
		parent_object_id,
		object_name(parent_object_id) +'.' + parent_col.col1 as p_tbl_col,
		referenced_object_id,
		object_name(referenced_object_id) +'.' + ref_col.col2 as r_tbl_col
	from sys.foreign_key_columns as fkc
	CROSS APPLY
	(
		SELECT	
			name as col1

		FROM sys.columns as c1
		WHERE
			c1.object_id = fkc.parent_object_id
			and c1.column_id = fkc.parent_column_id
	) as parent_col
	CROSS APPLY
	(
		SELECT	
			name as col2

		FROM sys.columns as c2
		WHERE
			c2.object_id = fkc.referenced_object_id
			and c2.column_id = fkc.referenced_column_id
	) as ref_col
) as fk on
	tbl.object_id = fk.parent_object_id;
GO

select * from #key_list
--where tbl_name like 'factactivityde%'

/*;WITH key_hierarchy(id, tbl_name, referenced_object_id, LEVEL, treepath, parent_object_id, rootID) AS
( 
	SELECT 
		object_id AS id, 
		tbl_name, 
		referenced_object_id, 
		1 AS LEVEL,
		--CAST(tbl_name AS VARCHAR(2048)) AS treepath
		CAST(tbl_name + ' : ' + ISNULL(referenced_tbl, 'No relations') AS VARCHAR(2048)) AS treepath
		, parent_object_id
		, rootID
	FROM #key_list

	UNION ALL -- and now for the recursive part  

	SELECT 
		d.object_id AS id, 
		d.tbl_name, 
		d.referenced_object_id, 
		kh.LEVEL + 1 AS LEVEL,
		CAST(kh.treepath + ' -> ' + CAST(d.tbl_name as VARCHAR(2048)) AS VARCHAR(2048)) AS treepath
		, kh.parent_object_id
		, kh.rootID
			FROM #key_list d
	INNER JOIN key_hierarchy  kh ON 
		kh.referenced_object_id= d.parent_object_id 	
)
/*
This *almost* works.
gets all the levels except the top
Something wonky higher up?*/

SELECT rootid, 
object_name(rootid) rootName,
	object_name( id) name,
	id, 
	ISNULL(treepath, object_name(id) +' (No Foreign Keys)') as treepath,
	level , 
	kh.referenced_object_id
FROM key_hierarchy kh
--where object_name(rootID) like 'Factactivityd%'
/*
--This doesn't work but maybe a good base
UNION ALL
SELECT keyL.rootid, 
object_name(keyL.rootid) rootName,
	object_name( keyL.object_id) name,
	keyL.object_id, 
	''--ISNULL(treepath, object_name(id) +' (No Foreign Keys)') as treepath,
	,0-- level , 
	,NULL--kh.referenced_object_id
FROM key_hierarchy kh
inner join #key_list keyL
on kh.referenced_object_id = keyL.referenced_object_id
and keyL.referenced_object_id not in 
(select id from key_hierarchy)
where object_name(keyl.rootID) like 'Factactivityd%'

*/
ORDER BY 
	object_name( id);
	
	
	
	
	*/