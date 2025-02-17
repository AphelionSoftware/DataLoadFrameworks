
USE PAGA_EDW
GO
;
With cte (FactSchema, FactTable, DimSchema, DimTable, cnt) 
as
(

SELECT 
CTU.TABLE_SCHEMA FactSchema, CTU.TABLE_NAME FactTable
, CTUUnq.TABLE_SCHEMA DimSchema, CTUUnq.TABLE_NAME DimTable
, COUNT(*)

 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE CTU
 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE CCU
		ON CTU.CONSTRAINT_SCHEMA = CCU.CONSTRAINT_SCHEMA
			AND CTU.CONSTRAINT_NAME = CCU.CONSTRAINT_NAME
 INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS TC
	ON CTU.CONSTRAINT_SCHEMA = TC.CONSTRAINT_SCHEMA
	AND CTU.CONSTRAINT_NAME = TC.CONSTRAINT_NAME
	AND TC.CONSTRAINT_TYPE = 'FOREIGN KEY'
 INNER JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC 
	ON CCU.CONSTRAINT_NAME = RC.CONSTRAINT_NAME
	AND CCU.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA
 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE CCUUnq
	ON RC.UNIQUE_CONSTRAINT_SCHEMA = CCUUnq.CONSTRAINT_SCHEMA
	AND RC.UNIQUE_CONSTRAINT_NAME = CCUUnq.CONSTRAINT_NAME

 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE CTUUnq
	ON CCUUnq.TABLE_SCHEMA = CTUUnq.TABLE_SCHEMA
	AND CCUUnq.TABLE_NAME = CTUUnq.TABLE_NAME
	AND CTUUnq.CONSTRAINT_SCHEMA = CCUUnq.CONSTRAINT_SCHEMA
			AND CTUUnq.CONSTRAINT_NAME = CCUUnq.CONSTRAINT_NAME

	INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS TCUnq
	ON CTUUnq.CONSTRAINT_SCHEMA = TCUnq.CONSTRAINT_SCHEMA
	AND CTUUnq.CONSTRAINT_NAME = TCUnq.CONSTRAINT_NAME
	AND TCUnq.CONSTRAINT_TYPE = 'PRIMARY KEY'


GROUP BY CTU.TABLE_SCHEMA  , CTU.TABLE_NAME  
, CTUUnq.TABLE_SCHEMA  , CTUUnq.TABLE_NAME  
HAVING COUNT(*) > 1)


select 

* from cte