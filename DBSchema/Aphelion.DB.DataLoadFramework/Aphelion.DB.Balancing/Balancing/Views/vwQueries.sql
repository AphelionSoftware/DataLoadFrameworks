﻿
CREATE VIEW [Balancing].[vwQueries]

AS 
SELECT Q.QueryID
	  ,Q.QueryName
	  ,Q.QueryText
	  ,DS.DataSourceID
	  ,DS.DataSourceName
	  , T.TestID
	  , T.TestName
	  , T.ExpectedResult
	  , FA.FunctionalAreaName
	  , FA.FunctionalAreaID
  FROM  Balancing.Queries Q
  INNER JOIN Balancing.DataSources DS
  ON Q.DataSourceID = DS.DataSourceID
  INNER JOIN Balancing.Tests T
  on Q.TestID = T.TestID
  INNER JOIN Balancing.FunctionalAreas FA
  ON T.FunctionalAreaID = FA.FunctionalAreaID