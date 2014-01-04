/****** Object:  Database Okavango    Script Date: 1/4/2014 7:49:11 PM ******/


USE Master;
GO


IF DB_ID('Okavango') IS NOT NULL
DROP DATABASE Okavango;
GO


CREATE DATABASE Okavango;
GO


ALTER DATABASE Okavango
SET RECOVERY SIMPLE;
GO


USE Okavango;
GO
IF EXISTS (SELECT Name FROM sys.extended_properties WHERE Name = 'Description')
    EXEC sys.sp_dropextendedproperty @name = 'Description'
EXEC sys.sp_addextendedproperty @name = 'Description', @value = 'Default description - you should change this.';
GO

DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimArea */
IF OBJECT_ID('Shared.DimArea') IS NOT NULL
DROP TABLE DimArea;
GO


/* Create table Shared.DimArea */
CREATE TABLE Shared.DimArea
(
   DimAreaID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   [Geography] [GEOGRAPHY],
   TopoJSONurl VARCHAR(255),
   GeoJSONurl VARCHAR(255),
   AreaSQM DECIMAL(18,5),
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimArea
ADD CONSTRAINT pk_DimAreaID
PRIMARY KEY CLUSTERED
(
   DimAreaID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimArea_SourceKey
ON Shared.DimArea
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimArea',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimArea',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimArea',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimArea',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimArea',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'[Geography]',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimArea',
@level2type=N'COLUMN',
@level2name=N'Geography';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimArea',
@level2type=N'COLUMN',
@level2name=N'Geography';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'TopoJSONurl',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimArea',
@level2type=N'COLUMN',
@level2name=N'TopoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimArea',
@level2type=N'COLUMN',
@level2name=N'TopoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'GeoJSONurl',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimArea',
@level2type=N'COLUMN',
@level2name=N'GeoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimArea',
@level2type=N'COLUMN',
@level2name=N'GeoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AreaSQM',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimArea',
@level2type=N'COLUMN',
@level2name=N'AreaSQM';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimArea',
@level2type=N'COLUMN',
@level2name=N'AreaSQM';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimAvailabilityLevel1 */
IF OBJECT_ID('Shared.DimAvailabilityLevel1') IS NOT NULL
DROP TABLE DimAvailabilityLevel1;
GO


/* Create table Shared.DimAvailabilityLevel1 */
CREATE TABLE Shared.DimAvailabilityLevel1
(
   DimAvailabilityLevel1ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimAvailabilityLevel1
ADD CONSTRAINT pk_DimAvailabilityLevel1ID
PRIMARY KEY CLUSTERED
(
   DimAvailabilityLevel1ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimAvailabilityLevel1_SourceKey
ON Shared.DimAvailabilityLevel1
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel1',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel1',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel1',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel1',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel1',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimAvailabilityLevel2 */
IF OBJECT_ID('Shared.DimAvailabilityLevel2') IS NOT NULL
DROP TABLE DimAvailabilityLevel2;
GO


/* Create table Shared.DimAvailabilityLevel2 */
CREATE TABLE Shared.DimAvailabilityLevel2
(
   DimAvailabilityLevel2ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   DimAvailabilityLevel1ID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimAvailabilityLevel2
ADD CONSTRAINT pk_DimAvailabilityLevel2ID
PRIMARY KEY CLUSTERED
(
   DimAvailabilityLevel2ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimAvailabilityLevel2_SourceKey
ON Shared.DimAvailabilityLevel2
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimAvailabilityLevel1') IS NOT NULL
   ALTER TABLE Shared.DimAvailabilityLevel2
   ADD CONSTRAINT fk_DimAvailabilityLevel2_DimAvailabilityLevel1ID
   FOREIGN KEY
   (
       DimAvailabilityLevel1ID
   )
   REFERENCES
       Shared.DimAvailabilityLevel1(DimAvailabilityLevel1ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel2',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel2',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel2',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel2',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel2',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimAvailabilityLevel1ID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel2',
@level2type=N'COLUMN',
@level2name=N'DimAvailabilityLevel1ID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel2',
@level2type=N'COLUMN',
@level2name=N'DimAvailabilityLevel1ID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimAvailabilityLevel3 */
IF OBJECT_ID('Shared.DimAvailabilityLevel3') IS NOT NULL
DROP TABLE DimAvailabilityLevel3;
GO


/* Create table Shared.DimAvailabilityLevel3 */
CREATE TABLE Shared.DimAvailabilityLevel3
(
   DimAvailabilityLevel3ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   DimAvailabilityLevel2ID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimAvailabilityLevel3
ADD CONSTRAINT pk_DimAvailabilityLevel3ID
PRIMARY KEY CLUSTERED
(
   DimAvailabilityLevel3ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimAvailabilityLevel3_SourceKey
ON Shared.DimAvailabilityLevel3
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimAvailabilityLevel2') IS NOT NULL
   ALTER TABLE Shared.DimAvailabilityLevel3
   ADD CONSTRAINT fk_DimAvailabilityLevel3_DimAvailabilityLevel2ID
   FOREIGN KEY
   (
       DimAvailabilityLevel2ID
   )
   REFERENCES
       Shared.DimAvailabilityLevel2(DimAvailabilityLevel2ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel3',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel3',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel3',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel3',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel3',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimAvailabilityLevel2ID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel3',
@level2type=N'COLUMN',
@level2name=N'DimAvailabilityLevel2ID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel3',
@level2type=N'COLUMN',
@level2name=N'DimAvailabilityLevel2ID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimAvailabilityLevel4 */
IF OBJECT_ID('Shared.DimAvailabilityLevel4') IS NOT NULL
DROP TABLE DimAvailabilityLevel4;
GO


/* Create table Shared.DimAvailabilityLevel4 */
CREATE TABLE Shared.DimAvailabilityLevel4
(
   DimAvailabilityLevel4ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   DimAvailabilityLevel3ID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimAvailabilityLevel4
ADD CONSTRAINT pk_DimAvailabilityLevel4ID
PRIMARY KEY CLUSTERED
(
   DimAvailabilityLevel4ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimAvailabilityLevel4_SourceKey
ON Shared.DimAvailabilityLevel4
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimAvailabilityLevel3') IS NOT NULL
   ALTER TABLE Shared.DimAvailabilityLevel4
   ADD CONSTRAINT fk_DimAvailabilityLevel4_DimAvailabilityLevel3ID
   FOREIGN KEY
   (
       DimAvailabilityLevel3ID
   )
   REFERENCES
       Shared.DimAvailabilityLevel3(DimAvailabilityLevel3ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel4',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel4',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel4',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel4',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel4',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimAvailabilityLevel3ID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel4',
@level2type=N'COLUMN',
@level2name=N'DimAvailabilityLevel3ID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel4',
@level2type=N'COLUMN',
@level2name=N'DimAvailabilityLevel3ID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimAvailabilityLevel5 */
IF OBJECT_ID('Shared.DimAvailabilityLevel5') IS NOT NULL
DROP TABLE DimAvailabilityLevel5;
GO


/* Create table Shared.DimAvailabilityLevel5 */
CREATE TABLE Shared.DimAvailabilityLevel5
(
   DimAvailabilityLevel5ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   DimAvailabilityLevel4ID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimAvailabilityLevel5
ADD CONSTRAINT pk_DimAvailabilityLevel5ID
PRIMARY KEY CLUSTERED
(
   DimAvailabilityLevel5ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimAvailabilityLevel5_SourceKey
ON Shared.DimAvailabilityLevel5
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimAvailabilityLevel4') IS NOT NULL
   ALTER TABLE Shared.DimAvailabilityLevel5
   ADD CONSTRAINT fk_DimAvailabilityLevel5_DimAvailabilityLevel4ID
   FOREIGN KEY
   (
       DimAvailabilityLevel4ID
   )
   REFERENCES
       Shared.DimAvailabilityLevel4(DimAvailabilityLevel4ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel5',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel5',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel5',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel5',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel5',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimAvailabilityLevel4ID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel5',
@level2type=N'COLUMN',
@level2name=N'DimAvailabilityLevel4ID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimAvailabilityLevel5',
@level2type=N'COLUMN',
@level2name=N'DimAvailabilityLevel4ID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimChartOfAccountsLevel1 */
IF OBJECT_ID('Shared.DimChartOfAccountsLevel1') IS NOT NULL
DROP TABLE DimChartOfAccountsLevel1;
GO


/* Create table Shared.DimChartOfAccountsLevel1 */
CREATE TABLE Shared.DimChartOfAccountsLevel1
(
   DimChartOfAccountsLevel1ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimChartOfAccountsLevel1
ADD CONSTRAINT pk_DimChartOfAccountsLevel1ID
PRIMARY KEY CLUSTERED
(
   DimChartOfAccountsLevel1ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimChartOfAccountsLevel1_SourceKey
ON Shared.DimChartOfAccountsLevel1
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel1',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel1',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel1',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel1',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel1',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimChartOfAccountsLevel2 */
IF OBJECT_ID('Shared.DimChartOfAccountsLevel2') IS NOT NULL
DROP TABLE DimChartOfAccountsLevel2;
GO


/* Create table Shared.DimChartOfAccountsLevel2 */
CREATE TABLE Shared.DimChartOfAccountsLevel2
(
   DimChartOfAccountsLevel2ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   DimChartOfAccountsLevel1ID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimChartOfAccountsLevel2
ADD CONSTRAINT pk_DimChartOfAccountsLevel2ID
PRIMARY KEY CLUSTERED
(
   DimChartOfAccountsLevel2ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimChartOfAccountsLevel2_SourceKey
ON Shared.DimChartOfAccountsLevel2
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimChartOfAccountsLevel1') IS NOT NULL
   ALTER TABLE Shared.DimChartOfAccountsLevel2
   ADD CONSTRAINT fk_DimChartOfAccountsLevel2_DimChartOfAccountsLevel1ID
   FOREIGN KEY
   (
       DimChartOfAccountsLevel1ID
   )
   REFERENCES
       Shared.DimChartOfAccountsLevel1(DimChartOfAccountsLevel1ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel2',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel2',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel2',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel2',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel2',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimChartOfAccountsLevel1ID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel2',
@level2type=N'COLUMN',
@level2name=N'DimChartOfAccountsLevel1ID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel2',
@level2type=N'COLUMN',
@level2name=N'DimChartOfAccountsLevel1ID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimChartOfAccountsLevel3 */
IF OBJECT_ID('Shared.DimChartOfAccountsLevel3') IS NOT NULL
DROP TABLE DimChartOfAccountsLevel3;
GO


/* Create table Shared.DimChartOfAccountsLevel3 */
CREATE TABLE Shared.DimChartOfAccountsLevel3
(
   DimChartOfAccountsLevel3ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   DimChartOfAccountsLevel2ID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimChartOfAccountsLevel3
ADD CONSTRAINT pk_DimChartOfAccountsLevel3ID
PRIMARY KEY CLUSTERED
(
   DimChartOfAccountsLevel3ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimChartOfAccountsLevel3_SourceKey
ON Shared.DimChartOfAccountsLevel3
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimChartOfAccountsLevel2') IS NOT NULL
   ALTER TABLE Shared.DimChartOfAccountsLevel3
   ADD CONSTRAINT fk_DimChartOfAccountsLevel3_DimChartOfAccountsLevel2ID
   FOREIGN KEY
   (
       DimChartOfAccountsLevel2ID
   )
   REFERENCES
       Shared.DimChartOfAccountsLevel2(DimChartOfAccountsLevel2ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel3',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel3',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel3',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel3',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel3',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimChartOfAccountsLevel2ID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel3',
@level2type=N'COLUMN',
@level2name=N'DimChartOfAccountsLevel2ID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimChartOfAccountsLevel3',
@level2type=N'COLUMN',
@level2name=N'DimChartOfAccountsLevel2ID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimCity */
IF OBJECT_ID('Shared.DimCity') IS NOT NULL
DROP TABLE DimCity;
GO


/* Create table Shared.DimCity */
CREATE TABLE Shared.DimCity
(
   DimCityID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   [Geography] [GEOGRAPHY],
   TopoJSONurl VARCHAR(255),
   GeoJSONurl VARCHAR(255),
   AreaSQM DECIMAL(18,5),
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimCity
ADD CONSTRAINT pk_DimCityID
PRIMARY KEY CLUSTERED
(
   DimCityID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimCity_SourceKey
ON Shared.DimCity
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCity',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCity',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCity',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCity',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCity',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'[Geography]',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCity',
@level2type=N'COLUMN',
@level2name=N'Geography';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCity',
@level2type=N'COLUMN',
@level2name=N'Geography';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'TopoJSONurl',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCity',
@level2type=N'COLUMN',
@level2name=N'TopoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCity',
@level2type=N'COLUMN',
@level2name=N'TopoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'GeoJSONurl',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCity',
@level2type=N'COLUMN',
@level2name=N'GeoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCity',
@level2type=N'COLUMN',
@level2name=N'GeoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AreaSQM',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCity',
@level2type=N'COLUMN',
@level2name=N'AreaSQM';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCity',
@level2type=N'COLUMN',
@level2name=N'AreaSQM';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimContinent */
IF OBJECT_ID('Shared.DimContinent') IS NOT NULL
DROP TABLE DimContinent;
GO


/* Create table Shared.DimContinent */
CREATE TABLE Shared.DimContinent
(
   DimContinentID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   [Geography] [GEOGRAPHY],
   TopoJSONurl VARCHAR(255),
   GeoJSONurl VARCHAR(255),
   AreaSQM DECIMAL(18,5),
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimContinent
ADD CONSTRAINT pk_DimContinentID
PRIMARY KEY CLUSTERED
(
   DimContinentID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimContinent_SourceKey
ON Shared.DimContinent
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimContinent',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimContinent',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimContinent',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimContinent',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimContinent',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'[Geography]',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimContinent',
@level2type=N'COLUMN',
@level2name=N'Geography';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimContinent',
@level2type=N'COLUMN',
@level2name=N'Geography';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'TopoJSONurl',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimContinent',
@level2type=N'COLUMN',
@level2name=N'TopoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimContinent',
@level2type=N'COLUMN',
@level2name=N'TopoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'GeoJSONurl',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimContinent',
@level2type=N'COLUMN',
@level2name=N'GeoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimContinent',
@level2type=N'COLUMN',
@level2name=N'GeoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AreaSQM',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimContinent',
@level2type=N'COLUMN',
@level2name=N'AreaSQM';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimContinent',
@level2type=N'COLUMN',
@level2name=N'AreaSQM';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimCostType */
IF OBJECT_ID('Shared.DimCostType') IS NOT NULL
DROP TABLE DimCostType;
GO


/* Create table Shared.DimCostType */
CREATE TABLE Shared.DimCostType
(
   DimCostTypeID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimCostType
ADD CONSTRAINT pk_DimCostTypeID
PRIMARY KEY CLUSTERED
(
   DimCostTypeID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimCostType_SourceKey
ON Shared.DimCostType
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCostType',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCostType',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCostType',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCostType',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCostType',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimCountry */
IF OBJECT_ID('Shared.DimCountry') IS NOT NULL
DROP TABLE DimCountry;
GO


/* Create table Shared.DimCountry */
CREATE TABLE Shared.DimCountry
(
   DimCountryID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   [Geography] [GEOGRAPHY],
   TopoJSONurl VARCHAR(255),
   GeoJSONurl VARCHAR(255),
   AreaSQM DECIMAL(18,5),
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimCountry
ADD CONSTRAINT pk_DimCountryID
PRIMARY KEY CLUSTERED
(
   DimCountryID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimCountry_SourceKey
ON Shared.DimCountry
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCountry',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCountry',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCountry',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCountry',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCountry',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'[Geography]',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCountry',
@level2type=N'COLUMN',
@level2name=N'Geography';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCountry',
@level2type=N'COLUMN',
@level2name=N'Geography';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'TopoJSONurl',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCountry',
@level2type=N'COLUMN',
@level2name=N'TopoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCountry',
@level2type=N'COLUMN',
@level2name=N'TopoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'GeoJSONurl',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCountry',
@level2type=N'COLUMN',
@level2name=N'GeoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCountry',
@level2type=N'COLUMN',
@level2name=N'GeoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AreaSQM',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCountry',
@level2type=N'COLUMN',
@level2name=N'AreaSQM';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCountry',
@level2type=N'COLUMN',
@level2name=N'AreaSQM';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimCurrency */
IF OBJECT_ID('Shared.DimCurrency') IS NOT NULL
DROP TABLE DimCurrency;
GO


/* Create table Shared.DimCurrency */
CREATE TABLE Shared.DimCurrency
(
   DimCurrencyID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   CountryID INT,
   ISOCode CHAR(3),
   CurrencySymbol NVARCHAR(1),
   StartDateID INT,
   EndDateID INT,
   Version INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimCurrency
ADD CONSTRAINT pk_DimCurrencyID
PRIMARY KEY CLUSTERED
(
   DimCurrencyID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimCurrency_SourceKey
ON Shared.DimCurrency
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
ALTER TABLE Shared.DimCurrency
ADD CONSTRAINT uc_DimCurrency_StartDateID
UNIQUE
(
   StartDateID
)
GO


--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCurrency',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCurrency',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCurrency',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCurrency',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCurrency',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'CountryID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCurrency',
@level2type=N'COLUMN',
@level2name=N'CountryID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCurrency',
@level2type=N'COLUMN',
@level2name=N'CountryID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'ISOCode',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCurrency',
@level2type=N'COLUMN',
@level2name=N'ISOCode';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCurrency',
@level2type=N'COLUMN',
@level2name=N'ISOCode';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'CurrencySymbol',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCurrency',
@level2type=N'COLUMN',
@level2name=N'CurrencySymbol';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCurrency',
@level2type=N'COLUMN',
@level2name=N'CurrencySymbol';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'StartDateID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCurrency',
@level2type=N'COLUMN',
@level2name=N'StartDateID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCurrency',
@level2type=N'COLUMN',
@level2name=N'StartDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'EndDateID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCurrency',
@level2type=N'COLUMN',
@level2name=N'EndDateID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCurrency',
@level2type=N'COLUMN',
@level2name=N'EndDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Version',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCurrency',
@level2type=N'COLUMN',
@level2name=N'Version';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCurrency',
@level2type=N'COLUMN',
@level2name=N'Version';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimCustomerLevel1 */
IF OBJECT_ID('Shared.DimCustomerLevel1') IS NOT NULL
DROP TABLE DimCustomerLevel1;
GO


/* Create table Shared.DimCustomerLevel1 */
CREATE TABLE Shared.DimCustomerLevel1
(
   DimCustomerLevel1ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   Address VARCHAR(255),
   ContactPerson VARCHAR(255),
   TelephoneNumber VARCHAR(255),
   EmailAddress VARCHAR(255),
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimCustomerLevel1
ADD CONSTRAINT pk_DimCustomerLevel1ID
PRIMARY KEY CLUSTERED
(
   DimCustomerLevel1ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimCustomerLevel1_SourceKey
ON Shared.DimCustomerLevel1
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel1',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel1',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel1',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel1',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel1',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Address',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel1',
@level2type=N'COLUMN',
@level2name=N'Address';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel1',
@level2type=N'COLUMN',
@level2name=N'Address';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'ContactPerson',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel1',
@level2type=N'COLUMN',
@level2name=N'ContactPerson';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel1',
@level2type=N'COLUMN',
@level2name=N'ContactPerson';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'TelephoneNumber',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel1',
@level2type=N'COLUMN',
@level2name=N'TelephoneNumber';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel1',
@level2type=N'COLUMN',
@level2name=N'TelephoneNumber';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'EmailAddress',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel1',
@level2type=N'COLUMN',
@level2name=N'EmailAddress';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel1',
@level2type=N'COLUMN',
@level2name=N'EmailAddress';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimCustomerLevel2 */
IF OBJECT_ID('Shared.DimCustomerLevel2') IS NOT NULL
DROP TABLE DimCustomerLevel2;
GO


/* Create table Shared.DimCustomerLevel2 */
CREATE TABLE Shared.DimCustomerLevel2
(
   DimCustomerLevel2ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   Address VARCHAR(255),
   ContactPerson VARCHAR(255),
   TelephoneNumber VARCHAR(255),
   EmailAddress VARCHAR(255),
   DimCustomerLevel1ID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimCustomerLevel2
ADD CONSTRAINT pk_DimCustomerLevel2ID
PRIMARY KEY CLUSTERED
(
   DimCustomerLevel2ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimCustomerLevel2_SourceKey
ON Shared.DimCustomerLevel2
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimCustomerLevel1') IS NOT NULL
   ALTER TABLE Shared.DimCustomerLevel2
   ADD CONSTRAINT fk_DimCustomerLevel2_DimCustomerLevel1ID
   FOREIGN KEY
   (
       DimCustomerLevel1ID
   )
   REFERENCES
       Shared.DimCustomerLevel1(DimCustomerLevel1ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel2',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel2',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel2',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel2',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel2',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Address',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel2',
@level2type=N'COLUMN',
@level2name=N'Address';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel2',
@level2type=N'COLUMN',
@level2name=N'Address';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'ContactPerson',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel2',
@level2type=N'COLUMN',
@level2name=N'ContactPerson';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel2',
@level2type=N'COLUMN',
@level2name=N'ContactPerson';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'TelephoneNumber',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel2',
@level2type=N'COLUMN',
@level2name=N'TelephoneNumber';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel2',
@level2type=N'COLUMN',
@level2name=N'TelephoneNumber';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'EmailAddress',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel2',
@level2type=N'COLUMN',
@level2name=N'EmailAddress';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel2',
@level2type=N'COLUMN',
@level2name=N'EmailAddress';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCustomerLevel1ID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel2',
@level2type=N'COLUMN',
@level2name=N'DimCustomerLevel1ID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel2',
@level2type=N'COLUMN',
@level2name=N'DimCustomerLevel1ID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimCustomerLevel3 */
IF OBJECT_ID('Shared.DimCustomerLevel3') IS NOT NULL
DROP TABLE DimCustomerLevel3;
GO


/* Create table Shared.DimCustomerLevel3 */
CREATE TABLE Shared.DimCustomerLevel3
(
   DimCustomerLevel3ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   Address VARCHAR(255),
   ContactPerson VARCHAR(255),
   TelephoneNumber VARCHAR(255),
   EmailAddress VARCHAR(255),
   DimCustomerLevel2ID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimCustomerLevel3
ADD CONSTRAINT pk_DimCustomerLevel3ID
PRIMARY KEY CLUSTERED
(
   DimCustomerLevel3ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimCustomerLevel3_SourceKey
ON Shared.DimCustomerLevel3
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimCustomerLevel2') IS NOT NULL
   ALTER TABLE Shared.DimCustomerLevel3
   ADD CONSTRAINT fk_DimCustomerLevel3_DimCustomerLevel2ID
   FOREIGN KEY
   (
       DimCustomerLevel2ID
   )
   REFERENCES
       Shared.DimCustomerLevel2(DimCustomerLevel2ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel3',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel3',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel3',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel3',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel3',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Address',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel3',
@level2type=N'COLUMN',
@level2name=N'Address';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel3',
@level2type=N'COLUMN',
@level2name=N'Address';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'ContactPerson',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel3',
@level2type=N'COLUMN',
@level2name=N'ContactPerson';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel3',
@level2type=N'COLUMN',
@level2name=N'ContactPerson';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'TelephoneNumber',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel3',
@level2type=N'COLUMN',
@level2name=N'TelephoneNumber';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel3',
@level2type=N'COLUMN',
@level2name=N'TelephoneNumber';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'EmailAddress',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel3',
@level2type=N'COLUMN',
@level2name=N'EmailAddress';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel3',
@level2type=N'COLUMN',
@level2name=N'EmailAddress';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCustomerLevel2ID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel3',
@level2type=N'COLUMN',
@level2name=N'DimCustomerLevel2ID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimCustomerLevel3',
@level2type=N'COLUMN',
@level2name=N'DimCustomerLevel2ID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimDate */
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
DROP TABLE DimDate;
GO


/* Create table Shared.DimDate */
CREATE TABLE Shared.DimDate
(
   DimDateID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimDate
ADD CONSTRAINT pk_DimDateID
PRIMARY KEY CLUSTERED
(
   DimDateID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimDate_SourceKey
ON Shared.DimDate
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimDate',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimDate',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimDate',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimDate',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimDate',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimEquipment */
IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
DROP TABLE DimEquipment;
GO


/* Create table Shared.DimEquipment */
CREATE TABLE Shared.DimEquipment
(
   DimEquipmentID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   AssetCode VARCHAR(255),
   SerialNumber VARCHAR(255),
   DimModelID INT,
   DimManufacturerID INT,
   DimManufactureDateID INT,
   DimPurchaseDateID INT,
   DimVelocityUnitID INT,
   DimEnergyConsumptionUnitID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimEquipment
ADD CONSTRAINT pk_DimEquipmentID
PRIMARY KEY CLUSTERED
(
   DimEquipmentID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimEquipment_SourceKey
ON Shared.DimEquipment
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimModel') IS NOT NULL
   ALTER TABLE Shared.DimEquipment
   ADD CONSTRAINT fk_DimEquipment_DimModelID
   FOREIGN KEY
   (
       DimModelID
   )
   REFERENCES
       Shared.DimModel(DimModelID);
GO


IF OBJECT_ID('Shared.DimManufacturer') IS NOT NULL
   ALTER TABLE Shared.DimEquipment
   ADD CONSTRAINT fk_DimEquipment_DimManufacturerID
   FOREIGN KEY
   (
       DimManufacturerID
   )
   REFERENCES
       Shared.DimManufacturer(DimManufacturerID);
GO


IF OBJECT_ID('Shared.DimManufactureDate') IS NOT NULL
   ALTER TABLE Shared.DimEquipment
   ADD CONSTRAINT fk_DimEquipment_DimManufactureDateID
   FOREIGN KEY
   (
       DimManufactureDateID
   )
   REFERENCES
       Shared.DimManufactureDate(DimManufactureDateID);
GO


IF OBJECT_ID('Shared.DimPurchaseDate') IS NOT NULL
   ALTER TABLE Shared.DimEquipment
   ADD CONSTRAINT fk_DimEquipment_DimPurchaseDateID
   FOREIGN KEY
   (
       DimPurchaseDateID
   )
   REFERENCES
       Shared.DimPurchaseDate(DimPurchaseDateID);
GO


IF OBJECT_ID('Shared.DimVelocityUnit') IS NOT NULL
   ALTER TABLE Shared.DimEquipment
   ADD CONSTRAINT fk_DimEquipment_DimVelocityUnitID
   FOREIGN KEY
   (
       DimVelocityUnitID
   )
   REFERENCES
       Shared.DimVelocityUnit(DimVelocityUnitID);
GO


IF OBJECT_ID('Shared.DimEnergyConsumptionUnit') IS NOT NULL
   ALTER TABLE Shared.DimEquipment
   ADD CONSTRAINT fk_DimEquipment_DimEnergyConsumptionUnitID
   FOREIGN KEY
   (
       DimEnergyConsumptionUnitID
   )
   REFERENCES
       Shared.DimEnergyConsumptionUnit(DimEnergyConsumptionUnitID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AssetCode',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'AssetCode';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'AssetCode';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'SerialNumber',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'SerialNumber';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'SerialNumber';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimModelID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'DimModelID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'DimModelID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimManufacturerID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'DimManufacturerID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'DimManufacturerID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimManufactureDateID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'DimManufactureDateID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'DimManufactureDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPurchaseDateID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'DimPurchaseDateID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'DimPurchaseDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimVelocityUnitID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'DimVelocityUnitID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'DimVelocityUnitID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEnergyConsumptionUnitID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'DimEnergyConsumptionUnitID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEquipment',
@level2type=N'COLUMN',
@level2name=N'DimEnergyConsumptionUnitID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimEventType */
IF OBJECT_ID('Shared.DimEventType') IS NOT NULL
DROP TABLE DimEventType;
GO


/* Create table Shared.DimEventType */
CREATE TABLE Shared.DimEventType
(
   DimEventTypeID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimEventType
ADD CONSTRAINT pk_DimEventTypeID
PRIMARY KEY CLUSTERED
(
   DimEventTypeID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimEventType_SourceKey
ON Shared.DimEventType
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEventType',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEventType',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEventType',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEventType',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimEventType',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimExceptionLevel1 */
IF OBJECT_ID('Shared.DimExceptionLevel1') IS NOT NULL
DROP TABLE DimExceptionLevel1;
GO


/* Create table Shared.DimExceptionLevel1 */
CREATE TABLE Shared.DimExceptionLevel1
(
   DimExceptionLevel1ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimExceptionLevel1
ADD CONSTRAINT pk_DimExceptionLevel1ID
PRIMARY KEY CLUSTERED
(
   DimExceptionLevel1ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimExceptionLevel1_SourceKey
ON Shared.DimExceptionLevel1
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel1',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel1',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel1',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel1',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel1',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimExceptionLevel2 */
IF OBJECT_ID('Shared.DimExceptionLevel2') IS NOT NULL
DROP TABLE DimExceptionLevel2;
GO


/* Create table Shared.DimExceptionLevel2 */
CREATE TABLE Shared.DimExceptionLevel2
(
   DimExceptionLevel2ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimExceptionLevel2
ADD CONSTRAINT pk_DimExceptionLevel2ID
PRIMARY KEY CLUSTERED
(
   DimExceptionLevel2ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimExceptionLevel2_SourceKey
ON Shared.DimExceptionLevel2
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel2',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel2',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel2',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel2',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel2',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimExceptionLevel3 */
IF OBJECT_ID('Shared.DimExceptionLevel3') IS NOT NULL
DROP TABLE DimExceptionLevel3;
GO


/* Create table Shared.DimExceptionLevel3 */
CREATE TABLE Shared.DimExceptionLevel3
(
   DimExceptionLevel3ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   DimExceptionLevel1ID INT,
   DimExceptionLevel2ID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimExceptionLevel3
ADD CONSTRAINT pk_DimExceptionLevel3ID
PRIMARY KEY CLUSTERED
(
   DimExceptionLevel3ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimExceptionLevel3_SourceKey
ON Shared.DimExceptionLevel3
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimExceptionLevel1') IS NOT NULL
   ALTER TABLE Shared.DimExceptionLevel3
   ADD CONSTRAINT fk_DimExceptionLevel3_DimExceptionLevel1ID
   FOREIGN KEY
   (
       DimExceptionLevel1ID
   )
   REFERENCES
       Shared.DimExceptionLevel1(DimExceptionLevel1ID);
GO


IF OBJECT_ID('Shared.DimExceptionLevel2') IS NOT NULL
   ALTER TABLE Shared.DimExceptionLevel3
   ADD CONSTRAINT fk_DimExceptionLevel3_DimExceptionLevel2ID
   FOREIGN KEY
   (
       DimExceptionLevel2ID
   )
   REFERENCES
       Shared.DimExceptionLevel2(DimExceptionLevel2ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel3',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel3',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel3',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel3',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel3',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimExceptionLevel1ID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel3',
@level2type=N'COLUMN',
@level2name=N'DimExceptionLevel1ID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel3',
@level2type=N'COLUMN',
@level2name=N'DimExceptionLevel1ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimExceptionLevel2ID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel3',
@level2type=N'COLUMN',
@level2name=N'DimExceptionLevel2ID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExceptionLevel3',
@level2type=N'COLUMN',
@level2name=N'DimExceptionLevel2ID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimExclusionLevel1 */
IF OBJECT_ID('Shared.DimExclusionLevel1') IS NOT NULL
DROP TABLE DimExclusionLevel1;
GO


/* Create table Shared.DimExclusionLevel1 */
CREATE TABLE Shared.DimExclusionLevel1
(
   DimExclusionLevel1ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimExclusionLevel1
ADD CONSTRAINT pk_DimExclusionLevel1ID
PRIMARY KEY CLUSTERED
(
   DimExclusionLevel1ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimExclusionLevel1_SourceKey
ON Shared.DimExclusionLevel1
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel1',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel1',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel1',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel1',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel1',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimExclusionLevel2 */
IF OBJECT_ID('Shared.DimExclusionLevel2') IS NOT NULL
DROP TABLE DimExclusionLevel2;
GO


/* Create table Shared.DimExclusionLevel2 */
CREATE TABLE Shared.DimExclusionLevel2
(
   DimExclusionLevel2ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   DimExclusionLevel1ID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimExclusionLevel2
ADD CONSTRAINT pk_DimExclusionLevel2ID
PRIMARY KEY CLUSTERED
(
   DimExclusionLevel2ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimExclusionLevel2_SourceKey
ON Shared.DimExclusionLevel2
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimExclusionLevel1') IS NOT NULL
   ALTER TABLE Shared.DimExclusionLevel2
   ADD CONSTRAINT fk_DimExclusionLevel2_DimExclusionLevel1ID
   FOREIGN KEY
   (
       DimExclusionLevel1ID
   )
   REFERENCES
       Shared.DimExclusionLevel1(DimExclusionLevel1ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel2',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel2',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel2',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel2',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel2',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimExclusionLevel1ID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel2',
@level2type=N'COLUMN',
@level2name=N'DimExclusionLevel1ID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel2',
@level2type=N'COLUMN',
@level2name=N'DimExclusionLevel1ID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimExclusionLevel3 */
IF OBJECT_ID('Shared.DimExclusionLevel3') IS NOT NULL
DROP TABLE DimExclusionLevel3;
GO


/* Create table Shared.DimExclusionLevel3 */
CREATE TABLE Shared.DimExclusionLevel3
(
   DimExclusionLevel3ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   DimExclusionLevel2ID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimExclusionLevel3
ADD CONSTRAINT pk_DimExclusionLevel3ID
PRIMARY KEY CLUSTERED
(
   DimExclusionLevel3ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimExclusionLevel3_SourceKey
ON Shared.DimExclusionLevel3
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimExclusionLevel2') IS NOT NULL
   ALTER TABLE Shared.DimExclusionLevel3
   ADD CONSTRAINT fk_DimExclusionLevel3_DimExclusionLevel2ID
   FOREIGN KEY
   (
       DimExclusionLevel2ID
   )
   REFERENCES
       Shared.DimExclusionLevel2(DimExclusionLevel2ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel3',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel3',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel3',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel3',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel3',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimExclusionLevel2ID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel3',
@level2type=N'COLUMN',
@level2name=N'DimExclusionLevel2ID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimExclusionLevel3',
@level2type=N'COLUMN',
@level2name=N'DimExclusionLevel2ID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimLocation */
IF OBJECT_ID('Shared.DimLocation') IS NOT NULL
DROP TABLE DimLocation;
GO


/* Create table Shared.DimLocation */
CREATE TABLE Shared.DimLocation
(
   DimLocationID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   AreaID INT,
   Latitude VARCHAR(255),
   Longitude VARCHAR(255),
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimLocation
ADD CONSTRAINT pk_DimLocationID
PRIMARY KEY CLUSTERED
(
   DimLocationID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimLocation_SourceKey
ON Shared.DimLocation
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimLocation',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimLocation',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimLocation',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimLocation',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimLocation',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AreaID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimLocation',
@level2type=N'COLUMN',
@level2name=N'AreaID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimLocation',
@level2type=N'COLUMN',
@level2name=N'AreaID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Latitude',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimLocation',
@level2type=N'COLUMN',
@level2name=N'Latitude';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimLocation',
@level2type=N'COLUMN',
@level2name=N'Latitude';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Longitude',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimLocation',
@level2type=N'COLUMN',
@level2name=N'Longitude';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimLocation',
@level2type=N'COLUMN',
@level2name=N'Longitude';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimManufacturer */
IF OBJECT_ID('Shared.DimManufacturer') IS NOT NULL
DROP TABLE DimManufacturer;
GO


/* Create table Shared.DimManufacturer */
CREATE TABLE Shared.DimManufacturer
(
   DimManufacturerID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   CountryID INT,
   Brand VARCHAR(255),
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimManufacturer
ADD CONSTRAINT pk_DimManufacturerID
PRIMARY KEY CLUSTERED
(
   DimManufacturerID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimManufacturer_SourceKey
ON Shared.DimManufacturer
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimManufacturer',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimManufacturer',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimManufacturer',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimManufacturer',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimManufacturer',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'CountryID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimManufacturer',
@level2type=N'COLUMN',
@level2name=N'CountryID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimManufacturer',
@level2type=N'COLUMN',
@level2name=N'CountryID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Brand',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimManufacturer',
@level2type=N'COLUMN',
@level2name=N'Brand';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimManufacturer',
@level2type=N'COLUMN',
@level2name=N'Brand';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimModel */
IF OBJECT_ID('Shared.DimModel') IS NOT NULL
DROP TABLE DimModel;
GO


/* Create table Shared.DimModel */
CREATE TABLE Shared.DimModel
(
   DimModelID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   Capacity DECIMAL(18,5),
   CapacityUnitID INT,
   Range DECIMAL(18,5),
   RangeUnitID INT,
   ModelYear INT,
   ModelMonth TINYINT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimModel
ADD CONSTRAINT pk_DimModelID
PRIMARY KEY CLUSTERED
(
   DimModelID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimModel_SourceKey
ON Shared.DimModel
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimModel',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimModel',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimModel',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimModel',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimModel',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Capacity',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimModel',
@level2type=N'COLUMN',
@level2name=N'Capacity';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimModel',
@level2type=N'COLUMN',
@level2name=N'Capacity';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'CapacityUnitID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimModel',
@level2type=N'COLUMN',
@level2name=N'CapacityUnitID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimModel',
@level2type=N'COLUMN',
@level2name=N'CapacityUnitID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Range',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimModel',
@level2type=N'COLUMN',
@level2name=N'Range';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimModel',
@level2type=N'COLUMN',
@level2name=N'Range';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'RangeUnitID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimModel',
@level2type=N'COLUMN',
@level2name=N'RangeUnitID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimModel',
@level2type=N'COLUMN',
@level2name=N'RangeUnitID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'ModelYear',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimModel',
@level2type=N'COLUMN',
@level2name=N'ModelYear';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimModel',
@level2type=N'COLUMN',
@level2name=N'ModelYear';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'ModelMonth',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimModel',
@level2type=N'COLUMN',
@level2name=N'ModelMonth';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimModel',
@level2type=N'COLUMN',
@level2name=N'ModelMonth';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimOperator */
IF OBJECT_ID('Shared.DimOperator') IS NOT NULL
DROP TABLE DimOperator;
GO


/* Create table Shared.DimOperator */
CREATE TABLE Shared.DimOperator
(
   DimOperatorID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   EmployeeID INT,
   FirstName VARCHAR(255),
   LastName VARCHAR(255),
   TelephoneNumber VARCHAR(255),
   DateOfBirth INT,
   PassportNumber VARCHAR(255),
   EmailAddress VARCHAR(255),
   NationalIdentificationNumber VARCHAR(255),
   HireDate INT,
   TerminationDate INT,
   DimOrganisationLevel5ID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimOperator
ADD CONSTRAINT pk_DimOperatorID
PRIMARY KEY CLUSTERED
(
   DimOperatorID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimOperator_SourceKey
ON Shared.DimOperator
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Shared.DimOperator
   ADD CONSTRAINT fk_DimOperator_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'EmployeeID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'EmployeeID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'EmployeeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'FirstName',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'FirstName';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'FirstName';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'LastName',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'LastName';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'LastName';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'TelephoneNumber',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'TelephoneNumber';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'TelephoneNumber';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DateOfBirth',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'DateOfBirth';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'DateOfBirth';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'PassportNumber',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'PassportNumber';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'PassportNumber';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'EmailAddress',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'EmailAddress';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'EmailAddress';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'NationalIdentificationNumber',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'NationalIdentificationNumber';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'NationalIdentificationNumber';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'HireDate',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'HireDate';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'HireDate';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'TerminationDate',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'TerminationDate';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'TerminationDate';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOperator',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimOrganisationLevel1 */
IF OBJECT_ID('Shared.DimOrganisationLevel1') IS NOT NULL
DROP TABLE DimOrganisationLevel1;
GO


/* Create table Shared.DimOrganisationLevel1 */
CREATE TABLE Shared.DimOrganisationLevel1
(
   DimOrganisationLevel1ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimOrganisationLevel1
ADD CONSTRAINT pk_DimOrganisationLevel1ID
PRIMARY KEY CLUSTERED
(
   DimOrganisationLevel1ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimOrganisationLevel1_SourceKey
ON Shared.DimOrganisationLevel1
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel1',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel1',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel1',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel1',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel1',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimOrganisationLevel2 */
IF OBJECT_ID('Shared.DimOrganisationLevel2') IS NOT NULL
DROP TABLE DimOrganisationLevel2;
GO


/* Create table Shared.DimOrganisationLevel2 */
CREATE TABLE Shared.DimOrganisationLevel2
(
   DimOrganisationLevel2ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   DimOrganisationLevel1ID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimOrganisationLevel2
ADD CONSTRAINT pk_DimOrganisationLevel2ID
PRIMARY KEY CLUSTERED
(
   DimOrganisationLevel2ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimOrganisationLevel2_SourceKey
ON Shared.DimOrganisationLevel2
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimOrganisationLevel1') IS NOT NULL
   ALTER TABLE Shared.DimOrganisationLevel2
   ADD CONSTRAINT fk_DimOrganisationLevel2_DimOrganisationLevel1ID
   FOREIGN KEY
   (
       DimOrganisationLevel1ID
   )
   REFERENCES
       Shared.DimOrganisationLevel1(DimOrganisationLevel1ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel2',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel2',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel2',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel2',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel2',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel1ID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel2',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel1ID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel2',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel1ID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimOrganisationLevel3 */
IF OBJECT_ID('Shared.DimOrganisationLevel3') IS NOT NULL
DROP TABLE DimOrganisationLevel3;
GO


/* Create table Shared.DimOrganisationLevel3 */
CREATE TABLE Shared.DimOrganisationLevel3
(
   DimOrganisationLevel3ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   DimOrganisationLevel2ID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimOrganisationLevel3
ADD CONSTRAINT pk_DimOrganisationLevel3ID
PRIMARY KEY CLUSTERED
(
   DimOrganisationLevel3ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimOrganisationLevel3_SourceKey
ON Shared.DimOrganisationLevel3
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimOrganisationLevel2') IS NOT NULL
   ALTER TABLE Shared.DimOrganisationLevel3
   ADD CONSTRAINT fk_DimOrganisationLevel3_DimOrganisationLevel2ID
   FOREIGN KEY
   (
       DimOrganisationLevel2ID
   )
   REFERENCES
       Shared.DimOrganisationLevel2(DimOrganisationLevel2ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel3',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel3',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel3',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel3',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel3',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel2ID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel3',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel2ID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel3',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel2ID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimOrganisationLevel4 */
IF OBJECT_ID('Shared.DimOrganisationLevel4') IS NOT NULL
DROP TABLE DimOrganisationLevel4;
GO


/* Create table Shared.DimOrganisationLevel4 */
CREATE TABLE Shared.DimOrganisationLevel4
(
   DimOrganisationLevel4ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   DimOrganisationLevel3ID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimOrganisationLevel4
ADD CONSTRAINT pk_DimOrganisationLevel4ID
PRIMARY KEY CLUSTERED
(
   DimOrganisationLevel4ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimOrganisationLevel4_SourceKey
ON Shared.DimOrganisationLevel4
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimOrganisationLevel3') IS NOT NULL
   ALTER TABLE Shared.DimOrganisationLevel4
   ADD CONSTRAINT fk_DimOrganisationLevel4_DimOrganisationLevel3ID
   FOREIGN KEY
   (
       DimOrganisationLevel3ID
   )
   REFERENCES
       Shared.DimOrganisationLevel3(DimOrganisationLevel3ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel4',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel4',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel4',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel4',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel4',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel3ID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel4',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel3ID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel4',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel3ID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimOrganisationLevel5 */
IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
DROP TABLE DimOrganisationLevel5;
GO


/* Create table Shared.DimOrganisationLevel5 */
CREATE TABLE Shared.DimOrganisationLevel5
(
   DimOrganisationLevel5ID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   DimOrganisationLevel4ID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimOrganisationLevel5
ADD CONSTRAINT pk_DimOrganisationLevel5ID
PRIMARY KEY CLUSTERED
(
   DimOrganisationLevel5ID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimOrganisationLevel5_SourceKey
ON Shared.DimOrganisationLevel5
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimOrganisationLevel4') IS NOT NULL
   ALTER TABLE Shared.DimOrganisationLevel5
   ADD CONSTRAINT fk_DimOrganisationLevel5_DimOrganisationLevel4ID
   FOREIGN KEY
   (
       DimOrganisationLevel4ID
   )
   REFERENCES
       Shared.DimOrganisationLevel4(DimOrganisationLevel4ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel5',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel5',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel5',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel5',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel5',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel4ID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel5',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel4ID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimOrganisationLevel5',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel4ID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimPayload */
IF OBJECT_ID('Shared.DimPayload') IS NOT NULL
DROP TABLE DimPayload;
GO


/* Create table Shared.DimPayload */
CREATE TABLE Shared.DimPayload
(
   DimPayloadID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   PayloadUnitID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimPayload
ADD CONSTRAINT pk_DimPayloadID
PRIMARY KEY CLUSTERED
(
   DimPayloadID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimPayload_SourceKey
ON Shared.DimPayload
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPayload',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPayload',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPayload',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPayload',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPayload',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'PayloadUnitID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPayload',
@level2type=N'COLUMN',
@level2name=N'PayloadUnitID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPayload',
@level2type=N'COLUMN',
@level2name=N'PayloadUnitID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimPointOfInterest */
IF OBJECT_ID('Shared.DimPointOfInterest') IS NOT NULL
DROP TABLE DimPointOfInterest;
GO


/* Create table Shared.DimPointOfInterest */
CREATE TABLE Shared.DimPointOfInterest
(
   DimPointOfInterestID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   AreaID INT,
   [Geography] [GEOGRAPHY],
   TopoJSONurl VARCHAR(255),
   GeoJSONurl VARCHAR(255),
   AreaSQM DECIMAL(18,5),
   UpperBoundary DECIMAL(18,5),
   LowerBoundary DECIMAL(18,5),
   RightBoundary DECIMAL(18,5),
   LeftBoundary DECIMAL(18,5),
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimPointOfInterest
ADD CONSTRAINT pk_DimPointOfInterestID
PRIMARY KEY CLUSTERED
(
   DimPointOfInterestID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimPointOfInterest_SourceKey
ON Shared.DimPointOfInterest
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AreaID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'AreaID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'AreaID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'[Geography]',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'Geography';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'Geography';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'TopoJSONurl',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'TopoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'TopoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'GeoJSONurl',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'GeoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'GeoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AreaSQM',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'AreaSQM';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'AreaSQM';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'UpperBoundary',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'UpperBoundary';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'UpperBoundary';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'LowerBoundary',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'LowerBoundary';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'LowerBoundary';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'RightBoundary',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'RightBoundary';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'RightBoundary';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'LeftBoundary',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'LeftBoundary';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimPointOfInterest',
@level2type=N'COLUMN',
@level2name=N'LeftBoundary';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimProduct */
IF OBJECT_ID('Shared.DimProduct') IS NOT NULL
DROP TABLE DimProduct;
GO


/* Create table Shared.DimProduct */
CREATE TABLE Shared.DimProduct
(
   DimProductID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   ProductUnitID INT,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimProduct
ADD CONSTRAINT pk_DimProductID
PRIMARY KEY CLUSTERED
(
   DimProductID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimProduct_SourceKey
ON Shared.DimProduct
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProduct',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProduct',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProduct',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProduct',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProduct',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'ProductUnitID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProduct',
@level2type=N'COLUMN',
@level2name=N'ProductUnitID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProduct',
@level2type=N'COLUMN',
@level2name=N'ProductUnitID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimProvince_State */
IF OBJECT_ID('Shared.DimProvince_State') IS NOT NULL
DROP TABLE DimProvince_State;
GO


/* Create table Shared.DimProvince_State */
CREATE TABLE Shared.DimProvince_State
(
   DimProvince_StateID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   [Geography] [GEOGRAPHY],
   TopoJSONurl VARCHAR(255),
   GeoJSONurl VARCHAR(255),
   AreaSQM DECIMAL(18,5),
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimProvince_State
ADD CONSTRAINT pk_DimProvince_StateID
PRIMARY KEY CLUSTERED
(
   DimProvince_StateID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimProvince_State_SourceKey
ON Shared.DimProvince_State
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProvince_State',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProvince_State',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProvince_State',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProvince_State',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProvince_State',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'[Geography]',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProvince_State',
@level2type=N'COLUMN',
@level2name=N'Geography';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProvince_State',
@level2type=N'COLUMN',
@level2name=N'Geography';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'TopoJSONurl',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProvince_State',
@level2type=N'COLUMN',
@level2name=N'TopoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProvince_State',
@level2type=N'COLUMN',
@level2name=N'TopoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'GeoJSONurl',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProvince_State',
@level2type=N'COLUMN',
@level2name=N'GeoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProvince_State',
@level2type=N'COLUMN',
@level2name=N'GeoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AreaSQM',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProvince_State',
@level2type=N'COLUMN',
@level2name=N'AreaSQM';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimProvince_State',
@level2type=N'COLUMN',
@level2name=N'AreaSQM';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimRegion */
IF OBJECT_ID('Shared.DimRegion') IS NOT NULL
DROP TABLE DimRegion;
GO


/* Create table Shared.DimRegion */
CREATE TABLE Shared.DimRegion
(
   DimRegionID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   [Geography] [GEOGRAPHY],
   TopoJSONurl VARCHAR(255),
   GeoJSONurl VARCHAR(255),
   AreaSQM DECIMAL(18,5),
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimRegion
ADD CONSTRAINT pk_DimRegionID
PRIMARY KEY CLUSTERED
(
   DimRegionID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimRegion_SourceKey
ON Shared.DimRegion
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimRegion',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimRegion',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimRegion',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimRegion',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimRegion',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'[Geography]',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimRegion',
@level2type=N'COLUMN',
@level2name=N'Geography';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimRegion',
@level2type=N'COLUMN',
@level2name=N'Geography';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'TopoJSONurl',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimRegion',
@level2type=N'COLUMN',
@level2name=N'TopoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimRegion',
@level2type=N'COLUMN',
@level2name=N'TopoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'GeoJSONurl',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimRegion',
@level2type=N'COLUMN',
@level2name=N'GeoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimRegion',
@level2type=N'COLUMN',
@level2name=N'GeoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AreaSQM',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimRegion',
@level2type=N'COLUMN',
@level2name=N'AreaSQM';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimRegion',
@level2type=N'COLUMN',
@level2name=N'AreaSQM';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimSite */
IF OBJECT_ID('Shared.DimSite') IS NOT NULL
DROP TABLE DimSite;
GO


/* Create table Shared.DimSite */
CREATE TABLE Shared.DimSite
(
   DimSiteID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   AreaID INT,
   [Geography] [GEOGRAPHY],
   TopoJSONurl VARCHAR(255),
   GeoJSONurl VARCHAR(255),
   AreaSQM DECIMAL(18,5),
   UpperBoundary DECIMAL(18,5),
   LowerBoundary DECIMAL(18,5),
   RightBoundary DECIMAL(18,5),
   LeftBoundary DECIMAL(18,5),
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimSite
ADD CONSTRAINT pk_DimSiteID
PRIMARY KEY CLUSTERED
(
   DimSiteID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimSite_SourceKey
ON Shared.DimSite
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AreaID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'AreaID';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'AreaID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'[Geography]',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'Geography';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'Geography';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'TopoJSONurl',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'TopoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'TopoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'GeoJSONurl',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'GeoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'GeoJSONurl';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AreaSQM',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'AreaSQM';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'AreaSQM';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'UpperBoundary',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'UpperBoundary';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'UpperBoundary';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'LowerBoundary',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'LowerBoundary';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'LowerBoundary';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'RightBoundary',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'RightBoundary';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'RightBoundary';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'LeftBoundary',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'LeftBoundary';
GO

exec sys.sp_addextendedproperty
@name=N'UnknownMember',
@value=N'Inferred',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimSite',
@level2type=N'COLUMN',
@level2name=N'LeftBoundary';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimTime */
IF OBJECT_ID('Shared.DimTime') IS NOT NULL
DROP TABLE DimTime;
GO


/* Create table Shared.DimTime */
CREATE TABLE Shared.DimTime
(
   DimTimeID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimTime
ADD CONSTRAINT pk_DimTimeID
PRIMARY KEY CLUSTERED
(
   DimTimeID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimTime_SourceKey
ON Shared.DimTime
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimTime',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimTime',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimTime',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimTime',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimTime',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimTripCategory */
IF OBJECT_ID('Shared.DimTripCategory') IS NOT NULL
DROP TABLE DimTripCategory;
GO


/* Create table Shared.DimTripCategory */
CREATE TABLE Shared.DimTripCategory
(
   DimTripCategoryID INT NOT NULL,
   Name VARCHAR(255) NULL,
   Code VARCHAR(50) NULL,
   SourceKey VARCHAR(255) NOT NULL,
   SourceKeyHash BIGINT NOT NULL,
   DeltaHash BIGINT NOT NULL,
   sysModifiedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysModifiedOn DATETIME NOT NULL DEFAULT GETDATE(),
   sysCreatedBy VARCHAR(255) NOT NULL DEFAULT SYSTEM_USER,
   sysCreatedOn DATETIME NOT NULL DEFAULT GETDATE()
);
GO


ALTER TABLE Shared.DimTripCategory
ADD CONSTRAINT pk_DimTripCategoryID
PRIMARY KEY CLUSTERED
(
   DimTripCategoryID
);
GO


CREATE UNIQUE NONCLUSTERED INDEX ix_DimTripCategory_SourceKey
ON Shared.DimTripCategory
(
    SourceKey
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimTripCategory',
@level2type=N'COLUMN',
@level2name=N'Name';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'2',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimTripCategory',
@level2type=N'COLUMN',
@level2name=N'Code';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKey',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimTripCategory',
@level2type=N'COLUMN',
@level2name=N'SourceKey';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'BusinessKeyHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimTripCategory',
@level2type=N'COLUMN',
@level2name=N'SourceKeyHash';
GO

exec sys.sp_addextendedproperty
@name=N'SCDType',
@value=N'DeltaHash',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'DimTripCategory',
@level2type=N'COLUMN',
@level2name=N'DeltaHash';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table DimUnit */
IF OBJECT_ID('Shared.DimUnit') IS NOT NULL
DROP TABLE DimUnit;
GO


/* Create table Shared.DimUnit */
CREATE TABLE Shared.DimUnit
(
   DimUnitID INT NOT NULL,
   RunID INT NOT NULL
);
GO


ALTER TABLE Shared.DimUnit
ADD CONSTRAINT pk_DimUnitID
PRIMARY KEY CLUSTERED
(
   DimUnitID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
--Table extended properties...

DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Activity';
IF SCHEMA_ID('Activity')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactActivityDetail */
IF OBJECT_ID('Activity.FactActivityDetail') IS NOT NULL
DROP TABLE FactActivityDetail;
GO


/* Create table Activity.FactActivityDetail */
CREATE TABLE Activity.FactActivityDetail
(
   FactActivityDetailID INT NOT NULL,
   DimDateID INT,
   DimTimeID INT,
   DimEquipmentID INT,
   DimOrganisationLevel5ID INT,
   EnergyConsumption DECIMAL(18,2),
   Acceleration DECIMAL(18,2),
   Velocity DECIMAL(18,2),
   LateralVelocity DECIMAL(18,2),
   LateralAcceleration DECIMAL(18,2),
   Latitude DECIMAL(18,2),
   Longitude DECIMAL(18,2),
   EquipmentStart DECIMAL(18,2),
   EquipmentEnd DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Activity.FactActivityDetail
ADD CONSTRAINT pk_FactActivityDetailID
PRIMARY KEY CLUSTERED
(
   FactActivityDetailID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Activity.FactActivityDetail
   ADD CONSTRAINT fk_FactActivityDetail_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimTime') IS NOT NULL
   ALTER TABLE Activity.FactActivityDetail
   ADD CONSTRAINT fk_FactActivityDetail_DimTimeID
   FOREIGN KEY
   (
       DimTimeID
   )
   REFERENCES
       Shared.DimTime(DimTimeID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Activity.FactActivityDetail
   ADD CONSTRAINT fk_FactActivityDetail_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Activity.FactActivityDetail
   ADD CONSTRAINT fk_FactActivityDetail_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivityDetail',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimTimeID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivityDetail',
@level2type=N'COLUMN',
@level2name=N'DimTimeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivityDetail',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivityDetail',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'EnergyConsumption',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivityDetail',
@level2type=N'COLUMN',
@level2name=N'EnergyConsumption';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Acceleration',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivityDetail',
@level2type=N'COLUMN',
@level2name=N'Acceleration';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Velocity',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivityDetail',
@level2type=N'COLUMN',
@level2name=N'Velocity';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'LateralVelocity',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivityDetail',
@level2type=N'COLUMN',
@level2name=N'LateralVelocity';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'LateralAcceleration',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivityDetail',
@level2type=N'COLUMN',
@level2name=N'LateralAcceleration';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Latitude',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivityDetail',
@level2type=N'COLUMN',
@level2name=N'Latitude';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Longitude',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivityDetail',
@level2type=N'COLUMN',
@level2name=N'Longitude';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'EquipmentStart',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivityDetail',
@level2type=N'COLUMN',
@level2name=N'EquipmentStart';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'EquipmentEnd',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivityDetail',
@level2type=N'COLUMN',
@level2name=N'EquipmentEnd';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Exceptions';
IF SCHEMA_ID('Exceptions')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactActivityException */
IF OBJECT_ID('Exceptions.FactActivityException') IS NOT NULL
DROP TABLE FactActivityException;
GO


/* Create table Exceptions.FactActivityException */
CREATE TABLE Exceptions.FactActivityException
(
   FactActivityExceptionID INT NOT NULL,
   DimDateID INT,
   DimTimeID INT,
   DimExceptionLevel3ID INT,
   DimEquipmentID INT,
   EnergyConsumption DECIMAL(18,2),
   Acceleration DECIMAL(18,2),
   Velocity DECIMAL(18,2),
   LateralVelocity DECIMAL(18,2),
   LateralAcceleration DECIMAL(18,2),
   Latitude DECIMAL(18,2),
   Longitude DECIMAL(18,2),
   EquipmentStart DECIMAL(18,2),
   EquipmentEnd DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Exceptions.FactActivityException
ADD CONSTRAINT pk_FactActivityExceptionID
PRIMARY KEY CLUSTERED
(
   FactActivityExceptionID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Exceptions.FactActivityException
   ADD CONSTRAINT fk_FactActivityException_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimTime') IS NOT NULL
   ALTER TABLE Exceptions.FactActivityException
   ADD CONSTRAINT fk_FactActivityException_DimTimeID
   FOREIGN KEY
   (
       DimTimeID
   )
   REFERENCES
       Shared.DimTime(DimTimeID);
GO


IF OBJECT_ID('Shared.DimExceptionLevel3') IS NOT NULL
   ALTER TABLE Exceptions.FactActivityException
   ADD CONSTRAINT fk_FactActivityException_DimExceptionLevel3ID
   FOREIGN KEY
   (
       DimExceptionLevel3ID
   )
   REFERENCES
       Shared.DimExceptionLevel3(DimExceptionLevel3ID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Exceptions.FactActivityException
   ADD CONSTRAINT fk_FactActivityException_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityException',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimTimeID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityException',
@level2type=N'COLUMN',
@level2name=N'DimTimeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimExceptionLevel3ID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityException',
@level2type=N'COLUMN',
@level2name=N'DimExceptionLevel3ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityException',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'EnergyConsumption',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityException',
@level2type=N'COLUMN',
@level2name=N'EnergyConsumption';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Acceleration',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityException',
@level2type=N'COLUMN',
@level2name=N'Acceleration';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Velocity',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityException',
@level2type=N'COLUMN',
@level2name=N'Velocity';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'LateralVelocity',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityException',
@level2type=N'COLUMN',
@level2name=N'LateralVelocity';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'LateralAcceleration',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityException',
@level2type=N'COLUMN',
@level2name=N'LateralAcceleration';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Latitude',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityException',
@level2type=N'COLUMN',
@level2name=N'Latitude';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Longitude',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityException',
@level2type=N'COLUMN',
@level2name=N'Longitude';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'EquipmentStart',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityException',
@level2type=N'COLUMN',
@level2name=N'EquipmentStart';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'EquipmentEnd',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityException',
@level2type=N'COLUMN',
@level2name=N'EquipmentEnd';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Exceptions';
IF SCHEMA_ID('Exceptions')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactActivityExclusion */
IF OBJECT_ID('Exceptions.FactActivityExclusion') IS NOT NULL
DROP TABLE FactActivityExclusion;
GO


/* Create table Exceptions.FactActivityExclusion */
CREATE TABLE Exceptions.FactActivityExclusion
(
   FactActivityExclusionID INT NOT NULL,
   DimDateID INT,
   DimExclusionLevel3ID INT,
   DimEquipmentID INT,
   DimLocationID INT,
   DimPointOfInterestID INT,
   RunID INT NOT NULL
);
GO


ALTER TABLE Exceptions.FactActivityExclusion
ADD CONSTRAINT pk_FactActivityExclusionID
PRIMARY KEY CLUSTERED
(
   FactActivityExclusionID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Exceptions.FactActivityExclusion
   ADD CONSTRAINT fk_FactActivityExclusion_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimExclusionLevel3') IS NOT NULL
   ALTER TABLE Exceptions.FactActivityExclusion
   ADD CONSTRAINT fk_FactActivityExclusion_DimExclusionLevel3ID
   FOREIGN KEY
   (
       DimExclusionLevel3ID
   )
   REFERENCES
       Shared.DimExclusionLevel3(DimExclusionLevel3ID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Exceptions.FactActivityExclusion
   ADD CONSTRAINT fk_FactActivityExclusion_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimLocation') IS NOT NULL
   ALTER TABLE Exceptions.FactActivityExclusion
   ADD CONSTRAINT fk_FactActivityExclusion_DimLocationID
   FOREIGN KEY
   (
       DimLocationID
   )
   REFERENCES
       Shared.DimLocation(DimLocationID);
GO


IF OBJECT_ID('Shared.DimPointOfInterest') IS NOT NULL
   ALTER TABLE Exceptions.FactActivityExclusion
   ADD CONSTRAINT fk_FactActivityExclusion_DimPointOfInterestID
   FOREIGN KEY
   (
       DimPointOfInterestID
   )
   REFERENCES
       Shared.DimPointOfInterest(DimPointOfInterestID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityExclusion',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimExclusionLevel3ID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityExclusion',
@level2type=N'COLUMN',
@level2name=N'DimExclusionLevel3ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityExclusion',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimLocationID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityExclusion',
@level2type=N'COLUMN',
@level2name=N'DimLocationID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPointOfInterestID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityExclusion',
@level2type=N'COLUMN',
@level2name=N'DimPointOfInterestID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Activity';
IF SCHEMA_ID('Activity')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactActivitySummary */
IF OBJECT_ID('Activity.FactActivitySummary') IS NOT NULL
DROP TABLE FactActivitySummary;
GO


/* Create table Activity.FactActivitySummary */
CREATE TABLE Activity.FactActivitySummary
(
   FactActivitySummaryID INT NOT NULL,
   DimDateID INT,
   DimEquipmentID INT,
   DimLocationID INT,
   DimPayloadID INT,
   DimSiteID INT,
   DimOrganisationLevel5ID INT,
   DimPayloadUnitID INT,
   Duration DECIMAL(18,2),
   Payload DECIMAL(18,2),
   MaximumEnergyConsumption DECIMAL(18,2),
   AverageEnergyConsumption DECIMAL(18,2),
   OutOfBandEnergyConsumption DECIMAL(18,2),
   MaximumAcceleration DECIMAL(18,2),
   AverageAcceleration DECIMAL(18,2),
   OutOfBandAcceleration DECIMAL(18,2),
   MaximumVelocity DECIMAL(18,2),
   AverageVelocity DECIMAL(18,2),
   OutOfBandVelocity DECIMAL(18,2),
   MaximumLateralVelocity DECIMAL(18,2),
   AverageLateralVelocity DECIMAL(18,2),
   OutOfBandLateralVelocity DECIMAL(18,2),
   MaximumLateralAcceleration DECIMAL(18,2),
   AverageLateralAcceleration DECIMAL(18,2),
   OutOfBandLateralAcceleration DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Activity.FactActivitySummary
ADD CONSTRAINT pk_FactActivitySummaryID
PRIMARY KEY CLUSTERED
(
   FactActivitySummaryID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Activity.FactActivitySummary
   ADD CONSTRAINT fk_FactActivitySummary_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Activity.FactActivitySummary
   ADD CONSTRAINT fk_FactActivitySummary_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimLocation') IS NOT NULL
   ALTER TABLE Activity.FactActivitySummary
   ADD CONSTRAINT fk_FactActivitySummary_DimLocationID
   FOREIGN KEY
   (
       DimLocationID
   )
   REFERENCES
       Shared.DimLocation(DimLocationID);
GO


IF OBJECT_ID('Shared.DimPayload') IS NOT NULL
   ALTER TABLE Activity.FactActivitySummary
   ADD CONSTRAINT fk_FactActivitySummary_DimPayloadID
   FOREIGN KEY
   (
       DimPayloadID
   )
   REFERENCES
       Shared.DimPayload(DimPayloadID);
GO


IF OBJECT_ID('Shared.DimSite') IS NOT NULL
   ALTER TABLE Activity.FactActivitySummary
   ADD CONSTRAINT fk_FactActivitySummary_DimSiteID
   FOREIGN KEY
   (
       DimSiteID
   )
   REFERENCES
       Shared.DimSite(DimSiteID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Activity.FactActivitySummary
   ADD CONSTRAINT fk_FactActivitySummary_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


IF OBJECT_ID('Shared.DimUnit') IS NOT NULL
   ALTER TABLE Activity.FactActivitySummary
   ADD CONSTRAINT fk_FactActivitySummary_DimPayloadUnitID
   FOREIGN KEY
   (
       DimPayloadUnitID
   )
   REFERENCES
       Shared.DimUnit(DimUnitID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimLocationID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'DimLocationID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPayloadID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'DimPayloadID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimSiteID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'DimSiteID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPayloadUnitID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'DimPayloadUnitID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Duration',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'Duration';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Payload',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'Payload';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'MaximumEnergyConsumption',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'MaximumEnergyConsumption';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AverageEnergyConsumption',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'AverageEnergyConsumption';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'OutOfBandEnergyConsumption',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'OutOfBandEnergyConsumption';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'MaximumAcceleration',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'MaximumAcceleration';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AverageAcceleration',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'AverageAcceleration';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'OutOfBandAcceleration',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'OutOfBandAcceleration';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'MaximumVelocity',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'MaximumVelocity';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AverageVelocity',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'AverageVelocity';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'OutOfBandVelocity',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'OutOfBandVelocity';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'MaximumLateralVelocity',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'MaximumLateralVelocity';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AverageLateralVelocity',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'AverageLateralVelocity';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'OutOfBandLateralVelocity',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'OutOfBandLateralVelocity';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'MaximumLateralAcceleration',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'MaximumLateralAcceleration';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AverageLateralAcceleration',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'AverageLateralAcceleration';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'OutOfBandLateralAcceleration',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'OutOfBandLateralAcceleration';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Costs';
IF SCHEMA_ID('Costs')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactBudget */
IF OBJECT_ID('Costs.FactBudget') IS NOT NULL
DROP TABLE FactBudget;
GO


/* Create table Costs.FactBudget */
CREATE TABLE Costs.FactBudget
(
   FactBudgetID INT NOT NULL,
   DimCostTypeID INT,
   DimEquipmentID INT,
   DimLocationID INT,
   DimOrganisationLevel5ID INT,
   DimCurrencyID INT,
   FinancialAmount DECIMAL(18,2),
   Tax DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Costs.FactBudget
ADD CONSTRAINT pk_FactBudgetID
PRIMARY KEY CLUSTERED
(
   FactBudgetID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimCostType') IS NOT NULL
   ALTER TABLE Costs.FactBudget
   ADD CONSTRAINT fk_FactBudget_DimCostTypeID
   FOREIGN KEY
   (
       DimCostTypeID
   )
   REFERENCES
       Shared.DimCostType(DimCostTypeID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Costs.FactBudget
   ADD CONSTRAINT fk_FactBudget_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimLocation') IS NOT NULL
   ALTER TABLE Costs.FactBudget
   ADD CONSTRAINT fk_FactBudget_DimLocationID
   FOREIGN KEY
   (
       DimLocationID
   )
   REFERENCES
       Shared.DimLocation(DimLocationID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Costs.FactBudget
   ADD CONSTRAINT fk_FactBudget_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


IF OBJECT_ID('Shared.DimCurrency') IS NOT NULL
   ALTER TABLE Costs.FactBudget
   ADD CONSTRAINT fk_FactBudget_DimCurrencyID
   FOREIGN KEY
   (
       DimCurrencyID
   )
   REFERENCES
       Shared.DimCurrency(DimCurrencyID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCostTypeID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactBudget',
@level2type=N'COLUMN',
@level2name=N'DimCostTypeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactBudget',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimLocationID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactBudget',
@level2type=N'COLUMN',
@level2name=N'DimLocationID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactBudget',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCurrencyID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactBudget',
@level2type=N'COLUMN',
@level2name=N'DimCurrencyID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'FinancialAmount',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactBudget',
@level2type=N'COLUMN',
@level2name=N'FinancialAmount';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Tax',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactBudget',
@level2type=N'COLUMN',
@level2name=N'Tax';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Costs';
IF SCHEMA_ID('Costs')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactCapturedCosts */
IF OBJECT_ID('Costs.FactCapturedCosts') IS NOT NULL
DROP TABLE FactCapturedCosts;
GO


/* Create table Costs.FactCapturedCosts */
CREATE TABLE Costs.FactCapturedCosts
(
   FactCapturedCostsID INT NOT NULL,
   DimCostTypeID INT,
   DimEquipmentID INT,
   DimOperatorID INT,
   DimCurrencyID INT,
   FinancialAmount DECIMAL(18,2),
   Tax DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Costs.FactCapturedCosts
ADD CONSTRAINT pk_FactCapturedCostsID
PRIMARY KEY CLUSTERED
(
   FactCapturedCostsID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimCostType') IS NOT NULL
   ALTER TABLE Costs.FactCapturedCosts
   ADD CONSTRAINT fk_FactCapturedCosts_DimCostTypeID
   FOREIGN KEY
   (
       DimCostTypeID
   )
   REFERENCES
       Shared.DimCostType(DimCostTypeID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Costs.FactCapturedCosts
   ADD CONSTRAINT fk_FactCapturedCosts_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimOperator') IS NOT NULL
   ALTER TABLE Costs.FactCapturedCosts
   ADD CONSTRAINT fk_FactCapturedCosts_DimOperatorID
   FOREIGN KEY
   (
       DimOperatorID
   )
   REFERENCES
       Shared.DimOperator(DimOperatorID);
GO


IF OBJECT_ID('Shared.DimCurrency') IS NOT NULL
   ALTER TABLE Costs.FactCapturedCosts
   ADD CONSTRAINT fk_FactCapturedCosts_DimCurrencyID
   FOREIGN KEY
   (
       DimCurrencyID
   )
   REFERENCES
       Shared.DimCurrency(DimCurrencyID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCostTypeID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCapturedCosts',
@level2type=N'COLUMN',
@level2name=N'DimCostTypeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCapturedCosts',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOperatorID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCapturedCosts',
@level2type=N'COLUMN',
@level2name=N'DimOperatorID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCurrencyID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCapturedCosts',
@level2type=N'COLUMN',
@level2name=N'DimCurrencyID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'FinancialAmount',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCapturedCosts',
@level2type=N'COLUMN',
@level2name=N'FinancialAmount';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Tax',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCapturedCosts',
@level2type=N'COLUMN',
@level2name=N'Tax';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Costs';
IF SCHEMA_ID('Costs')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactCarbonCredits */
IF OBJECT_ID('Costs.FactCarbonCredits') IS NOT NULL
DROP TABLE FactCarbonCredits;
GO


/* Create table Costs.FactCarbonCredits */
CREATE TABLE Costs.FactCarbonCredits
(
   FactCarbonCreditsID INT NOT NULL,
   DimDateID INT,
   DimCostTypeID INT,
   DimEquipmentID INT,
   DimLocationID INT,
   DimOrganisationLevel5ID INT,
   DimCurrencyID INT,
   Credits DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Costs.FactCarbonCredits
ADD CONSTRAINT pk_FactCarbonCreditsID
PRIMARY KEY CLUSTERED
(
   FactCarbonCreditsID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Costs.FactCarbonCredits
   ADD CONSTRAINT fk_FactCarbonCredits_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimCostType') IS NOT NULL
   ALTER TABLE Costs.FactCarbonCredits
   ADD CONSTRAINT fk_FactCarbonCredits_DimCostTypeID
   FOREIGN KEY
   (
       DimCostTypeID
   )
   REFERENCES
       Shared.DimCostType(DimCostTypeID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Costs.FactCarbonCredits
   ADD CONSTRAINT fk_FactCarbonCredits_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimLocation') IS NOT NULL
   ALTER TABLE Costs.FactCarbonCredits
   ADD CONSTRAINT fk_FactCarbonCredits_DimLocationID
   FOREIGN KEY
   (
       DimLocationID
   )
   REFERENCES
       Shared.DimLocation(DimLocationID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Costs.FactCarbonCredits
   ADD CONSTRAINT fk_FactCarbonCredits_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


IF OBJECT_ID('Shared.DimCurrency') IS NOT NULL
   ALTER TABLE Costs.FactCarbonCredits
   ADD CONSTRAINT fk_FactCarbonCredits_DimCurrencyID
   FOREIGN KEY
   (
       DimCurrencyID
   )
   REFERENCES
       Shared.DimCurrency(DimCurrencyID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCarbonCredits',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCostTypeID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCarbonCredits',
@level2type=N'COLUMN',
@level2name=N'DimCostTypeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCarbonCredits',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimLocationID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCarbonCredits',
@level2type=N'COLUMN',
@level2name=N'DimLocationID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCarbonCredits',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCurrencyID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCarbonCredits',
@level2type=N'COLUMN',
@level2name=N'DimCurrencyID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Credits',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCarbonCredits',
@level2type=N'COLUMN',
@level2name=N'Credits';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Costs';
IF SCHEMA_ID('Costs')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactCarbonTax */
IF OBJECT_ID('Costs.FactCarbonTax') IS NOT NULL
DROP TABLE FactCarbonTax;
GO


/* Create table Costs.FactCarbonTax */
CREATE TABLE Costs.FactCarbonTax
(
   FactCarbonTaxID INT NOT NULL,
   DimDateID INT,
   DimCostTypeID INT,
   DimEquipmentID INT,
   DimLocationID INT,
   DimOrganisationLevel5ID INT,
   DimCurrencyID INT,
   FinancialAmount DECIMAL(18,2),
   Tax DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Costs.FactCarbonTax
ADD CONSTRAINT pk_FactCarbonTaxID
PRIMARY KEY CLUSTERED
(
   FactCarbonTaxID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Costs.FactCarbonTax
   ADD CONSTRAINT fk_FactCarbonTax_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimCostType') IS NOT NULL
   ALTER TABLE Costs.FactCarbonTax
   ADD CONSTRAINT fk_FactCarbonTax_DimCostTypeID
   FOREIGN KEY
   (
       DimCostTypeID
   )
   REFERENCES
       Shared.DimCostType(DimCostTypeID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Costs.FactCarbonTax
   ADD CONSTRAINT fk_FactCarbonTax_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimLocation') IS NOT NULL
   ALTER TABLE Costs.FactCarbonTax
   ADD CONSTRAINT fk_FactCarbonTax_DimLocationID
   FOREIGN KEY
   (
       DimLocationID
   )
   REFERENCES
       Shared.DimLocation(DimLocationID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Costs.FactCarbonTax
   ADD CONSTRAINT fk_FactCarbonTax_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


IF OBJECT_ID('Shared.DimCurrency') IS NOT NULL
   ALTER TABLE Costs.FactCarbonTax
   ADD CONSTRAINT fk_FactCarbonTax_DimCurrencyID
   FOREIGN KEY
   (
       DimCurrencyID
   )
   REFERENCES
       Shared.DimCurrency(DimCurrencyID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCarbonTax',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCostTypeID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCarbonTax',
@level2type=N'COLUMN',
@level2name=N'DimCostTypeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCarbonTax',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimLocationID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCarbonTax',
@level2type=N'COLUMN',
@level2name=N'DimLocationID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCarbonTax',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCurrencyID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCarbonTax',
@level2type=N'COLUMN',
@level2name=N'DimCurrencyID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'FinancialAmount',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCarbonTax',
@level2type=N'COLUMN',
@level2name=N'FinancialAmount';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Tax',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCarbonTax',
@level2type=N'COLUMN',
@level2name=N'Tax';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Costs';
IF SCHEMA_ID('Costs')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactCostsPerUnit */
IF OBJECT_ID('Costs.FactCostsPerUnit') IS NOT NULL
DROP TABLE FactCostsPerUnit;
GO


/* Create table Costs.FactCostsPerUnit */
CREATE TABLE Costs.FactCostsPerUnit
(
   FactCostsPerUnitID INT NOT NULL,
   DimDateID INT,
   DimTimeID INT,
   DimCostTypeID INT,
   DimEquipmentID INT,
   DimCurrencyID INT,
   FinancialAmount DECIMAL(18,2),
   Tax DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Costs.FactCostsPerUnit
ADD CONSTRAINT pk_FactCostsPerUnitID
PRIMARY KEY CLUSTERED
(
   FactCostsPerUnitID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Costs.FactCostsPerUnit
   ADD CONSTRAINT fk_FactCostsPerUnit_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimTime') IS NOT NULL
   ALTER TABLE Costs.FactCostsPerUnit
   ADD CONSTRAINT fk_FactCostsPerUnit_DimTimeID
   FOREIGN KEY
   (
       DimTimeID
   )
   REFERENCES
       Shared.DimTime(DimTimeID);
GO


IF OBJECT_ID('Shared.DimCostType') IS NOT NULL
   ALTER TABLE Costs.FactCostsPerUnit
   ADD CONSTRAINT fk_FactCostsPerUnit_DimCostTypeID
   FOREIGN KEY
   (
       DimCostTypeID
   )
   REFERENCES
       Shared.DimCostType(DimCostTypeID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Costs.FactCostsPerUnit
   ADD CONSTRAINT fk_FactCostsPerUnit_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimCurrency') IS NOT NULL
   ALTER TABLE Costs.FactCostsPerUnit
   ADD CONSTRAINT fk_FactCostsPerUnit_DimCurrencyID
   FOREIGN KEY
   (
       DimCurrencyID
   )
   REFERENCES
       Shared.DimCurrency(DimCurrencyID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCostsPerUnit',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimTimeID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCostsPerUnit',
@level2type=N'COLUMN',
@level2name=N'DimTimeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCostTypeID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCostsPerUnit',
@level2type=N'COLUMN',
@level2name=N'DimCostTypeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCostsPerUnit',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCurrencyID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCostsPerUnit',
@level2type=N'COLUMN',
@level2name=N'DimCurrencyID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'FinancialAmount',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCostsPerUnit',
@level2type=N'COLUMN',
@level2name=N'FinancialAmount';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Tax',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCostsPerUnit',
@level2type=N'COLUMN',
@level2name=N'Tax';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Costs';
IF SCHEMA_ID('Costs')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactDepreciationCosts */
IF OBJECT_ID('Costs.FactDepreciationCosts') IS NOT NULL
DROP TABLE FactDepreciationCosts;
GO


/* Create table Costs.FactDepreciationCosts */
CREATE TABLE Costs.FactDepreciationCosts
(
   FactDepreciationCostsID INT NOT NULL,
   DimDateID INT,
   DimTimeID INT,
   DimCostTypeID INT,
   DimEquipmentID INT,
   DimLocationID INT,
   DimOperatorID INT,
   DimOrganisationLevel5ID INT,
   DimCurrencyID INT,
   FinancialAmount DECIMAL(18,2),
   Tax DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Costs.FactDepreciationCosts
ADD CONSTRAINT pk_FactDepreciationCostsID
PRIMARY KEY CLUSTERED
(
   FactDepreciationCostsID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Costs.FactDepreciationCosts
   ADD CONSTRAINT fk_FactDepreciationCosts_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimTime') IS NOT NULL
   ALTER TABLE Costs.FactDepreciationCosts
   ADD CONSTRAINT fk_FactDepreciationCosts_DimTimeID
   FOREIGN KEY
   (
       DimTimeID
   )
   REFERENCES
       Shared.DimTime(DimTimeID);
GO


IF OBJECT_ID('Shared.DimCostType') IS NOT NULL
   ALTER TABLE Costs.FactDepreciationCosts
   ADD CONSTRAINT fk_FactDepreciationCosts_DimCostTypeID
   FOREIGN KEY
   (
       DimCostTypeID
   )
   REFERENCES
       Shared.DimCostType(DimCostTypeID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Costs.FactDepreciationCosts
   ADD CONSTRAINT fk_FactDepreciationCosts_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimLocation') IS NOT NULL
   ALTER TABLE Costs.FactDepreciationCosts
   ADD CONSTRAINT fk_FactDepreciationCosts_DimLocationID
   FOREIGN KEY
   (
       DimLocationID
   )
   REFERENCES
       Shared.DimLocation(DimLocationID);
GO


IF OBJECT_ID('Shared.DimOperator') IS NOT NULL
   ALTER TABLE Costs.FactDepreciationCosts
   ADD CONSTRAINT fk_FactDepreciationCosts_DimOperatorID
   FOREIGN KEY
   (
       DimOperatorID
   )
   REFERENCES
       Shared.DimOperator(DimOperatorID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Costs.FactDepreciationCosts
   ADD CONSTRAINT fk_FactDepreciationCosts_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


IF OBJECT_ID('Shared.DimCurrency') IS NOT NULL
   ALTER TABLE Costs.FactDepreciationCosts
   ADD CONSTRAINT fk_FactDepreciationCosts_DimCurrencyID
   FOREIGN KEY
   (
       DimCurrencyID
   )
   REFERENCES
       Shared.DimCurrency(DimCurrencyID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactDepreciationCosts',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimTimeID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactDepreciationCosts',
@level2type=N'COLUMN',
@level2name=N'DimTimeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCostTypeID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactDepreciationCosts',
@level2type=N'COLUMN',
@level2name=N'DimCostTypeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactDepreciationCosts',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimLocationID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactDepreciationCosts',
@level2type=N'COLUMN',
@level2name=N'DimLocationID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOperatorID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactDepreciationCosts',
@level2type=N'COLUMN',
@level2name=N'DimOperatorID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactDepreciationCosts',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCurrencyID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactDepreciationCosts',
@level2type=N'COLUMN',
@level2name=N'DimCurrencyID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'FinancialAmount',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactDepreciationCosts',
@level2type=N'COLUMN',
@level2name=N'FinancialAmount';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Tax',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactDepreciationCosts',
@level2type=N'COLUMN',
@level2name=N'Tax';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Availability';
IF SCHEMA_ID('Availability')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactEquipmentAvailability */
IF OBJECT_ID('Availability.FactEquipmentAvailability') IS NOT NULL
DROP TABLE FactEquipmentAvailability;
GO


/* Create table Availability.FactEquipmentAvailability */
CREATE TABLE Availability.FactEquipmentAvailability
(
   FactEquipmentAvailabilityID INT NOT NULL,
   DimDateID INT,
   DimTimeID INT,
   DimAvailabilityLevel5ID INT,
   DimEquipmentID INT,
   DimOperatorID INT,
   DimLocationID INT,
   DimPayloadID INT,
   DimPointOfInterestID INT,
   DimOrganisationLevel5ID INT,
   Seconds DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Availability.FactEquipmentAvailability
ADD CONSTRAINT pk_FactEquipmentAvailabilityID
PRIMARY KEY CLUSTERED
(
   FactEquipmentAvailabilityID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Availability.FactEquipmentAvailability
   ADD CONSTRAINT fk_FactEquipmentAvailability_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimTime') IS NOT NULL
   ALTER TABLE Availability.FactEquipmentAvailability
   ADD CONSTRAINT fk_FactEquipmentAvailability_DimTimeID
   FOREIGN KEY
   (
       DimTimeID
   )
   REFERENCES
       Shared.DimTime(DimTimeID);
GO


IF OBJECT_ID('Shared.DimAvailabilityLevel5') IS NOT NULL
   ALTER TABLE Availability.FactEquipmentAvailability
   ADD CONSTRAINT fk_FactEquipmentAvailability_DimAvailabilityLevel5ID
   FOREIGN KEY
   (
       DimAvailabilityLevel5ID
   )
   REFERENCES
       Shared.DimAvailabilityLevel5(DimAvailabilityLevel5ID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Availability.FactEquipmentAvailability
   ADD CONSTRAINT fk_FactEquipmentAvailability_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimOperator') IS NOT NULL
   ALTER TABLE Availability.FactEquipmentAvailability
   ADD CONSTRAINT fk_FactEquipmentAvailability_DimOperatorID
   FOREIGN KEY
   (
       DimOperatorID
   )
   REFERENCES
       Shared.DimOperator(DimOperatorID);
GO


IF OBJECT_ID('Shared.DimLocation') IS NOT NULL
   ALTER TABLE Availability.FactEquipmentAvailability
   ADD CONSTRAINT fk_FactEquipmentAvailability_DimLocationID
   FOREIGN KEY
   (
       DimLocationID
   )
   REFERENCES
       Shared.DimLocation(DimLocationID);
GO


IF OBJECT_ID('Shared.DimPayload') IS NOT NULL
   ALTER TABLE Availability.FactEquipmentAvailability
   ADD CONSTRAINT fk_FactEquipmentAvailability_DimPayloadID
   FOREIGN KEY
   (
       DimPayloadID
   )
   REFERENCES
       Shared.DimPayload(DimPayloadID);
GO


IF OBJECT_ID('Shared.DimPointOfInterest') IS NOT NULL
   ALTER TABLE Availability.FactEquipmentAvailability
   ADD CONSTRAINT fk_FactEquipmentAvailability_DimPointOfInterestID
   FOREIGN KEY
   (
       DimPointOfInterestID
   )
   REFERENCES
       Shared.DimPointOfInterest(DimPointOfInterestID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Availability.FactEquipmentAvailability
   ADD CONSTRAINT fk_FactEquipmentAvailability_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailability',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimTimeID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailability',
@level2type=N'COLUMN',
@level2name=N'DimTimeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimAvailabilityLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailability',
@level2type=N'COLUMN',
@level2name=N'DimAvailabilityLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailability',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOperatorID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailability',
@level2type=N'COLUMN',
@level2name=N'DimOperatorID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimLocationID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailability',
@level2type=N'COLUMN',
@level2name=N'DimLocationID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPayloadID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailability',
@level2type=N'COLUMN',
@level2name=N'DimPayloadID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPointOfInterestID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailability',
@level2type=N'COLUMN',
@level2name=N'DimPointOfInterestID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailability',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Seconds',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailability',
@level2type=N'COLUMN',
@level2name=N'Seconds';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Availability';
IF SCHEMA_ID('Availability')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactEquipmentAvailabilityTargets */
IF OBJECT_ID('Availability.FactEquipmentAvailabilityTargets') IS NOT NULL
DROP TABLE FactEquipmentAvailabilityTargets;
GO


/* Create table Availability.FactEquipmentAvailabilityTargets */
CREATE TABLE Availability.FactEquipmentAvailabilityTargets
(
   FactEquipmentAvailabilityTargetsID INT NOT NULL,
   DimAvailabilityLevel5ID INT,
   DimEquipmentID INT,
   DimOperatorID INT,
   DimPayloadID INT,
   DimPointOfInterestID INT,
   DimOrganisationLevel5ID INT,
   [Percent] DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Availability.FactEquipmentAvailabilityTargets
ADD CONSTRAINT pk_FactEquipmentAvailabilityTargetsID
PRIMARY KEY CLUSTERED
(
   FactEquipmentAvailabilityTargetsID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimAvailabilityLevel5') IS NOT NULL
   ALTER TABLE Availability.FactEquipmentAvailabilityTargets
   ADD CONSTRAINT fk_FactEquipmentAvailabilityTargets_DimAvailabilityLevel5ID
   FOREIGN KEY
   (
       DimAvailabilityLevel5ID
   )
   REFERENCES
       Shared.DimAvailabilityLevel5(DimAvailabilityLevel5ID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Availability.FactEquipmentAvailabilityTargets
   ADD CONSTRAINT fk_FactEquipmentAvailabilityTargets_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimOperator') IS NOT NULL
   ALTER TABLE Availability.FactEquipmentAvailabilityTargets
   ADD CONSTRAINT fk_FactEquipmentAvailabilityTargets_DimOperatorID
   FOREIGN KEY
   (
       DimOperatorID
   )
   REFERENCES
       Shared.DimOperator(DimOperatorID);
GO


IF OBJECT_ID('Shared.DimPayload') IS NOT NULL
   ALTER TABLE Availability.FactEquipmentAvailabilityTargets
   ADD CONSTRAINT fk_FactEquipmentAvailabilityTargets_DimPayloadID
   FOREIGN KEY
   (
       DimPayloadID
   )
   REFERENCES
       Shared.DimPayload(DimPayloadID);
GO


IF OBJECT_ID('Shared.DimPointOfInterest') IS NOT NULL
   ALTER TABLE Availability.FactEquipmentAvailabilityTargets
   ADD CONSTRAINT fk_FactEquipmentAvailabilityTargets_DimPointOfInterestID
   FOREIGN KEY
   (
       DimPointOfInterestID
   )
   REFERENCES
       Shared.DimPointOfInterest(DimPointOfInterestID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Availability.FactEquipmentAvailabilityTargets
   ADD CONSTRAINT fk_FactEquipmentAvailabilityTargets_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimAvailabilityLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailabilityTargets',
@level2type=N'COLUMN',
@level2name=N'DimAvailabilityLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailabilityTargets',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOperatorID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailabilityTargets',
@level2type=N'COLUMN',
@level2name=N'DimOperatorID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPayloadID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailabilityTargets',
@level2type=N'COLUMN',
@level2name=N'DimPayloadID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPointOfInterestID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailabilityTargets',
@level2type=N'COLUMN',
@level2name=N'DimPointOfInterestID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailabilityTargets',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'[Percent]',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailabilityTargets',
@level2type=N'COLUMN',
@level2name=N'Percent';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Activity';
IF SCHEMA_ID('Activity')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactEquipmentEvents */
IF OBJECT_ID('Activity.FactEquipmentEvents') IS NOT NULL
DROP TABLE FactEquipmentEvents;
GO


/* Create table Activity.FactEquipmentEvents */
CREATE TABLE Activity.FactEquipmentEvents
(
   FactEquipmentEventsID INT NOT NULL,
   DimDateID INT,
   DimEquipmentID INT,
   DimEventTypeID INT,
   DimStartDateID INT,
   DimStartTimeID INT,
   DimEndDateID INT,
   DimEndTimeID INT,
   DimLocationID INT,
   DimPointOfInterestID INT,
   DimTripCategoryID INT,
   DimSiteID INT,
   DimOrganisationLevel5ID INT,
   RunID INT NOT NULL
);
GO


ALTER TABLE Activity.FactEquipmentEvents
ADD CONSTRAINT pk_FactEquipmentEventsID
PRIMARY KEY CLUSTERED
(
   FactEquipmentEventsID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Activity.FactEquipmentEvents
   ADD CONSTRAINT fk_FactEquipmentEvents_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Activity.FactEquipmentEvents
   ADD CONSTRAINT fk_FactEquipmentEvents_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimEventType') IS NOT NULL
   ALTER TABLE Activity.FactEquipmentEvents
   ADD CONSTRAINT fk_FactEquipmentEvents_DimEventTypeID
   FOREIGN KEY
   (
       DimEventTypeID
   )
   REFERENCES
       Shared.DimEventType(DimEventTypeID);
GO


IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Activity.FactEquipmentEvents
   ADD CONSTRAINT fk_FactEquipmentEvents_DimStartDateID
   FOREIGN KEY
   (
       DimStartDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimTime') IS NOT NULL
   ALTER TABLE Activity.FactEquipmentEvents
   ADD CONSTRAINT fk_FactEquipmentEvents_DimStartTimeID
   FOREIGN KEY
   (
       DimStartTimeID
   )
   REFERENCES
       Shared.DimTime(DimTimeID);
GO


IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Activity.FactEquipmentEvents
   ADD CONSTRAINT fk_FactEquipmentEvents_DimEndDateID
   FOREIGN KEY
   (
       DimEndDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimTime') IS NOT NULL
   ALTER TABLE Activity.FactEquipmentEvents
   ADD CONSTRAINT fk_FactEquipmentEvents_DimEndTimeID
   FOREIGN KEY
   (
       DimEndTimeID
   )
   REFERENCES
       Shared.DimTime(DimTimeID);
GO


IF OBJECT_ID('Shared.DimLocation') IS NOT NULL
   ALTER TABLE Activity.FactEquipmentEvents
   ADD CONSTRAINT fk_FactEquipmentEvents_DimLocationID
   FOREIGN KEY
   (
       DimLocationID
   )
   REFERENCES
       Shared.DimLocation(DimLocationID);
GO


IF OBJECT_ID('Shared.DimPointOfInterest') IS NOT NULL
   ALTER TABLE Activity.FactEquipmentEvents
   ADD CONSTRAINT fk_FactEquipmentEvents_DimPointOfInterestID
   FOREIGN KEY
   (
       DimPointOfInterestID
   )
   REFERENCES
       Shared.DimPointOfInterest(DimPointOfInterestID);
GO


IF OBJECT_ID('Shared.DimTripCategory') IS NOT NULL
   ALTER TABLE Activity.FactEquipmentEvents
   ADD CONSTRAINT fk_FactEquipmentEvents_DimTripCategoryID
   FOREIGN KEY
   (
       DimTripCategoryID
   )
   REFERENCES
       Shared.DimTripCategory(DimTripCategoryID);
GO


IF OBJECT_ID('Shared.DimSite') IS NOT NULL
   ALTER TABLE Activity.FactEquipmentEvents
   ADD CONSTRAINT fk_FactEquipmentEvents_DimSiteID
   FOREIGN KEY
   (
       DimSiteID
   )
   REFERENCES
       Shared.DimSite(DimSiteID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Activity.FactEquipmentEvents
   ADD CONSTRAINT fk_FactEquipmentEvents_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactEquipmentEvents',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactEquipmentEvents',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEventTypeID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactEquipmentEvents',
@level2type=N'COLUMN',
@level2name=N'DimEventTypeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimStartDateID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactEquipmentEvents',
@level2type=N'COLUMN',
@level2name=N'DimStartDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimStartTimeID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactEquipmentEvents',
@level2type=N'COLUMN',
@level2name=N'DimStartTimeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEndDateID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactEquipmentEvents',
@level2type=N'COLUMN',
@level2name=N'DimEndDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEndTimeID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactEquipmentEvents',
@level2type=N'COLUMN',
@level2name=N'DimEndTimeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimLocationID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactEquipmentEvents',
@level2type=N'COLUMN',
@level2name=N'DimLocationID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPointOfInterestID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactEquipmentEvents',
@level2type=N'COLUMN',
@level2name=N'DimPointOfInterestID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimTripCategoryID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactEquipmentEvents',
@level2type=N'COLUMN',
@level2name=N'DimTripCategoryID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimSiteID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactEquipmentEvents',
@level2type=N'COLUMN',
@level2name=N'DimSiteID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactEquipmentEvents',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Exceptions';
IF SCHEMA_ID('Exceptions')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactEquipmentExclusion */
IF OBJECT_ID('Exceptions.FactEquipmentExclusion') IS NOT NULL
DROP TABLE FactEquipmentExclusion;
GO


/* Create table Exceptions.FactEquipmentExclusion */
CREATE TABLE Exceptions.FactEquipmentExclusion
(
   FactEquipmentExclusionID INT NOT NULL,
   DimDateID INT,
   DimExclusionLevel3ID INT,
   DimEquipmentID INT,
   RunID INT NOT NULL
);
GO


ALTER TABLE Exceptions.FactEquipmentExclusion
ADD CONSTRAINT pk_FactEquipmentExclusionID
PRIMARY KEY CLUSTERED
(
   FactEquipmentExclusionID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Exceptions.FactEquipmentExclusion
   ADD CONSTRAINT fk_FactEquipmentExclusion_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimExclusionLevel3') IS NOT NULL
   ALTER TABLE Exceptions.FactEquipmentExclusion
   ADD CONSTRAINT fk_FactEquipmentExclusion_DimExclusionLevel3ID
   FOREIGN KEY
   (
       DimExclusionLevel3ID
   )
   REFERENCES
       Shared.DimExclusionLevel3(DimExclusionLevel3ID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Exceptions.FactEquipmentExclusion
   ADD CONSTRAINT fk_FactEquipmentExclusion_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactEquipmentExclusion',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimExclusionLevel3ID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactEquipmentExclusion',
@level2type=N'COLUMN',
@level2name=N'DimExclusionLevel3ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactEquipmentExclusion',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Costs';
IF SCHEMA_ID('Costs')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactGeneralLedger */
IF OBJECT_ID('Costs.FactGeneralLedger') IS NOT NULL
DROP TABLE FactGeneralLedger;
GO


/* Create table Costs.FactGeneralLedger */
CREATE TABLE Costs.FactGeneralLedger
(
   FactGeneralLedgerID INT NOT NULL,
   DimDateID INT,
   DimCostTypeID INT,
   DimOrganisationLevel5ID INT,
   DimChartOfAccountsLevel3ID INT,
   DimCurrencyID INT,
   RunID INT NOT NULL
);
GO


ALTER TABLE Costs.FactGeneralLedger
ADD CONSTRAINT pk_FactGeneralLedgerID
PRIMARY KEY CLUSTERED
(
   FactGeneralLedgerID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Costs.FactGeneralLedger
   ADD CONSTRAINT fk_FactGeneralLedger_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimCostType') IS NOT NULL
   ALTER TABLE Costs.FactGeneralLedger
   ADD CONSTRAINT fk_FactGeneralLedger_DimCostTypeID
   FOREIGN KEY
   (
       DimCostTypeID
   )
   REFERENCES
       Shared.DimCostType(DimCostTypeID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Costs.FactGeneralLedger
   ADD CONSTRAINT fk_FactGeneralLedger_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


IF OBJECT_ID('Shared.DimChartOfAccountsLevel3') IS NOT NULL
   ALTER TABLE Costs.FactGeneralLedger
   ADD CONSTRAINT fk_FactGeneralLedger_DimChartOfAccountsLevel3ID
   FOREIGN KEY
   (
       DimChartOfAccountsLevel3ID
   )
   REFERENCES
       Shared.DimChartOfAccountsLevel3(DimChartOfAccountsLevel3ID);
GO


IF OBJECT_ID('Shared.DimCurrency') IS NOT NULL
   ALTER TABLE Costs.FactGeneralLedger
   ADD CONSTRAINT fk_FactGeneralLedger_DimCurrencyID
   FOREIGN KEY
   (
       DimCurrencyID
   )
   REFERENCES
       Shared.DimCurrency(DimCurrencyID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactGeneralLedger',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCostTypeID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactGeneralLedger',
@level2type=N'COLUMN',
@level2name=N'DimCostTypeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactGeneralLedger',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimChartOfAccountsLevel3ID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactGeneralLedger',
@level2type=N'COLUMN',
@level2name=N'DimChartOfAccountsLevel3ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCurrencyID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactGeneralLedger',
@level2type=N'COLUMN',
@level2name=N'DimCurrencyID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Costs';
IF SCHEMA_ID('Costs')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactInferredCosts */
IF OBJECT_ID('Costs.FactInferredCosts') IS NOT NULL
DROP TABLE FactInferredCosts;
GO


/* Create table Costs.FactInferredCosts */
CREATE TABLE Costs.FactInferredCosts
(
   FactInferredCostsID INT NOT NULL,
   DimCostTypeID INT,
   DimEquipmentID INT,
   DimLocationID INT,
   DimOperatorID INT,
   DimOrganisationLevel5ID INT,
   DimCurrencyID INT,
   FinancialAmount DECIMAL(18,2),
   Tax DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Costs.FactInferredCosts
ADD CONSTRAINT pk_FactInferredCostsID
PRIMARY KEY CLUSTERED
(
   FactInferredCostsID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimCostType') IS NOT NULL
   ALTER TABLE Costs.FactInferredCosts
   ADD CONSTRAINT fk_FactInferredCosts_DimCostTypeID
   FOREIGN KEY
   (
       DimCostTypeID
   )
   REFERENCES
       Shared.DimCostType(DimCostTypeID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Costs.FactInferredCosts
   ADD CONSTRAINT fk_FactInferredCosts_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimLocation') IS NOT NULL
   ALTER TABLE Costs.FactInferredCosts
   ADD CONSTRAINT fk_FactInferredCosts_DimLocationID
   FOREIGN KEY
   (
       DimLocationID
   )
   REFERENCES
       Shared.DimLocation(DimLocationID);
GO


IF OBJECT_ID('Shared.DimOperator') IS NOT NULL
   ALTER TABLE Costs.FactInferredCosts
   ADD CONSTRAINT fk_FactInferredCosts_DimOperatorID
   FOREIGN KEY
   (
       DimOperatorID
   )
   REFERENCES
       Shared.DimOperator(DimOperatorID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Costs.FactInferredCosts
   ADD CONSTRAINT fk_FactInferredCosts_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


IF OBJECT_ID('Shared.DimCurrency') IS NOT NULL
   ALTER TABLE Costs.FactInferredCosts
   ADD CONSTRAINT fk_FactInferredCosts_DimCurrencyID
   FOREIGN KEY
   (
       DimCurrencyID
   )
   REFERENCES
       Shared.DimCurrency(DimCurrencyID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCostTypeID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactInferredCosts',
@level2type=N'COLUMN',
@level2name=N'DimCostTypeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactInferredCosts',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimLocationID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactInferredCosts',
@level2type=N'COLUMN',
@level2name=N'DimLocationID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOperatorID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactInferredCosts',
@level2type=N'COLUMN',
@level2name=N'DimOperatorID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactInferredCosts',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCurrencyID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactInferredCosts',
@level2type=N'COLUMN',
@level2name=N'DimCurrencyID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'FinancialAmount',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactInferredCosts',
@level2type=N'COLUMN',
@level2name=N'FinancialAmount';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Tax',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactInferredCosts',
@level2type=N'COLUMN',
@level2name=N'Tax';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Availability';
IF SCHEMA_ID('Availability')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactOperatorAvailability */
IF OBJECT_ID('Availability.FactOperatorAvailability') IS NOT NULL
DROP TABLE FactOperatorAvailability;
GO


/* Create table Availability.FactOperatorAvailability */
CREATE TABLE Availability.FactOperatorAvailability
(
   FactOperatorAvailabilityID INT NOT NULL,
   DimDateID INT,
   DimTimeID INT,
   DimAvailabilityLevel5ID INT,
   DimOperatorID INT,
   DimLocationID INT,
   DimPayloadID INT,
   DimPointOfInterestID INT,
   DimOrganisationLevel5ID INT,
   Seconds DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Availability.FactOperatorAvailability
ADD CONSTRAINT pk_FactOperatorAvailabilityID
PRIMARY KEY CLUSTERED
(
   FactOperatorAvailabilityID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Availability.FactOperatorAvailability
   ADD CONSTRAINT fk_FactOperatorAvailability_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimTime') IS NOT NULL
   ALTER TABLE Availability.FactOperatorAvailability
   ADD CONSTRAINT fk_FactOperatorAvailability_DimTimeID
   FOREIGN KEY
   (
       DimTimeID
   )
   REFERENCES
       Shared.DimTime(DimTimeID);
GO


IF OBJECT_ID('Shared.DimAvailabilityLevel5') IS NOT NULL
   ALTER TABLE Availability.FactOperatorAvailability
   ADD CONSTRAINT fk_FactOperatorAvailability_DimAvailabilityLevel5ID
   FOREIGN KEY
   (
       DimAvailabilityLevel5ID
   )
   REFERENCES
       Shared.DimAvailabilityLevel5(DimAvailabilityLevel5ID);
GO


IF OBJECT_ID('Shared.DimOperator') IS NOT NULL
   ALTER TABLE Availability.FactOperatorAvailability
   ADD CONSTRAINT fk_FactOperatorAvailability_DimOperatorID
   FOREIGN KEY
   (
       DimOperatorID
   )
   REFERENCES
       Shared.DimOperator(DimOperatorID);
GO


IF OBJECT_ID('Shared.DimLocation') IS NOT NULL
   ALTER TABLE Availability.FactOperatorAvailability
   ADD CONSTRAINT fk_FactOperatorAvailability_DimLocationID
   FOREIGN KEY
   (
       DimLocationID
   )
   REFERENCES
       Shared.DimLocation(DimLocationID);
GO


IF OBJECT_ID('Shared.DimPayload') IS NOT NULL
   ALTER TABLE Availability.FactOperatorAvailability
   ADD CONSTRAINT fk_FactOperatorAvailability_DimPayloadID
   FOREIGN KEY
   (
       DimPayloadID
   )
   REFERENCES
       Shared.DimPayload(DimPayloadID);
GO


IF OBJECT_ID('Shared.DimPointOfInterest') IS NOT NULL
   ALTER TABLE Availability.FactOperatorAvailability
   ADD CONSTRAINT fk_FactOperatorAvailability_DimPointOfInterestID
   FOREIGN KEY
   (
       DimPointOfInterestID
   )
   REFERENCES
       Shared.DimPointOfInterest(DimPointOfInterestID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Availability.FactOperatorAvailability
   ADD CONSTRAINT fk_FactOperatorAvailability_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailability',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimTimeID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailability',
@level2type=N'COLUMN',
@level2name=N'DimTimeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimAvailabilityLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailability',
@level2type=N'COLUMN',
@level2name=N'DimAvailabilityLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOperatorID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailability',
@level2type=N'COLUMN',
@level2name=N'DimOperatorID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimLocationID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailability',
@level2type=N'COLUMN',
@level2name=N'DimLocationID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPayloadID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailability',
@level2type=N'COLUMN',
@level2name=N'DimPayloadID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPointOfInterestID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailability',
@level2type=N'COLUMN',
@level2name=N'DimPointOfInterestID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailability',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Seconds',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailability',
@level2type=N'COLUMN',
@level2name=N'Seconds';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Availability';
IF SCHEMA_ID('Availability')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactOperatorAvailabilityTargets */
IF OBJECT_ID('Availability.FactOperatorAvailabilityTargets') IS NOT NULL
DROP TABLE FactOperatorAvailabilityTargets;
GO


/* Create table Availability.FactOperatorAvailabilityTargets */
CREATE TABLE Availability.FactOperatorAvailabilityTargets
(
   FactOperatorAvailabilityTargetsID INT NOT NULL,
   DimAvailabilityLevel5ID INT,
   DimOperatorID INT,
   DimPayloadID INT,
   DimPointOfInterestID INT,
   DimOrganisationLevel5ID INT,
   [Percent] DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Availability.FactOperatorAvailabilityTargets
ADD CONSTRAINT pk_FactOperatorAvailabilityTargetsID
PRIMARY KEY CLUSTERED
(
   FactOperatorAvailabilityTargetsID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimAvailabilityLevel5') IS NOT NULL
   ALTER TABLE Availability.FactOperatorAvailabilityTargets
   ADD CONSTRAINT fk_FactOperatorAvailabilityTargets_DimAvailabilityLevel5ID
   FOREIGN KEY
   (
       DimAvailabilityLevel5ID
   )
   REFERENCES
       Shared.DimAvailabilityLevel5(DimAvailabilityLevel5ID);
GO


IF OBJECT_ID('Shared.DimOperator') IS NOT NULL
   ALTER TABLE Availability.FactOperatorAvailabilityTargets
   ADD CONSTRAINT fk_FactOperatorAvailabilityTargets_DimOperatorID
   FOREIGN KEY
   (
       DimOperatorID
   )
   REFERENCES
       Shared.DimOperator(DimOperatorID);
GO


IF OBJECT_ID('Shared.DimPayload') IS NOT NULL
   ALTER TABLE Availability.FactOperatorAvailabilityTargets
   ADD CONSTRAINT fk_FactOperatorAvailabilityTargets_DimPayloadID
   FOREIGN KEY
   (
       DimPayloadID
   )
   REFERENCES
       Shared.DimPayload(DimPayloadID);
GO


IF OBJECT_ID('Shared.DimPointOfInterest') IS NOT NULL
   ALTER TABLE Availability.FactOperatorAvailabilityTargets
   ADD CONSTRAINT fk_FactOperatorAvailabilityTargets_DimPointOfInterestID
   FOREIGN KEY
   (
       DimPointOfInterestID
   )
   REFERENCES
       Shared.DimPointOfInterest(DimPointOfInterestID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Availability.FactOperatorAvailabilityTargets
   ADD CONSTRAINT fk_FactOperatorAvailabilityTargets_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimAvailabilityLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailabilityTargets',
@level2type=N'COLUMN',
@level2name=N'DimAvailabilityLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOperatorID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailabilityTargets',
@level2type=N'COLUMN',
@level2name=N'DimOperatorID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPayloadID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailabilityTargets',
@level2type=N'COLUMN',
@level2name=N'DimPayloadID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPointOfInterestID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailabilityTargets',
@level2type=N'COLUMN',
@level2name=N'DimPointOfInterestID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailabilityTargets',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'[Percent]',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailabilityTargets',
@level2type=N'COLUMN',
@level2name=N'Percent';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Activity';
IF SCHEMA_ID('Activity')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactOperatorEvents */
IF OBJECT_ID('Activity.FactOperatorEvents') IS NOT NULL
DROP TABLE FactOperatorEvents;
GO


/* Create table Activity.FactOperatorEvents */
CREATE TABLE Activity.FactOperatorEvents
(
   FactOperatorEventsID INT NOT NULL,
   DimDateID INT,
   DimTimeID INT,
   DimEventTypeID INT,
   DimStartDateID INT,
   DimStartTimeID INT,
   DimEndDateID INT,
   DimEndTimeID INT,
   DimLocationID INT,
   DimPointOfInterestID INT,
   DimTripCategoryID INT,
   DimSiteID INT,
   DimOrganisationLevel5ID INT,
   MaximumBrakingForce DECIMAL(18,2),
   AverageBrakingForce DECIMAL(18,2),
   OutOfBandBrakingForce DECIMAL(18,2),
   MaximumRPM DECIMAL(18,2),
   AverageRPM DECIMAL(18,2),
   OutOfBandRPM DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Activity.FactOperatorEvents
ADD CONSTRAINT pk_FactOperatorEventsID
PRIMARY KEY CLUSTERED
(
   FactOperatorEventsID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Activity.FactOperatorEvents
   ADD CONSTRAINT fk_FactOperatorEvents_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimTime') IS NOT NULL
   ALTER TABLE Activity.FactOperatorEvents
   ADD CONSTRAINT fk_FactOperatorEvents_DimTimeID
   FOREIGN KEY
   (
       DimTimeID
   )
   REFERENCES
       Shared.DimTime(DimTimeID);
GO


IF OBJECT_ID('Shared.DimEventType') IS NOT NULL
   ALTER TABLE Activity.FactOperatorEvents
   ADD CONSTRAINT fk_FactOperatorEvents_DimEventTypeID
   FOREIGN KEY
   (
       DimEventTypeID
   )
   REFERENCES
       Shared.DimEventType(DimEventTypeID);
GO


IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Activity.FactOperatorEvents
   ADD CONSTRAINT fk_FactOperatorEvents_DimStartDateID
   FOREIGN KEY
   (
       DimStartDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimTime') IS NOT NULL
   ALTER TABLE Activity.FactOperatorEvents
   ADD CONSTRAINT fk_FactOperatorEvents_DimStartTimeID
   FOREIGN KEY
   (
       DimStartTimeID
   )
   REFERENCES
       Shared.DimTime(DimTimeID);
GO


IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Activity.FactOperatorEvents
   ADD CONSTRAINT fk_FactOperatorEvents_DimEndDateID
   FOREIGN KEY
   (
       DimEndDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimTime') IS NOT NULL
   ALTER TABLE Activity.FactOperatorEvents
   ADD CONSTRAINT fk_FactOperatorEvents_DimEndTimeID
   FOREIGN KEY
   (
       DimEndTimeID
   )
   REFERENCES
       Shared.DimTime(DimTimeID);
GO


IF OBJECT_ID('Shared.DimLocation') IS NOT NULL
   ALTER TABLE Activity.FactOperatorEvents
   ADD CONSTRAINT fk_FactOperatorEvents_DimLocationID
   FOREIGN KEY
   (
       DimLocationID
   )
   REFERENCES
       Shared.DimLocation(DimLocationID);
GO


IF OBJECT_ID('Shared.DimPointOfInterest') IS NOT NULL
   ALTER TABLE Activity.FactOperatorEvents
   ADD CONSTRAINT fk_FactOperatorEvents_DimPointOfInterestID
   FOREIGN KEY
   (
       DimPointOfInterestID
   )
   REFERENCES
       Shared.DimPointOfInterest(DimPointOfInterestID);
GO


IF OBJECT_ID('Shared.DimTripCategory') IS NOT NULL
   ALTER TABLE Activity.FactOperatorEvents
   ADD CONSTRAINT fk_FactOperatorEvents_DimTripCategoryID
   FOREIGN KEY
   (
       DimTripCategoryID
   )
   REFERENCES
       Shared.DimTripCategory(DimTripCategoryID);
GO


IF OBJECT_ID('Shared.DimSite') IS NOT NULL
   ALTER TABLE Activity.FactOperatorEvents
   ADD CONSTRAINT fk_FactOperatorEvents_DimSiteID
   FOREIGN KEY
   (
       DimSiteID
   )
   REFERENCES
       Shared.DimSite(DimSiteID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Activity.FactOperatorEvents
   ADD CONSTRAINT fk_FactOperatorEvents_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimTimeID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'DimTimeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEventTypeID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'DimEventTypeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimStartDateID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'DimStartDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimStartTimeID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'DimStartTimeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEndDateID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'DimEndDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEndTimeID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'DimEndTimeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimLocationID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'DimLocationID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPointOfInterestID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'DimPointOfInterestID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimTripCategoryID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'DimTripCategoryID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimSiteID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'DimSiteID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'MaximumBrakingForce',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'MaximumBrakingForce';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AverageBrakingForce',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'AverageBrakingForce';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'OutOfBandBrakingForce',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'OutOfBandBrakingForce';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'MaximumRPM',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'MaximumRPM';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'AverageRPM',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'AverageRPM';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'OutOfBandRPM',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'OutOfBandRPM';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Exceptions';
IF SCHEMA_ID('Exceptions')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactOperatorExclusion */
IF OBJECT_ID('Exceptions.FactOperatorExclusion') IS NOT NULL
DROP TABLE FactOperatorExclusion;
GO


/* Create table Exceptions.FactOperatorExclusion */
CREATE TABLE Exceptions.FactOperatorExclusion
(
   FactOperatorExclusionID INT NOT NULL,
   DimDateID INT,
   DimExclusionLevel3ID INT,
   DimOperatorID INT,
   RunID INT NOT NULL
);
GO


ALTER TABLE Exceptions.FactOperatorExclusion
ADD CONSTRAINT pk_FactOperatorExclusionID
PRIMARY KEY CLUSTERED
(
   FactOperatorExclusionID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Exceptions.FactOperatorExclusion
   ADD CONSTRAINT fk_FactOperatorExclusion_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimExclusionLevel3') IS NOT NULL
   ALTER TABLE Exceptions.FactOperatorExclusion
   ADD CONSTRAINT fk_FactOperatorExclusion_DimExclusionLevel3ID
   FOREIGN KEY
   (
       DimExclusionLevel3ID
   )
   REFERENCES
       Shared.DimExclusionLevel3(DimExclusionLevel3ID);
GO


IF OBJECT_ID('Shared.DimOperator') IS NOT NULL
   ALTER TABLE Exceptions.FactOperatorExclusion
   ADD CONSTRAINT fk_FactOperatorExclusion_DimOperatorID
   FOREIGN KEY
   (
       DimOperatorID
   )
   REFERENCES
       Shared.DimOperator(DimOperatorID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactOperatorExclusion',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimExclusionLevel3ID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactOperatorExclusion',
@level2type=N'COLUMN',
@level2name=N'DimExclusionLevel3ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOperatorID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactOperatorExclusion',
@level2type=N'COLUMN',
@level2name=N'DimOperatorID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Costs';
IF SCHEMA_ID('Costs')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactPartsCost */
IF OBJECT_ID('Costs.FactPartsCost') IS NOT NULL
DROP TABLE FactPartsCost;
GO


/* Create table Costs.FactPartsCost */
CREATE TABLE Costs.FactPartsCost
(
   FactPartsCostID INT NOT NULL,
   DimDateID INT,
   DimTimeID INT,
   DimCostTypeID INT,
   DimEquipmentID INT,
   DimOrganisationLevel5ID INT,
   DimCurrencyID INT,
   FinancialAmount DECIMAL(18,2),
   Tax DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Costs.FactPartsCost
ADD CONSTRAINT pk_FactPartsCostID
PRIMARY KEY CLUSTERED
(
   FactPartsCostID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Costs.FactPartsCost
   ADD CONSTRAINT fk_FactPartsCost_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimTime') IS NOT NULL
   ALTER TABLE Costs.FactPartsCost
   ADD CONSTRAINT fk_FactPartsCost_DimTimeID
   FOREIGN KEY
   (
       DimTimeID
   )
   REFERENCES
       Shared.DimTime(DimTimeID);
GO


IF OBJECT_ID('Shared.DimCostType') IS NOT NULL
   ALTER TABLE Costs.FactPartsCost
   ADD CONSTRAINT fk_FactPartsCost_DimCostTypeID
   FOREIGN KEY
   (
       DimCostTypeID
   )
   REFERENCES
       Shared.DimCostType(DimCostTypeID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Costs.FactPartsCost
   ADD CONSTRAINT fk_FactPartsCost_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Costs.FactPartsCost
   ADD CONSTRAINT fk_FactPartsCost_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


IF OBJECT_ID('Shared.DimCurrency') IS NOT NULL
   ALTER TABLE Costs.FactPartsCost
   ADD CONSTRAINT fk_FactPartsCost_DimCurrencyID
   FOREIGN KEY
   (
       DimCurrencyID
   )
   REFERENCES
       Shared.DimCurrency(DimCurrencyID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactPartsCost',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimTimeID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactPartsCost',
@level2type=N'COLUMN',
@level2name=N'DimTimeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCostTypeID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactPartsCost',
@level2type=N'COLUMN',
@level2name=N'DimCostTypeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactPartsCost',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactPartsCost',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCurrencyID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactPartsCost',
@level2type=N'COLUMN',
@level2name=N'DimCurrencyID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'FinancialAmount',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactPartsCost',
@level2type=N'COLUMN',
@level2name=N'FinancialAmount';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Tax',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactPartsCost',
@level2type=N'COLUMN',
@level2name=N'Tax';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Production';
IF SCHEMA_ID('Production')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactProduction */
IF OBJECT_ID('Production.FactProduction') IS NOT NULL
DROP TABLE FactProduction;
GO


/* Create table Production.FactProduction */
CREATE TABLE Production.FactProduction
(
   FactProductionID INT NOT NULL,
   DimDateID INT,
   DimTimeID INT,
   DimEquipmentID INT,
   DimOperatorID INT,
   DimLocationID INT,
   DimProductID INT,
   DimUnitID INT,
   DimPointOfInterestID INT,
   DimCustomerLevel3ID INT,
   DimOrganisationLevel5ID INT,
   Units DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Production.FactProduction
ADD CONSTRAINT pk_FactProductionID
PRIMARY KEY CLUSTERED
(
   FactProductionID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Production.FactProduction
   ADD CONSTRAINT fk_FactProduction_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimTime') IS NOT NULL
   ALTER TABLE Production.FactProduction
   ADD CONSTRAINT fk_FactProduction_DimTimeID
   FOREIGN KEY
   (
       DimTimeID
   )
   REFERENCES
       Shared.DimTime(DimTimeID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Production.FactProduction
   ADD CONSTRAINT fk_FactProduction_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimOperator') IS NOT NULL
   ALTER TABLE Production.FactProduction
   ADD CONSTRAINT fk_FactProduction_DimOperatorID
   FOREIGN KEY
   (
       DimOperatorID
   )
   REFERENCES
       Shared.DimOperator(DimOperatorID);
GO


IF OBJECT_ID('Shared.DimLocation') IS NOT NULL
   ALTER TABLE Production.FactProduction
   ADD CONSTRAINT fk_FactProduction_DimLocationID
   FOREIGN KEY
   (
       DimLocationID
   )
   REFERENCES
       Shared.DimLocation(DimLocationID);
GO


IF OBJECT_ID('Shared.DimProduct') IS NOT NULL
   ALTER TABLE Production.FactProduction
   ADD CONSTRAINT fk_FactProduction_DimProductID
   FOREIGN KEY
   (
       DimProductID
   )
   REFERENCES
       Shared.DimProduct(DimProductID);
GO


IF OBJECT_ID('Shared.DimUnit') IS NOT NULL
   ALTER TABLE Production.FactProduction
   ADD CONSTRAINT fk_FactProduction_DimUnitID
   FOREIGN KEY
   (
       DimUnitID
   )
   REFERENCES
       Shared.DimUnit(DimUnitID);
GO


IF OBJECT_ID('Shared.DimPointOfInterest') IS NOT NULL
   ALTER TABLE Production.FactProduction
   ADD CONSTRAINT fk_FactProduction_DimPointOfInterestID
   FOREIGN KEY
   (
       DimPointOfInterestID
   )
   REFERENCES
       Shared.DimPointOfInterest(DimPointOfInterestID);
GO


IF OBJECT_ID('Shared.DimCustomerLevel3') IS NOT NULL
   ALTER TABLE Production.FactProduction
   ADD CONSTRAINT fk_FactProduction_DimCustomerLevel3ID
   FOREIGN KEY
   (
       DimCustomerLevel3ID
   )
   REFERENCES
       Shared.DimCustomerLevel3(DimCustomerLevel3ID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Production.FactProduction
   ADD CONSTRAINT fk_FactProduction_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProduction',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimTimeID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProduction',
@level2type=N'COLUMN',
@level2name=N'DimTimeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProduction',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOperatorID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProduction',
@level2type=N'COLUMN',
@level2name=N'DimOperatorID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimLocationID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProduction',
@level2type=N'COLUMN',
@level2name=N'DimLocationID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimProductID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProduction',
@level2type=N'COLUMN',
@level2name=N'DimProductID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimUnitID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProduction',
@level2type=N'COLUMN',
@level2name=N'DimUnitID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPointOfInterestID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProduction',
@level2type=N'COLUMN',
@level2name=N'DimPointOfInterestID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCustomerLevel3ID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProduction',
@level2type=N'COLUMN',
@level2name=N'DimCustomerLevel3ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProduction',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Units',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProduction',
@level2type=N'COLUMN',
@level2name=N'Units';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Production';
IF SCHEMA_ID('Production')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactProductionTargets */
IF OBJECT_ID('Production.FactProductionTargets') IS NOT NULL
DROP TABLE FactProductionTargets;
GO


/* Create table Production.FactProductionTargets */
CREATE TABLE Production.FactProductionTargets
(
   FactProductionTargetsID INT NOT NULL,
   DimDateID INT,
   DimEquipmentID INT,
   DimOperatorID INT,
   DimProductID INT,
   DimUnitID INT,
   DimPointOfInterestID INT,
   DimCustomerLevel3ID INT,
   DimOrganisationLevel5ID INT,
   Units DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Production.FactProductionTargets
ADD CONSTRAINT pk_FactProductionTargetsID
PRIMARY KEY CLUSTERED
(
   FactProductionTargetsID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Production.FactProductionTargets
   ADD CONSTRAINT fk_FactProductionTargets_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Production.FactProductionTargets
   ADD CONSTRAINT fk_FactProductionTargets_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimOperator') IS NOT NULL
   ALTER TABLE Production.FactProductionTargets
   ADD CONSTRAINT fk_FactProductionTargets_DimOperatorID
   FOREIGN KEY
   (
       DimOperatorID
   )
   REFERENCES
       Shared.DimOperator(DimOperatorID);
GO


IF OBJECT_ID('Shared.DimProduct') IS NOT NULL
   ALTER TABLE Production.FactProductionTargets
   ADD CONSTRAINT fk_FactProductionTargets_DimProductID
   FOREIGN KEY
   (
       DimProductID
   )
   REFERENCES
       Shared.DimProduct(DimProductID);
GO


IF OBJECT_ID('Shared.DimUnit') IS NOT NULL
   ALTER TABLE Production.FactProductionTargets
   ADD CONSTRAINT fk_FactProductionTargets_DimUnitID
   FOREIGN KEY
   (
       DimUnitID
   )
   REFERENCES
       Shared.DimUnit(DimUnitID);
GO


IF OBJECT_ID('Shared.DimPointOfInterest') IS NOT NULL
   ALTER TABLE Production.FactProductionTargets
   ADD CONSTRAINT fk_FactProductionTargets_DimPointOfInterestID
   FOREIGN KEY
   (
       DimPointOfInterestID
   )
   REFERENCES
       Shared.DimPointOfInterest(DimPointOfInterestID);
GO


IF OBJECT_ID('Shared.DimCustomerLevel3') IS NOT NULL
   ALTER TABLE Production.FactProductionTargets
   ADD CONSTRAINT fk_FactProductionTargets_DimCustomerLevel3ID
   FOREIGN KEY
   (
       DimCustomerLevel3ID
   )
   REFERENCES
       Shared.DimCustomerLevel3(DimCustomerLevel3ID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Production.FactProductionTargets
   ADD CONSTRAINT fk_FactProductionTargets_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProductionTargets',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProductionTargets',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOperatorID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProductionTargets',
@level2type=N'COLUMN',
@level2name=N'DimOperatorID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimProductID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProductionTargets',
@level2type=N'COLUMN',
@level2name=N'DimProductID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimUnitID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProductionTargets',
@level2type=N'COLUMN',
@level2name=N'DimUnitID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPointOfInterestID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProductionTargets',
@level2type=N'COLUMN',
@level2name=N'DimPointOfInterestID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCustomerLevel3ID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProductionTargets',
@level2type=N'COLUMN',
@level2name=N'DimCustomerLevel3ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProductionTargets',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Units',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProductionTargets',
@level2type=N'COLUMN',
@level2name=N'Units';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Costs';
IF SCHEMA_ID('Costs')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactServiceCost */
IF OBJECT_ID('Costs.FactServiceCost') IS NOT NULL
DROP TABLE FactServiceCost;
GO


/* Create table Costs.FactServiceCost */
CREATE TABLE Costs.FactServiceCost
(
   FactServiceCostID INT NOT NULL,
   DimDateID INT,
   DimTimeID INT,
   DimCostTypeID INT,
   DimEquipmentID INT,
   DimOrganisationLevel5ID INT,
   DimCurrencyID INT,
   FinancialAmount DECIMAL(18,2),
   Tax DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Costs.FactServiceCost
ADD CONSTRAINT pk_FactServiceCostID
PRIMARY KEY CLUSTERED
(
   FactServiceCostID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Costs.FactServiceCost
   ADD CONSTRAINT fk_FactServiceCost_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimTime') IS NOT NULL
   ALTER TABLE Costs.FactServiceCost
   ADD CONSTRAINT fk_FactServiceCost_DimTimeID
   FOREIGN KEY
   (
       DimTimeID
   )
   REFERENCES
       Shared.DimTime(DimTimeID);
GO


IF OBJECT_ID('Shared.DimCostType') IS NOT NULL
   ALTER TABLE Costs.FactServiceCost
   ADD CONSTRAINT fk_FactServiceCost_DimCostTypeID
   FOREIGN KEY
   (
       DimCostTypeID
   )
   REFERENCES
       Shared.DimCostType(DimCostTypeID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Costs.FactServiceCost
   ADD CONSTRAINT fk_FactServiceCost_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Costs.FactServiceCost
   ADD CONSTRAINT fk_FactServiceCost_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


IF OBJECT_ID('Shared.DimCurrency') IS NOT NULL
   ALTER TABLE Costs.FactServiceCost
   ADD CONSTRAINT fk_FactServiceCost_DimCurrencyID
   FOREIGN KEY
   (
       DimCurrencyID
   )
   REFERENCES
       Shared.DimCurrency(DimCurrencyID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactServiceCost',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimTimeID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactServiceCost',
@level2type=N'COLUMN',
@level2name=N'DimTimeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCostTypeID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactServiceCost',
@level2type=N'COLUMN',
@level2name=N'DimCostTypeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactServiceCost',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactServiceCost',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimCurrencyID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactServiceCost',
@level2type=N'COLUMN',
@level2name=N'DimCurrencyID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'FinancialAmount',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactServiceCost',
@level2type=N'COLUMN',
@level2name=N'FinancialAmount';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Tax',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactServiceCost',
@level2type=N'COLUMN',
@level2name=N'Tax';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Shared';
IF SCHEMA_ID('Shared')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactUnitConversion */
IF OBJECT_ID('Shared.FactUnitConversion') IS NOT NULL
DROP TABLE FactUnitConversion;
GO


/* Create table Shared.FactUnitConversion */
CREATE TABLE Shared.FactUnitConversion
(
   FactUnitConversionID INT NOT NULL,
   DimSourceUnitIDID INT,
   DimTargetUnitIDID INT,
   ConversionFactor DECIMAL(18,2),
   Scale DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Shared.FactUnitConversion
ADD CONSTRAINT pk_FactUnitConversionID
PRIMARY KEY CLUSTERED
(
   FactUnitConversionID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimUnit') IS NOT NULL
   ALTER TABLE Shared.FactUnitConversion
   ADD CONSTRAINT fk_FactUnitConversion_DimSourceUnitIDID
   FOREIGN KEY
   (
       DimSourceUnitIDID
   )
   REFERENCES
       Shared.DimUnit(DimUnitID);
GO


IF OBJECT_ID('Shared.DimUnit') IS NOT NULL
   ALTER TABLE Shared.FactUnitConversion
   ADD CONSTRAINT fk_FactUnitConversion_DimTargetUnitIDID
   FOREIGN KEY
   (
       DimTargetUnitIDID
   )
   REFERENCES
       Shared.DimUnit(DimUnitID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimSourceUnitIDID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'FactUnitConversion',
@level2type=N'COLUMN',
@level2name=N'DimSourceUnitIDID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimTargetUnitIDID',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'FactUnitConversion',
@level2type=N'COLUMN',
@level2name=N'DimTargetUnitIDID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'ConversionFactor',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'FactUnitConversion',
@level2type=N'COLUMN',
@level2name=N'ConversionFactor';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Scale',
@level0type=N'SCHEMA',
@level0name=N'Shared',
@level1type=N'TABLE',
@level1name=N'FactUnitConversion',
@level2type=N'COLUMN',
@level2name=N'Scale';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Availability';
IF SCHEMA_ID('Availability')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactUptimeplans */
IF OBJECT_ID('Availability.FactUptimeplans') IS NOT NULL
DROP TABLE FactUptimeplans;
GO


/* Create table Availability.FactUptimeplans */
CREATE TABLE Availability.FactUptimeplans
(
   FactUptimeplansID INT NOT NULL,
   DimDateID INT,
   DimTimeID INT,
   DimAvailabilityLevel5ID INT,
   DimEquipmentID INT,
   DimLocationID INT,
   DimPayloadID INT,
   DimPointOfInterestID INT,
   DimOrganisationLevel5ID INT,
   Seconds DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Availability.FactUptimeplans
ADD CONSTRAINT pk_FactUptimeplansID
PRIMARY KEY CLUSTERED
(
   FactUptimeplansID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Availability.FactUptimeplans
   ADD CONSTRAINT fk_FactUptimeplans_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimTime') IS NOT NULL
   ALTER TABLE Availability.FactUptimeplans
   ADD CONSTRAINT fk_FactUptimeplans_DimTimeID
   FOREIGN KEY
   (
       DimTimeID
   )
   REFERENCES
       Shared.DimTime(DimTimeID);
GO


IF OBJECT_ID('Shared.DimAvailabilityLevel5') IS NOT NULL
   ALTER TABLE Availability.FactUptimeplans
   ADD CONSTRAINT fk_FactUptimeplans_DimAvailabilityLevel5ID
   FOREIGN KEY
   (
       DimAvailabilityLevel5ID
   )
   REFERENCES
       Shared.DimAvailabilityLevel5(DimAvailabilityLevel5ID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Availability.FactUptimeplans
   ADD CONSTRAINT fk_FactUptimeplans_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimLocation') IS NOT NULL
   ALTER TABLE Availability.FactUptimeplans
   ADD CONSTRAINT fk_FactUptimeplans_DimLocationID
   FOREIGN KEY
   (
       DimLocationID
   )
   REFERENCES
       Shared.DimLocation(DimLocationID);
GO


IF OBJECT_ID('Shared.DimPayload') IS NOT NULL
   ALTER TABLE Availability.FactUptimeplans
   ADD CONSTRAINT fk_FactUptimeplans_DimPayloadID
   FOREIGN KEY
   (
       DimPayloadID
   )
   REFERENCES
       Shared.DimPayload(DimPayloadID);
GO


IF OBJECT_ID('Shared.DimPointOfInterest') IS NOT NULL
   ALTER TABLE Availability.FactUptimeplans
   ADD CONSTRAINT fk_FactUptimeplans_DimPointOfInterestID
   FOREIGN KEY
   (
       DimPointOfInterestID
   )
   REFERENCES
       Shared.DimPointOfInterest(DimPointOfInterestID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Availability.FactUptimeplans
   ADD CONSTRAINT fk_FactUptimeplans_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactUptimeplans',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimTimeID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactUptimeplans',
@level2type=N'COLUMN',
@level2name=N'DimTimeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimAvailabilityLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactUptimeplans',
@level2type=N'COLUMN',
@level2name=N'DimAvailabilityLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactUptimeplans',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimLocationID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactUptimeplans',
@level2type=N'COLUMN',
@level2name=N'DimLocationID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPayloadID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactUptimeplans',
@level2type=N'COLUMN',
@level2name=N'DimPayloadID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPointOfInterestID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactUptimeplans',
@level2type=N'COLUMN',
@level2name=N'DimPointOfInterestID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactUptimeplans',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Seconds',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactUptimeplans',
@level2type=N'COLUMN',
@level2name=N'Seconds';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Activity';
IF SCHEMA_ID('Activity')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactVehicleActivityDetail */
IF OBJECT_ID('Activity.FactVehicleActivityDetail') IS NOT NULL
DROP TABLE FactVehicleActivityDetail;
GO


/* Create table Activity.FactVehicleActivityDetail */
CREATE TABLE Activity.FactVehicleActivityDetail
(
   FactVehicleActivityDetailID INT NOT NULL,
   DimDateID INT,
   DimTimeID INT,
   DimEquipmentID INT,
   DimEventTypeID INT,
   DimOrganisationLevel5ID INT,
   BrakingForce DECIMAL(18,2),
   RPM DECIMAL(18,2),
   OdometerReading DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Activity.FactVehicleActivityDetail
ADD CONSTRAINT pk_FactVehicleActivityDetailID
PRIMARY KEY CLUSTERED
(
   FactVehicleActivityDetailID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Activity.FactVehicleActivityDetail
   ADD CONSTRAINT fk_FactVehicleActivityDetail_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimTime') IS NOT NULL
   ALTER TABLE Activity.FactVehicleActivityDetail
   ADD CONSTRAINT fk_FactVehicleActivityDetail_DimTimeID
   FOREIGN KEY
   (
       DimTimeID
   )
   REFERENCES
       Shared.DimTime(DimTimeID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Activity.FactVehicleActivityDetail
   ADD CONSTRAINT fk_FactVehicleActivityDetail_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimEventType') IS NOT NULL
   ALTER TABLE Activity.FactVehicleActivityDetail
   ADD CONSTRAINT fk_FactVehicleActivityDetail_DimEventTypeID
   FOREIGN KEY
   (
       DimEventTypeID
   )
   REFERENCES
       Shared.DimEventType(DimEventTypeID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Activity.FactVehicleActivityDetail
   ADD CONSTRAINT fk_FactVehicleActivityDetail_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleActivityDetail',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimTimeID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleActivityDetail',
@level2type=N'COLUMN',
@level2name=N'DimTimeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleActivityDetail',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEventTypeID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleActivityDetail',
@level2type=N'COLUMN',
@level2name=N'DimEventTypeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleActivityDetail',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'BrakingForce',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleActivityDetail',
@level2type=N'COLUMN',
@level2name=N'BrakingForce';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'RPM',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleActivityDetail',
@level2type=N'COLUMN',
@level2name=N'RPM';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'OdometerReading',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleActivityDetail',
@level2type=N'COLUMN',
@level2name=N'OdometerReading';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Activity';
IF SCHEMA_ID('Activity')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactVehicleTrip */
IF OBJECT_ID('Activity.FactVehicleTrip') IS NOT NULL
DROP TABLE FactVehicleTrip;
GO


/* Create table Activity.FactVehicleTrip */
CREATE TABLE Activity.FactVehicleTrip
(
   FactVehicleTripID INT NOT NULL,
   DimDateID INT,
   DimTimeID INT,
   DimEquipmentID INT,
   DimEventTypeID INT,
   DimLocationID INT,
   DimPayloadID INT,
   DimSiteID INT,
   DimOrganisationLevel5ID INT,
   StartOdometer DECIMAL(18,2),
   EndOdometer DECIMAL(18,2),
   Duration DECIMAL(18,2),
   Payload DECIMAL(18,2),
   RunID INT NOT NULL
);
GO


ALTER TABLE Activity.FactVehicleTrip
ADD CONSTRAINT pk_FactVehicleTripID
PRIMARY KEY CLUSTERED
(
   FactVehicleTripID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Activity.FactVehicleTrip
   ADD CONSTRAINT fk_FactVehicleTrip_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimTime') IS NOT NULL
   ALTER TABLE Activity.FactVehicleTrip
   ADD CONSTRAINT fk_FactVehicleTrip_DimTimeID
   FOREIGN KEY
   (
       DimTimeID
   )
   REFERENCES
       Shared.DimTime(DimTimeID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Activity.FactVehicleTrip
   ADD CONSTRAINT fk_FactVehicleTrip_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimEventType') IS NOT NULL
   ALTER TABLE Activity.FactVehicleTrip
   ADD CONSTRAINT fk_FactVehicleTrip_DimEventTypeID
   FOREIGN KEY
   (
       DimEventTypeID
   )
   REFERENCES
       Shared.DimEventType(DimEventTypeID);
GO


IF OBJECT_ID('Shared.DimLocation') IS NOT NULL
   ALTER TABLE Activity.FactVehicleTrip
   ADD CONSTRAINT fk_FactVehicleTrip_DimLocationID
   FOREIGN KEY
   (
       DimLocationID
   )
   REFERENCES
       Shared.DimLocation(DimLocationID);
GO


IF OBJECT_ID('Shared.DimPayload') IS NOT NULL
   ALTER TABLE Activity.FactVehicleTrip
   ADD CONSTRAINT fk_FactVehicleTrip_DimPayloadID
   FOREIGN KEY
   (
       DimPayloadID
   )
   REFERENCES
       Shared.DimPayload(DimPayloadID);
GO


IF OBJECT_ID('Shared.DimSite') IS NOT NULL
   ALTER TABLE Activity.FactVehicleTrip
   ADD CONSTRAINT fk_FactVehicleTrip_DimSiteID
   FOREIGN KEY
   (
       DimSiteID
   )
   REFERENCES
       Shared.DimSite(DimSiteID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Activity.FactVehicleTrip
   ADD CONSTRAINT fk_FactVehicleTrip_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleTrip',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimTimeID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleTrip',
@level2type=N'COLUMN',
@level2name=N'DimTimeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleTrip',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEventTypeID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleTrip',
@level2type=N'COLUMN',
@level2name=N'DimEventTypeID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimLocationID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleTrip',
@level2type=N'COLUMN',
@level2name=N'DimLocationID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimPayloadID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleTrip',
@level2type=N'COLUMN',
@level2name=N'DimPayloadID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimSiteID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleTrip',
@level2type=N'COLUMN',
@level2name=N'DimSiteID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleTrip',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'StartOdometer',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleTrip',
@level2type=N'COLUMN',
@level2name=N'StartOdometer';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'EndOdometer',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleTrip',
@level2type=N'COLUMN',
@level2name=N'EndOdometer';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Duration',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleTrip',
@level2type=N'COLUMN',
@level2name=N'Duration';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'Payload',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleTrip',
@level2type=N'COLUMN',
@level2name=N'Payload';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Activity';
IF SCHEMA_ID('Activity')IS NULL
EXEC sp_executesql @sql;
GO


/* Drop table FactXEquipmentActivityDetail */
IF OBJECT_ID('Activity.FactXEquipmentActivityDetail') IS NOT NULL
DROP TABLE FactXEquipmentActivityDetail;
GO


/* Create table Activity.FactXEquipmentActivityDetail */
CREATE TABLE Activity.FactXEquipmentActivityDetail
(
   FactXEquipmentActivityDetailID INT NOT NULL,
   DimDateID INT,
   DimEquipmentID INT,
   DimLocationID INT,
   DimOrganisationLevel5ID INT,
   RunID INT NOT NULL
);
GO


ALTER TABLE Activity.FactXEquipmentActivityDetail
ADD CONSTRAINT pk_FactXEquipmentActivityDetailID
PRIMARY KEY CLUSTERED
(
   FactXEquipmentActivityDetailID
);
GO


--Add UNIQUE Constraints...
--Add Foreign Keys...
IF OBJECT_ID('Shared.DimDate') IS NOT NULL
   ALTER TABLE Activity.FactXEquipmentActivityDetail
   ADD CONSTRAINT fk_FactXEquipmentActivityDetail_DimDateID
   FOREIGN KEY
   (
       DimDateID
   )
   REFERENCES
       Shared.DimDate(DimDateID);
GO


IF OBJECT_ID('Shared.DimEquipment') IS NOT NULL
   ALTER TABLE Activity.FactXEquipmentActivityDetail
   ADD CONSTRAINT fk_FactXEquipmentActivityDetail_DimEquipmentID
   FOREIGN KEY
   (
       DimEquipmentID
   )
   REFERENCES
       Shared.DimEquipment(DimEquipmentID);
GO


IF OBJECT_ID('Shared.DimLocation') IS NOT NULL
   ALTER TABLE Activity.FactXEquipmentActivityDetail
   ADD CONSTRAINT fk_FactXEquipmentActivityDetail_DimLocationID
   FOREIGN KEY
   (
       DimLocationID
   )
   REFERENCES
       Shared.DimLocation(DimLocationID);
GO


IF OBJECT_ID('Shared.DimOrganisationLevel5') IS NOT NULL
   ALTER TABLE Activity.FactXEquipmentActivityDetail
   ADD CONSTRAINT fk_FactXEquipmentActivityDetail_DimOrganisationLevel5ID
   FOREIGN KEY
   (
       DimOrganisationLevel5ID
   )
   REFERENCES
       Shared.DimOrganisationLevel5(DimOrganisationLevel5ID);
GO


--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimDateID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactXEquipmentActivityDetail',
@level2type=N'COLUMN',
@level2name=N'DimDateID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimEquipmentID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactXEquipmentActivityDetail',
@level2type=N'COLUMN',
@level2name=N'DimEquipmentID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimLocationID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactXEquipmentActivityDetail',
@level2type=N'COLUMN',
@level2name=N'DimLocationID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationLevel5ID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactXEquipmentActivityDetail',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationLevel5ID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Activity';
IF SCHEMA_ID('Activity')IS NULL
EXEC sp_executesql @sql;
GO



