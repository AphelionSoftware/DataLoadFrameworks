CREATE VIEW Balancing.vwFailedQueriesInLastLoad

AS 
SELECT Errors.[RunID]
      ,Errors.[ErrorID]
      ,Errors.[TestDateTime]
	  ,Q.QueryID
	  ,Q.QueryName
	  ,Q.QueryText
	  ,DS.DataSourceID
	  ,DS.DataSourceName
	  , T.TestID
	  , T.TestName
	  , T.ExpectedResult
	  , FA.FunctionalAreaName
  FROM [Balancing].[Errors]
  INNER JOIN (SELECT MAX( RunID ) As RunID FROM Balancing.Results) results
  ON Errors.RunID = results.RunID
  INNER JOIN Balancing.Queries Q
  ON ErrorS.QueryID = Q.QueryID
  INNER JOIN Balancing.DataSources DS
  ON Q.DataSourceID = DS.DataSourceID
  INNER JOIN Balancing.Tests T
  on Q.TestID = T.TestID
  INNER JOIN Balancing.FunctionalAreas FA
  ON T.FunctionalAreaID = FA.FunctionalAreaID