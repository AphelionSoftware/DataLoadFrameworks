/****** Object:  Database Okavango    Script Date: 1/4/2014 5:35:28 PM ******/


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


