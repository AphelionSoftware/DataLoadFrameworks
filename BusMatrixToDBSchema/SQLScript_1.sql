/****** Object:  Database Okavango    Script Date: 1/4/2014 6:00:42 PM ******/


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
   DimOrganisationID INT,
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
ALTER TABLE Activity.FactActivityDetail
ADD CONSTRAINT uc_FactActivityDetail_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Activity.FactActivityDetail
ADD CONSTRAINT uc_FactActivityDetail_DimTimeID
UNIQUE
(
   DimTimeID
)
GO


ALTER TABLE Activity.FactActivityDetail
ADD CONSTRAINT uc_FactActivityDetail_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Activity.FactActivityDetail
ADD CONSTRAINT uc_FactActivityDetail_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


--Add Foreign Keys...
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivityDetail',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
   DimExceptionID INT,
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
ALTER TABLE Exceptions.FactActivityException
ADD CONSTRAINT uc_FactActivityException_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Exceptions.FactActivityException
ADD CONSTRAINT uc_FactActivityException_DimTimeID
UNIQUE
(
   DimTimeID
)
GO


ALTER TABLE Exceptions.FactActivityException
ADD CONSTRAINT uc_FactActivityException_DimExceptionID
UNIQUE
(
   DimExceptionID
)
GO


ALTER TABLE Exceptions.FactActivityException
ADD CONSTRAINT uc_FactActivityException_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


--Add Foreign Keys...
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
@value=N'DimExceptionID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityException',
@level2type=N'COLUMN',
@level2name=N'DimExceptionID';
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
   DimExclusionID INT,
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
ALTER TABLE Exceptions.FactActivityExclusion
ADD CONSTRAINT uc_FactActivityExclusion_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Exceptions.FactActivityExclusion
ADD CONSTRAINT uc_FactActivityExclusion_DimExclusionID
UNIQUE
(
   DimExclusionID
)
GO


ALTER TABLE Exceptions.FactActivityExclusion
ADD CONSTRAINT uc_FactActivityExclusion_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Exceptions.FactActivityExclusion
ADD CONSTRAINT uc_FactActivityExclusion_DimLocationID
UNIQUE
(
   DimLocationID
)
GO


ALTER TABLE Exceptions.FactActivityExclusion
ADD CONSTRAINT uc_FactActivityExclusion_DimPointOfInterestID
UNIQUE
(
   DimPointOfInterestID
)
GO


--Add Foreign Keys...
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
@value=N'DimExclusionID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactActivityExclusion',
@level2type=N'COLUMN',
@level2name=N'DimExclusionID';
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
   DimOrganisationID INT,
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
ALTER TABLE Activity.FactActivitySummary
ADD CONSTRAINT uc_FactActivitySummary_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Activity.FactActivitySummary
ADD CONSTRAINT uc_FactActivitySummary_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Activity.FactActivitySummary
ADD CONSTRAINT uc_FactActivitySummary_DimLocationID
UNIQUE
(
   DimLocationID
)
GO


ALTER TABLE Activity.FactActivitySummary
ADD CONSTRAINT uc_FactActivitySummary_DimPayloadID
UNIQUE
(
   DimPayloadID
)
GO


ALTER TABLE Activity.FactActivitySummary
ADD CONSTRAINT uc_FactActivitySummary_DimSiteID
UNIQUE
(
   DimSiteID
)
GO


ALTER TABLE Activity.FactActivitySummary
ADD CONSTRAINT uc_FactActivitySummary_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


ALTER TABLE Activity.FactActivitySummary
ADD CONSTRAINT uc_FactActivitySummary_DimPayloadUnitID
UNIQUE
(
   DimPayloadUnitID
)
GO


--Add Foreign Keys...
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactActivitySummary',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
   DimOrganisationID INT,
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
ALTER TABLE Costs.FactBudget
ADD CONSTRAINT uc_FactBudget_DimCostTypeID
UNIQUE
(
   DimCostTypeID
)
GO


ALTER TABLE Costs.FactBudget
ADD CONSTRAINT uc_FactBudget_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Costs.FactBudget
ADD CONSTRAINT uc_FactBudget_DimLocationID
UNIQUE
(
   DimLocationID
)
GO


ALTER TABLE Costs.FactBudget
ADD CONSTRAINT uc_FactBudget_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


ALTER TABLE Costs.FactBudget
ADD CONSTRAINT uc_FactBudget_DimCurrencyID
UNIQUE
(
   DimCurrencyID
)
GO


