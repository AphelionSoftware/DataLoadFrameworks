use MiXStaging
go
insert into [Control].[SSIS_Configurations]
( [ConfigurationFilter]
      ,[ConfiguredValue]
      ,[PackagePath]
      ,[ConfiguredValueType])

SELECT 'InsightCube', 'DSSTBPSQL02\SQL2012Tabular', '\Package.Connections[InsightCube].Properties[ServerName]','String'
UNION ALL
SELECT 'InsightCube', 'MiXTel Aggregator - UAT', '\Package.Connections[InsightCube].Properties[InitialCatalog]','String'
