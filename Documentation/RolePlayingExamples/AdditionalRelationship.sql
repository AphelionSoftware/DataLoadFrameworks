USE [Paga_EDW]
GO

EXEC sys.sp_addextendedproperty @name=N'AdditionalRelationship01', @value=N'DimApprovedByUser[UserDimApprovedByUserID]' , @level0type=N'SCHEMA',@level0name=N'OLAP', @level1type=N'VIEW',@level1name=N'FactProcessTx', @level2type=N'COLUMN',@level2name=N'DimApprovedByUserID'
GO