--Add Foreign Keys...
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactBudget',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
ALTER TABLE Costs.FactCapturedCosts
ADD CONSTRAINT uc_FactCapturedCosts_DimCostTypeID
UNIQUE
(
   DimCostTypeID
)
GO


ALTER TABLE Costs.FactCapturedCosts
ADD CONSTRAINT uc_FactCapturedCosts_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Costs.FactCapturedCosts
ADD CONSTRAINT uc_FactCapturedCosts_DimOperatorID
UNIQUE
(
   DimOperatorID
)
GO


ALTER TABLE Costs.FactCapturedCosts
ADD CONSTRAINT uc_FactCapturedCosts_DimCurrencyID
UNIQUE
(
   DimCurrencyID
)
GO


--Add Foreign Keys...
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
   DimOrganisationID INT,
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
ALTER TABLE Costs.FactCarbonCredits
ADD CONSTRAINT uc_FactCarbonCredits_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Costs.FactCarbonCredits
ADD CONSTRAINT uc_FactCarbonCredits_DimCostTypeID
UNIQUE
(
   DimCostTypeID
)
GO


ALTER TABLE Costs.FactCarbonCredits
ADD CONSTRAINT uc_FactCarbonCredits_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Costs.FactCarbonCredits
ADD CONSTRAINT uc_FactCarbonCredits_DimLocationID
UNIQUE
(
   DimLocationID
)
GO


ALTER TABLE Costs.FactCarbonCredits
ADD CONSTRAINT uc_FactCarbonCredits_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


ALTER TABLE Costs.FactCarbonCredits
ADD CONSTRAINT uc_FactCarbonCredits_DimCurrencyID
UNIQUE
(
   DimCurrencyID
)
GO


--Add Foreign Keys...
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCarbonCredits',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
   DimOrganisationID INT,
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
ALTER TABLE Costs.FactCarbonTax
ADD CONSTRAINT uc_FactCarbonTax_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Costs.FactCarbonTax
ADD CONSTRAINT uc_FactCarbonTax_DimCostTypeID
UNIQUE
(
   DimCostTypeID
)
GO


ALTER TABLE Costs.FactCarbonTax
ADD CONSTRAINT uc_FactCarbonTax_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Costs.FactCarbonTax
ADD CONSTRAINT uc_FactCarbonTax_DimLocationID
UNIQUE
(
   DimLocationID
)
GO


ALTER TABLE Costs.FactCarbonTax
ADD CONSTRAINT uc_FactCarbonTax_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


ALTER TABLE Costs.FactCarbonTax
ADD CONSTRAINT uc_FactCarbonTax_DimCurrencyID
UNIQUE
(
   DimCurrencyID
)
GO


--Add Foreign Keys...
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactCarbonTax',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
ALTER TABLE Costs.FactCostsPerUnit
ADD CONSTRAINT uc_FactCostsPerUnit_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Costs.FactCostsPerUnit
ADD CONSTRAINT uc_FactCostsPerUnit_DimTimeID
UNIQUE
(
   DimTimeID
)
GO


ALTER TABLE Costs.FactCostsPerUnit
ADD CONSTRAINT uc_FactCostsPerUnit_DimCostTypeID
UNIQUE
(
   DimCostTypeID
)
GO


ALTER TABLE Costs.FactCostsPerUnit
ADD CONSTRAINT uc_FactCostsPerUnit_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Costs.FactCostsPerUnit
ADD CONSTRAINT uc_FactCostsPerUnit_DimCurrencyID
UNIQUE
(
   DimCurrencyID
)
GO


--Add Foreign Keys...
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
   DimOrganisationID INT,
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
ALTER TABLE Costs.FactDepreciationCosts
ADD CONSTRAINT uc_FactDepreciationCosts_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Costs.FactDepreciationCosts
ADD CONSTRAINT uc_FactDepreciationCosts_DimTimeID
UNIQUE
(
   DimTimeID
)
GO


ALTER TABLE Costs.FactDepreciationCosts
ADD CONSTRAINT uc_FactDepreciationCosts_DimCostTypeID
UNIQUE
(
   DimCostTypeID
)
GO


ALTER TABLE Costs.FactDepreciationCosts
ADD CONSTRAINT uc_FactDepreciationCosts_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Costs.FactDepreciationCosts
ADD CONSTRAINT uc_FactDepreciationCosts_DimLocationID
UNIQUE
(
   DimLocationID
)
GO


