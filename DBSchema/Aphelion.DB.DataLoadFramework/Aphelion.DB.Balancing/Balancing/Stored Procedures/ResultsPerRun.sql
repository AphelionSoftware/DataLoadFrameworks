
CREATE PROC [Balancing].[ResultsPerRun]
@RunID int 
AS
--DECLARE @RunID int = 1;
BEGIN;
WITH base AS
(
	SELECT 
		t.FunctionalAreaID,
		fa.FunctionalAreaName,
		t.TestId,
		t.TestName,
		q.QueryId,
		ds.DataSourceTypeID,
		dst.DataSourceTypeName,
		r.TestResult,
		r.TestDateTime,
		CASE 
		/*A derivative of Fibonacci.
		
		 Two of these numbers added together are guaranteed to be unique*/
		
		WHEN dst.DataSourceTypeID = 1 THEN 1
		WHEN dst.DataSourceTypeID = 2 THEN 3
		WHEN dst.DataSourceTypeID = 3 THEN 5
		WHEN dst.DataSourceTypeID = 4 THEN 9
		WHEN dst.DataSourceTypeID = 5 THEN 15
		WHEN dst.DataSourceTypeID = 6 THEN 25
		WHEN dst.DataSourceTypeID = 7 THEN 41
		WHEN dst.DataSourceTypeID = 8 THEN 67
		ELSE 2147483647 /* Because http://en.wikipedia.org/wiki/2147483647_(number) */
		/*Also because adding even 1 to it will throw an error that we have exceeded the mapped values*/
		END
		
		 AS HalfComp
		
	FROM Balancing.Results AS r 
	INNER JOIN Balancing.Queries q ON
		q.queryID = r.queryID
	INNER JOIN	Balancing.DataSources ds ON	
		q.DataSourceId = ds.DataSourceId
	INNER JOIN	Balancing.DataSourceTypes dst ON	
		ds.DataSourceTypeId = dst.DataSourceTypeId
	INNER JOIN	Balancing.Tests t ON 
		q.TestID = t.TestID
	INNER JOIN balancing.FunctionalAreas as fa on 
		fa.FunctionalAreaID = t.FunctionalAreaID
	WHERE 
		r.RunID = @RunID
		/*and (Q.QueryName not like '%MTD%'
				OR getdate() > '2014/02/03')

		and fa.functionalareaname not like '%force%'
		*/
)

SELECT DISTINCT COMP
	,src.FunctionalAreaID
	,src.FunctionalAreaName
	,src.TestName
	, src.TestID
	, OuterSourceTypeID
	, DataSourceTypeID
	, TestResult
	, ComparisonResult
	, Comparison
	, CASE 
		WHEN (TestResult  = 0 OR ComparisonResult  = 0) THEN NULL
		ELSE TestResult / ComparisonResult
		END as Variance
	, CASE 
		WHEN (TestResult  = 0 OR ComparisonResult  = 0) THEN NULL
		ELSE (ComparisonResult - TestResult) / ComparisonResult 
		END as DeltaPercent
	
	, Tests.ExpectedResult
 From (
SELECT TOP 2147483647
	InnerT.HalfComp + OuterT.HalfComp AS COMP,
	FIRST_VALUE(OuterT.DataSourceTypeID ) OVER (PARTITION BY InnerT.TestID,InnerT.HalfComp + OuterT.HalfComp ORDER BY OuterT.DataSourceTypeID)
		AS OuterSourceTYpeID,
		ABS(
		FIRST_VALUE(OuterT.TestResult ) OVER (PARTITION BY InnerT.TestID,InnerT.HalfComp + OuterT.HalfComp ORDER BY OuterT.DataSourceTypeID)
		)
	AS ComparisonResult,
	FIRST_VALUE(InnerT.DataSourceTypeName + ' vs ' + OuterT.DataSourceTypeName ) OVER (PARTITION BY InnerT.TestID,InnerT.HalfComp + OuterT.HalfComp ORDER BY OuterT.DataSourceTypeID)
	as Comparison
	,
	FIRST_VALUE(InnerT.DataSourceTypeID) OVER (PARTITION BY InnerT.TestID,InnerT.HalfComp + OuterT.HalfComp ORDER BY OuterT.DataSourceTypeID)
	AS DataSourceTypeID
	
	,
	ABS(
	FIRST_VALUE(InnerT.TestResult) OVER (PARTITION BY InnerT.TestID,InnerT.HalfComp + OuterT.HalfComp ORDER BY OuterT.DataSourceTypeID)
	)
	AS TestResult
	
	, InnerT.TestID
	,InnerT.FunctionalAreaID
	,InnerT.FunctionalAreaName
	,InnerT.TestName
FROM base AS InnerT
INNER JOIN base AS OuterT ON 
	InnerT.TestID = OuterT.TestID
	AND InnerT.QueryID <> OuterT.QueryID
ORDER BY 
	InnerT.testid, 
	InnerT.DataSourceTypeID, 
	OuterT.DataSourceTypeID desc
	)

	src
	 INNER JOIN Balancing.Tests
	 on src.TestID = Tests.TestID 
	order by COMP, src.TestID


	END