
select
'insert into packageloadstep (ApplicationID, PackageName, PackageFullName)
SELECT 
 src.AppID, Src.PackageName, Src.PackageName
FROM (select 1 AppID, ''' + src.packagename + ''' PackageName

where not exists  (select 1 from package where packagename =  ''' + src.packagename + ''')
) src'


--, src.AppID, Src.PackageName, Src.PackageName
FROM (select 1 AppID, 'StagingLoad_' + table_schema + '_' + table_name + '.dtsx' PackageName
from INFORMATION_SCHEMA.TABLES t
where exists (select 1 from MeerkatStaging.INFORMATION_SCHEMA.TABLEs where tables.TABLE_NAME  = t.table_name)
and table_type = 'BASE TABLE'
) src