ALTER TABLE Costs.FactDepreciationCosts
ADD CONSTRAINT uc_FactDepreciationCosts_DimOperatorID
UNIQUE
(
   DimOperatorID
)
GO


ALTER TABLE Costs.FactDepreciationCosts
ADD CONSTRAINT uc_FactDepreciationCosts_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


ALTER TABLE Costs.FactDepreciationCosts
ADD CONSTRAINT uc_FactDepreciationCosts_DimCurrencyID
UNIQUE
(
   DimCurrencyID
)
GO


--Add Foreign Keys...
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactDepreciationCosts',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
   DimAvailabilityID INT,
   DimEquipmentID INT,
   DimOperatorID INT,
   DimLocationID INT,
   DimPayloadID INT,
   DimPointOfInterestID INT,
   DimOrganisationID INT,
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
ALTER TABLE Availability.FactEquipmentAvailability
ADD CONSTRAINT uc_FactEquipmentAvailability_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Availability.FactEquipmentAvailability
ADD CONSTRAINT uc_FactEquipmentAvailability_DimTimeID
UNIQUE
(
   DimTimeID
)
GO


ALTER TABLE Availability.FactEquipmentAvailability
ADD CONSTRAINT uc_FactEquipmentAvailability_DimAvailabilityID
UNIQUE
(
   DimAvailabilityID
)
GO


ALTER TABLE Availability.FactEquipmentAvailability
ADD CONSTRAINT uc_FactEquipmentAvailability_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Availability.FactEquipmentAvailability
ADD CONSTRAINT uc_FactEquipmentAvailability_DimOperatorID
UNIQUE
(
   DimOperatorID
)
GO


ALTER TABLE Availability.FactEquipmentAvailability
ADD CONSTRAINT uc_FactEquipmentAvailability_DimLocationID
UNIQUE
(
   DimLocationID
)
GO


ALTER TABLE Availability.FactEquipmentAvailability
ADD CONSTRAINT uc_FactEquipmentAvailability_DimPayloadID
UNIQUE
(
   DimPayloadID
)
GO


ALTER TABLE Availability.FactEquipmentAvailability
ADD CONSTRAINT uc_FactEquipmentAvailability_DimPointOfInterestID
UNIQUE
(
   DimPointOfInterestID
)
GO


ALTER TABLE Availability.FactEquipmentAvailability
ADD CONSTRAINT uc_FactEquipmentAvailability_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


--Add Foreign Keys...
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
@value=N'DimAvailabilityID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailability',
@level2type=N'COLUMN',
@level2name=N'DimAvailabilityID';
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailability',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
   DimAvailabilityID INT,
   DimEquipmentID INT,
   DimOperatorID INT,
   DimPayloadID INT,
   DimPointOfInterestID INT,
   DimOrganisationID INT,
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
ALTER TABLE Availability.FactEquipmentAvailabilityTargets
ADD CONSTRAINT uc_FactEquipmentAvailabilityTargets_DimAvailabilityID
UNIQUE
(
   DimAvailabilityID
)
GO


ALTER TABLE Availability.FactEquipmentAvailabilityTargets
ADD CONSTRAINT uc_FactEquipmentAvailabilityTargets_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Availability.FactEquipmentAvailabilityTargets
ADD CONSTRAINT uc_FactEquipmentAvailabilityTargets_DimOperatorID
UNIQUE
(
   DimOperatorID
)
GO


ALTER TABLE Availability.FactEquipmentAvailabilityTargets
ADD CONSTRAINT uc_FactEquipmentAvailabilityTargets_DimPayloadID
UNIQUE
(
   DimPayloadID
)
GO


ALTER TABLE Availability.FactEquipmentAvailabilityTargets
ADD CONSTRAINT uc_FactEquipmentAvailabilityTargets_DimPointOfInterestID
UNIQUE
(
   DimPointOfInterestID
)
GO


ALTER TABLE Availability.FactEquipmentAvailabilityTargets
ADD CONSTRAINT uc_FactEquipmentAvailabilityTargets_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimAvailabilityID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailabilityTargets',
@level2type=N'COLUMN',
@level2name=N'DimAvailabilityID';
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactEquipmentAvailabilityTargets',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
   DimOrganisationID INT,
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
ALTER TABLE Activity.FactEquipmentEvents
ADD CONSTRAINT uc_FactEquipmentEvents_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Activity.FactEquipmentEvents
ADD CONSTRAINT uc_FactEquipmentEvents_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Activity.FactEquipmentEvents
ADD CONSTRAINT uc_FactEquipmentEvents_DimEventTypeID
UNIQUE
(
   DimEventTypeID
)
GO


