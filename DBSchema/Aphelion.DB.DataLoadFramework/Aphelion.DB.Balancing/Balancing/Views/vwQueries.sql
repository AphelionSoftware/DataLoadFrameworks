CREATE VIEW Balancing.vwQueries
AS 
SELECT
	FA.FunctionalAreaName 
	,T.TestName
	,Q.QueryName
	,Q.QueryText
	,T.ExpectedResult
	,DS.DataSourceName
	,DST.DataSourceTypeName
	,DS.ConnectionString
	,T.ExpectedResultText

	FROM Balancing.Queries Q
	INNER JOIN Balancing.Tests T
		ON Q.TestID = T.TestID
	INNER JOIN Balancing.FunctionalAreas FA
		ON T.FunctionalAreaID = FA.FunctionalAreaID
	INNER JOIN Balancing.DataSources DS
		ON Q.DataSourceID = DS.DataSourceID
	INNER JOIN Balancing.DataSourceTypes DST
		ON DS.DataSourceID = DST.DataSourceTypeID