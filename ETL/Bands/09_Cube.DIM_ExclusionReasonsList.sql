use MiXData
go
DROP VIEW Cube.DIM_ExclusionReasons
GO
CREATE VIEW Cube.DIM_ExclusionReasons
as

SELECT 
	
	  [BoundaryComparison] 
	  
      ,[BoundaryValue]
      
      ,[DAXFieldName]
	  ,[DAXKeyFieldName]
	  ,DestinationFieldName
	  ,DestinationTableName
	  ,ExclusionLevelCode
	  ,[ExclusionReasonKey]
	  ,[ExclusionTypeCode]
      ,OrganisationGroupKey

	  ,DER.ExclusionReasonName
	  ,DET.ExclusionTypeName
	  ,DEL.ExclusionLevelName
      
      	  from dbo.DIM_ExclusionReason DER
	  INNER JOIN dbo.DIM_ExclusionLevel DEL
	  ON DER.ExclusionLevelKey = DEL.ExclusionLevelKey
		--AND DEL.ExclusionLevelKey > 0
		AND DEL.IsActive = 1
	  INNER JOIN dbo.DIM_ExclusionType DET

	  ON DER.ExclusionTypeKey = DET.ExclusionTypeKey 
		--AND DET.ExclusionTypeKey  > 0
		AND DEL.IsActive = 1
	WHERE DER.IsActive = 1