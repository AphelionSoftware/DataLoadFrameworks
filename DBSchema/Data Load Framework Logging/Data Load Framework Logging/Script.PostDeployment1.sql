/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

CREATE TABLE #T1
(
    N INT NOT NULL PRIMARY key
);

WITH L0 AS (SELECT 1 AS N UNION ALL SELECT 1), 
    L1 AS (SELECT A.N FROM L0 AS A CROSS JOIN L0 AS B),
    L2 AS (SELECT A.N FROM L1 AS A CROSS JOIN L1 AS B),
    L3 AS (SELECT A.N FROM L2 AS A CROSS JOIN L2 AS B),
    L4 AS (SELECT A.N FROM L3 AS A CROSS JOIN L3 AS B),
    Nums AS (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n FROM L4)

INSERT INTO #T1( N )
SELECT N
FROM Nums
 
 INSERT INTO   [dbo].[Source] ( Value)
SELECT  N
FROM #T1
 

  INSERT INTO   [dbo].[Source] ( Value)
SELECT  N
FROM #T1


 INSERT INTO   [dbo].[Source] ( Value)
SELECT  N
FROM #T1
 

  INSERT INTO   [dbo].[Source] ( Value)
SELECT  N
FROM #T1


 INSERT INTO   [dbo].[Source] ( Value)
SELECT  N
FROM #T1
 

  INSERT INTO   [dbo].[Source] ( Value)
SELECT  N
FROM #T1