ALTER TABLE Activity.FactEquipmentEvents
ADD CONSTRAINT uc_FactEquipmentEvents_DimStartDateID
UNIQUE
(
   DimStartDateID
)
GO


ALTER TABLE Activity.FactEquipmentEvents
ADD CONSTRAINT uc_FactEquipmentEvents_DimStartTimeID
UNIQUE
(
   DimStartTimeID
)
GO


ALTER TABLE Activity.FactEquipmentEvents
ADD CONSTRAINT uc_FactEquipmentEvents_DimEndDateID
UNIQUE
(
   DimEndDateID
)
GO


ALTER TABLE Activity.FactEquipmentEvents
ADD CONSTRAINT uc_FactEquipmentEvents_DimEndTimeID
UNIQUE
(
   DimEndTimeID
)
GO


ALTER TABLE Activity.FactEquipmentEvents
ADD CONSTRAINT uc_FactEquipmentEvents_DimLocationID
UNIQUE
(
   DimLocationID
)
GO


ALTER TABLE Activity.FactEquipmentEvents
ADD CONSTRAINT uc_FactEquipmentEvents_DimPointOfInterestID
UNIQUE
(
   DimPointOfInterestID
)
GO


ALTER TABLE Activity.FactEquipmentEvents
ADD CONSTRAINT uc_FactEquipmentEvents_DimTripCategoryID
UNIQUE
(
   DimTripCategoryID
)
GO


ALTER TABLE Activity.FactEquipmentEvents
ADD CONSTRAINT uc_FactEquipmentEvents_DimSiteID
UNIQUE
(
   DimSiteID
)
GO


ALTER TABLE Activity.FactEquipmentEvents
ADD CONSTRAINT uc_FactEquipmentEvents_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


--Add Foreign Keys...
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactEquipmentEvents',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
   DimExclusionID INT,
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
ALTER TABLE Exceptions.FactEquipmentExclusion
ADD CONSTRAINT uc_FactEquipmentExclusion_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Exceptions.FactEquipmentExclusion
ADD CONSTRAINT uc_FactEquipmentExclusion_DimExclusionID
UNIQUE
(
   DimExclusionID
)
GO


ALTER TABLE Exceptions.FactEquipmentExclusion
ADD CONSTRAINT uc_FactEquipmentExclusion_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


--Add Foreign Keys...
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
@value=N'DimExclusionID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactEquipmentExclusion',
@level2type=N'COLUMN',
@level2name=N'DimExclusionID';
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
   DimOrganisationID INT,
   DimChartOfAccountsID INT,
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
ALTER TABLE Costs.FactGeneralLedger
ADD CONSTRAINT uc_FactGeneralLedger_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Costs.FactGeneralLedger
ADD CONSTRAINT uc_FactGeneralLedger_DimCostTypeID
UNIQUE
(
   DimCostTypeID
)
GO


ALTER TABLE Costs.FactGeneralLedger
ADD CONSTRAINT uc_FactGeneralLedger_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


ALTER TABLE Costs.FactGeneralLedger
ADD CONSTRAINT uc_FactGeneralLedger_DimChartOfAccountsID
UNIQUE
(
   DimChartOfAccountsID
)
GO


ALTER TABLE Costs.FactGeneralLedger
ADD CONSTRAINT uc_FactGeneralLedger_DimCurrencyID
UNIQUE
(
   DimCurrencyID
)
GO


--Add Foreign Keys...
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactGeneralLedger',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimChartOfAccountsID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactGeneralLedger',
@level2type=N'COLUMN',
@level2name=N'DimChartOfAccountsID';
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
   DimOrganisationID INT,
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
ALTER TABLE Costs.FactInferredCosts
ADD CONSTRAINT uc_FactInferredCosts_DimCostTypeID
UNIQUE
(
   DimCostTypeID
)
GO


ALTER TABLE Costs.FactInferredCosts
ADD CONSTRAINT uc_FactInferredCosts_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Costs.FactInferredCosts
ADD CONSTRAINT uc_FactInferredCosts_DimLocationID
UNIQUE
(
   DimLocationID
)
GO


ALTER TABLE Costs.FactInferredCosts
ADD CONSTRAINT uc_FactInferredCosts_DimOperatorID
UNIQUE
(
   DimOperatorID
)
GO


