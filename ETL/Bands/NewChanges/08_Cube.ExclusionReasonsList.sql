use MiXData
go
DROP VIEW Cube.ExclusionReasonsList
GO
CREATE VIEW Cube.ExclusionReasonsList
as

SELECT 
	
	  [BoundaryComparison] 	  
      ,[BoundaryValue]
      ,DAXDateFieldName
      ,[DAXFieldName]
	  ,DAXKeyFieldName
	  ,DAXObjectKeyFieldName
	  ,LEFT( DAXKeyFieldName,CHARINDEX('[',DAXKeyFieldName) - 1 ) DAXTableName
	  ,DestinationFieldName
	  ,DestinationTableName
	  ,ExclusionLevelCode
	  ,[ExclusionReasonKey]
	  ,[ExclusionTypeCode]
      ,OrganisationGroupKey
      ,[SecondaryBoundaryComparison] 	  
      ,[SecondaryBoundaryValue]
      
      	  from dbo.DIM_ExclusionReason DER
	  INNER JOIN dbo.DIM_ExclusionLevel DEL
	  ON DER.ExclusionLevelKey = DEL.ExclusionLevelKey
		AND DEL.ExclusionLevelKey > 0
		AND DEL.IsActive = 1
	  INNER JOIN dbo.DIM_ExclusionType DET

	  ON DER.ExclusionTypeKey = DET.ExclusionTypeKey 
		AND DET.ExclusionTypeKey  > 0
		AND DEL.IsActive = 1
	WHERE DER.IsActive = 1