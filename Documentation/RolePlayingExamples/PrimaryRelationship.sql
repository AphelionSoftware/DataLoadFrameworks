USE [Paga_EDW]
GO
EXEC sys.sp_updateextendedproperty @name=N'PrimaryRelationship', @value=N'true' , @level0type=N'SCHEMA',@level0name=N'OLAP', @level1type=N'VIEW',@level1name=N'FactProcessTx', @level2type=N'COLUMN',@level2name=N'DimInitiatingUserID'

GO