ALTER TABLE Costs.FactInferredCosts
ADD CONSTRAINT uc_FactInferredCosts_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


ALTER TABLE Costs.FactInferredCosts
ADD CONSTRAINT uc_FactInferredCosts_DimCurrencyID
UNIQUE
(
   DimCurrencyID
)
GO


--Add Foreign Keys...
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactInferredCosts',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
   DimAvailabilityID INT,
   DimOperatorID INT,
   DimLocationID INT,
   DimPayloadID INT,
   DimPointOfInterestID INT,
   DimOrganisationID INT,
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
ALTER TABLE Availability.FactOperatorAvailability
ADD CONSTRAINT uc_FactOperatorAvailability_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Availability.FactOperatorAvailability
ADD CONSTRAINT uc_FactOperatorAvailability_DimTimeID
UNIQUE
(
   DimTimeID
)
GO


ALTER TABLE Availability.FactOperatorAvailability
ADD CONSTRAINT uc_FactOperatorAvailability_DimAvailabilityID
UNIQUE
(
   DimAvailabilityID
)
GO


ALTER TABLE Availability.FactOperatorAvailability
ADD CONSTRAINT uc_FactOperatorAvailability_DimOperatorID
UNIQUE
(
   DimOperatorID
)
GO


ALTER TABLE Availability.FactOperatorAvailability
ADD CONSTRAINT uc_FactOperatorAvailability_DimLocationID
UNIQUE
(
   DimLocationID
)
GO


ALTER TABLE Availability.FactOperatorAvailability
ADD CONSTRAINT uc_FactOperatorAvailability_DimPayloadID
UNIQUE
(
   DimPayloadID
)
GO


ALTER TABLE Availability.FactOperatorAvailability
ADD CONSTRAINT uc_FactOperatorAvailability_DimPointOfInterestID
UNIQUE
(
   DimPointOfInterestID
)
GO


ALTER TABLE Availability.FactOperatorAvailability
ADD CONSTRAINT uc_FactOperatorAvailability_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


--Add Foreign Keys...
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
@value=N'DimAvailabilityID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailability',
@level2type=N'COLUMN',
@level2name=N'DimAvailabilityID';
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailability',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
   DimAvailabilityID INT,
   DimOperatorID INT,
   DimPayloadID INT,
   DimPointOfInterestID INT,
   DimOrganisationID INT,
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
ALTER TABLE Availability.FactOperatorAvailabilityTargets
ADD CONSTRAINT uc_FactOperatorAvailabilityTargets_DimAvailabilityID
UNIQUE
(
   DimAvailabilityID
)
GO


ALTER TABLE Availability.FactOperatorAvailabilityTargets
ADD CONSTRAINT uc_FactOperatorAvailabilityTargets_DimOperatorID
UNIQUE
(
   DimOperatorID
)
GO


ALTER TABLE Availability.FactOperatorAvailabilityTargets
ADD CONSTRAINT uc_FactOperatorAvailabilityTargets_DimPayloadID
UNIQUE
(
   DimPayloadID
)
GO


ALTER TABLE Availability.FactOperatorAvailabilityTargets
ADD CONSTRAINT uc_FactOperatorAvailabilityTargets_DimPointOfInterestID
UNIQUE
(
   DimPointOfInterestID
)
GO


ALTER TABLE Availability.FactOperatorAvailabilityTargets
ADD CONSTRAINT uc_FactOperatorAvailabilityTargets_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


--Add Foreign Keys...
--Table extended properties...
exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimAvailabilityID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailabilityTargets',
@level2type=N'COLUMN',
@level2name=N'DimAvailabilityID';
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactOperatorAvailabilityTargets',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
   DimOrganisationID INT,
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
ALTER TABLE Activity.FactOperatorEvents
ADD CONSTRAINT uc_FactOperatorEvents_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Activity.FactOperatorEvents
ADD CONSTRAINT uc_FactOperatorEvents_DimTimeID
UNIQUE
(
   DimTimeID
)
GO


ALTER TABLE Activity.FactOperatorEvents
ADD CONSTRAINT uc_FactOperatorEvents_DimEventTypeID
UNIQUE
(
   DimEventTypeID
)
GO


ALTER TABLE Activity.FactOperatorEvents
ADD CONSTRAINT uc_FactOperatorEvents_DimStartDateID
UNIQUE
(
   DimStartDateID
)
GO


ALTER TABLE Activity.FactOperatorEvents
ADD CONSTRAINT uc_FactOperatorEvents_DimStartTimeID
UNIQUE
(
   DimStartTimeID
)
GO


