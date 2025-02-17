--drop view Cube.FACT_VehicleExclusion
go
CREATE VIEW Cube.FACT_VehicleExclusion
AS

SELECT FVE.[VehicleExclusionKey]
      ,FVE.[VehicleKey]
      ,FVE.[OrganisationKey]
      ,FVE.[VehicleExclusionDateKey]
      ,FVE.[ExcludeVehicleReasonID]
      ,FVE.[VehicleExclusionConfirmedID]
      ,FVE.[VehicleExclusionComment]
      ,FVE.[VehicleExclusionConfirmedDateKey]
	  ,COALESCE(FVE.VehicleExclusionConfirmedID  
		,FVE.ExcludeVehicleReasonID) AS FirstVehicleExclusionReasonID
	  ,Org.OrganisationGroupKey
  FROM [dbo].[FACT_VehicleExclusion] FVE

  INNER JOIN orgHier.Organisation Org
  ON FVE.OrganisationKey = Org.OrganisationKey
  WHERE Org.Active = 1