ALTER TABLE Activity.FactOperatorEvents
ADD CONSTRAINT uc_FactOperatorEvents_DimEndDateID
UNIQUE
(
   DimEndDateID
)
GO


ALTER TABLE Activity.FactOperatorEvents
ADD CONSTRAINT uc_FactOperatorEvents_DimEndTimeID
UNIQUE
(
   DimEndTimeID
)
GO


ALTER TABLE Activity.FactOperatorEvents
ADD CONSTRAINT uc_FactOperatorEvents_DimLocationID
UNIQUE
(
   DimLocationID
)
GO


ALTER TABLE Activity.FactOperatorEvents
ADD CONSTRAINT uc_FactOperatorEvents_DimPointOfInterestID
UNIQUE
(
   DimPointOfInterestID
)
GO


ALTER TABLE Activity.FactOperatorEvents
ADD CONSTRAINT uc_FactOperatorEvents_DimTripCategoryID
UNIQUE
(
   DimTripCategoryID
)
GO


ALTER TABLE Activity.FactOperatorEvents
ADD CONSTRAINT uc_FactOperatorEvents_DimSiteID
UNIQUE
(
   DimSiteID
)
GO


ALTER TABLE Activity.FactOperatorEvents
ADD CONSTRAINT uc_FactOperatorEvents_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


--Add Foreign Keys...
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactOperatorEvents',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
   DimExclusionID INT,
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
ALTER TABLE Exceptions.FactOperatorExclusion
ADD CONSTRAINT uc_FactOperatorExclusion_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Exceptions.FactOperatorExclusion
ADD CONSTRAINT uc_FactOperatorExclusion_DimExclusionID
UNIQUE
(
   DimExclusionID
)
GO


ALTER TABLE Exceptions.FactOperatorExclusion
ADD CONSTRAINT uc_FactOperatorExclusion_DimOperatorID
UNIQUE
(
   DimOperatorID
)
GO


--Add Foreign Keys...
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
@value=N'DimExclusionID',
@level0type=N'SCHEMA',
@level0name=N'Exceptions',
@level1type=N'TABLE',
@level1name=N'FactOperatorExclusion',
@level2type=N'COLUMN',
@level2name=N'DimExclusionID';
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
   DimOrganisationID INT,
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
ALTER TABLE Costs.FactPartsCost
ADD CONSTRAINT uc_FactPartsCost_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Costs.FactPartsCost
ADD CONSTRAINT uc_FactPartsCost_DimTimeID
UNIQUE
(
   DimTimeID
)
GO


ALTER TABLE Costs.FactPartsCost
ADD CONSTRAINT uc_FactPartsCost_DimCostTypeID
UNIQUE
(
   DimCostTypeID
)
GO


ALTER TABLE Costs.FactPartsCost
ADD CONSTRAINT uc_FactPartsCost_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Costs.FactPartsCost
ADD CONSTRAINT uc_FactPartsCost_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


ALTER TABLE Costs.FactPartsCost
ADD CONSTRAINT uc_FactPartsCost_DimCurrencyID
UNIQUE
(
   DimCurrencyID
)
GO


--Add Foreign Keys...
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactPartsCost',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
   DimCustomerID INT,
   DimOrganisationID INT,
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
ALTER TABLE Production.FactProduction
ADD CONSTRAINT uc_FactProduction_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Production.FactProduction
ADD CONSTRAINT uc_FactProduction_DimTimeID
UNIQUE
(
   DimTimeID
)
GO


ALTER TABLE Production.FactProduction
ADD CONSTRAINT uc_FactProduction_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Production.FactProduction
ADD CONSTRAINT uc_FactProduction_DimOperatorID
UNIQUE
(
   DimOperatorID
)
GO


ALTER TABLE Production.FactProduction
ADD CONSTRAINT uc_FactProduction_DimLocationID
UNIQUE
(
   DimLocationID
)
GO


ALTER TABLE Production.FactProduction
ADD CONSTRAINT uc_FactProduction_DimProductID
UNIQUE
(
   DimProductID
)
GO


ALTER TABLE Production.FactProduction
ADD CONSTRAINT uc_FactProduction_DimUnitID
UNIQUE
(
   DimUnitID
)
GO


ALTER TABLE Production.FactProduction
ADD CONSTRAINT uc_FactProduction_DimPointOfInterestID
UNIQUE
(
   DimPointOfInterestID
)
GO


ALTER TABLE Production.FactProduction
ADD CONSTRAINT uc_FactProduction_DimCustomerID
UNIQUE
(
   DimCustomerID
)
GO


ALTER TABLE Production.FactProduction
ADD CONSTRAINT uc_FactProduction_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


--Add Foreign Keys...
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
@value=N'DimCustomerID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProduction',
@level2type=N'COLUMN',
@level2name=N'DimCustomerID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProduction',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
   DimCustomerID INT,
   DimOrganisationID INT,
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
ALTER TABLE Production.FactProductionTargets
ADD CONSTRAINT uc_FactProductionTargets_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Production.FactProductionTargets
ADD CONSTRAINT uc_FactProductionTargets_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Production.FactProductionTargets
ADD CONSTRAINT uc_FactProductionTargets_DimOperatorID
UNIQUE
(
   DimOperatorID
)
GO


ALTER TABLE Production.FactProductionTargets
ADD CONSTRAINT uc_FactProductionTargets_DimProductID
UNIQUE
(
   DimProductID
)
GO


ALTER TABLE Production.FactProductionTargets
ADD CONSTRAINT uc_FactProductionTargets_DimUnitID
UNIQUE
(
   DimUnitID
)
GO


ALTER TABLE Production.FactProductionTargets
ADD CONSTRAINT uc_FactProductionTargets_DimPointOfInterestID
UNIQUE
(
   DimPointOfInterestID
)
GO


ALTER TABLE Production.FactProductionTargets
ADD CONSTRAINT uc_FactProductionTargets_DimCustomerID
UNIQUE
(
   DimCustomerID
)
GO


ALTER TABLE Production.FactProductionTargets
ADD CONSTRAINT uc_FactProductionTargets_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


--Add Foreign Keys...
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
@value=N'DimCustomerID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProductionTargets',
@level2type=N'COLUMN',
@level2name=N'DimCustomerID';
GO

exec sys.sp_addextendedproperty
@name=N'DisplayName',
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Production',
@level1type=N'TABLE',
@level1name=N'FactProductionTargets',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
   DimOrganisationID INT,
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
ALTER TABLE Costs.FactServiceCost
ADD CONSTRAINT uc_FactServiceCost_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Costs.FactServiceCost
ADD CONSTRAINT uc_FactServiceCost_DimTimeID
UNIQUE
(
   DimTimeID
)
GO


ALTER TABLE Costs.FactServiceCost
ADD CONSTRAINT uc_FactServiceCost_DimCostTypeID
UNIQUE
(
   DimCostTypeID
)
GO


ALTER TABLE Costs.FactServiceCost
ADD CONSTRAINT uc_FactServiceCost_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Costs.FactServiceCost
ADD CONSTRAINT uc_FactServiceCost_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


ALTER TABLE Costs.FactServiceCost
ADD CONSTRAINT uc_FactServiceCost_DimCurrencyID
UNIQUE
(
   DimCurrencyID
)
GO


--Add Foreign Keys...
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Costs',
@level1type=N'TABLE',
@level1name=N'FactServiceCost',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
ALTER TABLE Shared.FactUnitConversion
ADD CONSTRAINT uc_FactUnitConversion_DimSourceUnitIDID
UNIQUE
(
   DimSourceUnitIDID
)
GO


ALTER TABLE Shared.FactUnitConversion
ADD CONSTRAINT uc_FactUnitConversion_DimTargetUnitIDID
UNIQUE
(
   DimTargetUnitIDID
)
GO


--Add Foreign Keys...
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
   DimAvailabilityID INT,
   DimEquipmentID INT,
   DimLocationID INT,
   DimPayloadID INT,
   DimPointOfInterestID INT,
   DimOrganisationID INT,
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
ALTER TABLE Availability.FactUptimeplans
ADD CONSTRAINT uc_FactUptimeplans_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Availability.FactUptimeplans
ADD CONSTRAINT uc_FactUptimeplans_DimTimeID
UNIQUE
(
   DimTimeID
)
GO


ALTER TABLE Availability.FactUptimeplans
ADD CONSTRAINT uc_FactUptimeplans_DimAvailabilityID
UNIQUE
(
   DimAvailabilityID
)
GO


ALTER TABLE Availability.FactUptimeplans
ADD CONSTRAINT uc_FactUptimeplans_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Availability.FactUptimeplans
ADD CONSTRAINT uc_FactUptimeplans_DimLocationID
UNIQUE
(
   DimLocationID
)
GO


ALTER TABLE Availability.FactUptimeplans
ADD CONSTRAINT uc_FactUptimeplans_DimPayloadID
UNIQUE
(
   DimPayloadID
)
GO


ALTER TABLE Availability.FactUptimeplans
ADD CONSTRAINT uc_FactUptimeplans_DimPointOfInterestID
UNIQUE
(
   DimPointOfInterestID
)
GO


ALTER TABLE Availability.FactUptimeplans
ADD CONSTRAINT uc_FactUptimeplans_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


--Add Foreign Keys...
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
@value=N'DimAvailabilityID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactUptimeplans',
@level2type=N'COLUMN',
@level2name=N'DimAvailabilityID';
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Availability',
@level1type=N'TABLE',
@level1name=N'FactUptimeplans',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
   DimOrganisationID INT,
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
ALTER TABLE Activity.FactVehicleActivityDetail
ADD CONSTRAINT uc_FactVehicleActivityDetail_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Activity.FactVehicleActivityDetail
ADD CONSTRAINT uc_FactVehicleActivityDetail_DimTimeID
UNIQUE
(
   DimTimeID
)
GO


ALTER TABLE Activity.FactVehicleActivityDetail
ADD CONSTRAINT uc_FactVehicleActivityDetail_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Activity.FactVehicleActivityDetail
ADD CONSTRAINT uc_FactVehicleActivityDetail_DimEventTypeID
UNIQUE
(
   DimEventTypeID
)
GO


ALTER TABLE Activity.FactVehicleActivityDetail
ADD CONSTRAINT uc_FactVehicleActivityDetail_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


--Add Foreign Keys...
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleActivityDetail',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
   DimOrganisationID INT,
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
ALTER TABLE Activity.FactVehicleTrip
ADD CONSTRAINT uc_FactVehicleTrip_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Activity.FactVehicleTrip
ADD CONSTRAINT uc_FactVehicleTrip_DimTimeID
UNIQUE
(
   DimTimeID
)
GO


ALTER TABLE Activity.FactVehicleTrip
ADD CONSTRAINT uc_FactVehicleTrip_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Activity.FactVehicleTrip
ADD CONSTRAINT uc_FactVehicleTrip_DimEventTypeID
UNIQUE
(
   DimEventTypeID
)
GO


ALTER TABLE Activity.FactVehicleTrip
ADD CONSTRAINT uc_FactVehicleTrip_DimLocationID
UNIQUE
(
   DimLocationID
)
GO


ALTER TABLE Activity.FactVehicleTrip
ADD CONSTRAINT uc_FactVehicleTrip_DimPayloadID
UNIQUE
(
   DimPayloadID
)
GO


ALTER TABLE Activity.FactVehicleTrip
ADD CONSTRAINT uc_FactVehicleTrip_DimSiteID
UNIQUE
(
   DimSiteID
)
GO


ALTER TABLE Activity.FactVehicleTrip
ADD CONSTRAINT uc_FactVehicleTrip_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


--Add Foreign Keys...
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactVehicleTrip',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
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
   DimOrganisationID INT,
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
ALTER TABLE Activity.FactXEquipmentActivityDetail
ADD CONSTRAINT uc_FactXEquipmentActivityDetail_DimDateID
UNIQUE
(
   DimDateID
)
GO


ALTER TABLE Activity.FactXEquipmentActivityDetail
ADD CONSTRAINT uc_FactXEquipmentActivityDetail_DimEquipmentID
UNIQUE
(
   DimEquipmentID
)
GO


ALTER TABLE Activity.FactXEquipmentActivityDetail
ADD CONSTRAINT uc_FactXEquipmentActivityDetail_DimLocationID
UNIQUE
(
   DimLocationID
)
GO


ALTER TABLE Activity.FactXEquipmentActivityDetail
ADD CONSTRAINT uc_FactXEquipmentActivityDetail_DimOrganisationID
UNIQUE
(
   DimOrganisationID
)
GO


--Add Foreign Keys...
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
@value=N'DimOrganisationID',
@level0type=N'SCHEMA',
@level0name=N'Activity',
@level1type=N'TABLE',
@level1name=N'FactXEquipmentActivityDetail',
@level2type=N'COLUMN',
@level2name=N'DimOrganisationID';
GO


DECLARE @sql AS NVARCHAR(200) = N'CREATE SCHEMA Activity';
IF SCHEMA_ID('Activity')IS NULL
EXEC sp_executesql @sql;
GO



