USE [SkiEDW_CTU];
 
-- Check if tables alreay exist and Delete them in the correct sequence --

IF EXISTS(SELECT * FROM sys.objects WHERE Name = 'Reports' AND SCHEMA_ID = schema_id('Balancing'))
BEGIN
	DROP TABLE Balancing.Reports
END
;

IF EXISTS(SELECT * FROM sys.objects WHERE Name = 'Tests' AND SCHEMA_ID = schema_id('Balancing'))
BEGIN
	DROP TABLE Balancing.Tests
END
;


IF EXISTS(SELECT * FROM sys.objects WHERE Name = 'Queries' AND SCHEMA_ID = schema_id('Balancing'))
BEGIN
	DROP TABLE Balancing.Queries
END
;


IF EXISTS(SELECT * FROM sys.objects WHERE Name = 'FunctionalAreas' AND SCHEMA_ID = schema_id('Balancing'))
BEGIN
	DROP TABLE Balancing.FunctionalAreas
END
;

IF EXISTS(SELECT * FROM sys.objects WHERE Name = 'DataSources' AND SCHEMA_ID = schema_id('Balancing'))
BEGIN
	DROP TABLE Balancing.DataSources
END
;

IF EXISTS(SELECT * FROM sys.objects WHERE Name = 'DataSourceTypes' AND SCHEMA_ID = schema_id('Balancing'))
BEGIN
	DROP TABLE Balancing.DataSourceTypes
END
;



-- Create all tables and constraints --
CREATE TABLE Balancing.DataSourceTypes
(
	DataSourceTypeId INT IDENTITY PRIMARY KEY,
	DataSourceTypeName VARCHAR(250) NOT NULL
)
;

CREATE TABLE Balancing.DataSources
(
	DataSourceId INT IDENTITY PRIMARY KEY,
	DataSourceTypeId INT NOT NULL CONSTRAINT FK_DataSourceTypeId FOREIGN KEY REFERENCES Balancing.DataSourceTypes(DataSourceTypeId),
	DataSourceName VARCHAR(250) NOT NULL,
	ConnectionString VARCHAR(500) NULL
)
;


CREATE TABLE Balancing.FunctionalAreas
(
	FunctionalAreaId INT IDENTITY PRIMARY KEY,
	FunctionalAreaName VARCHAR(300) NOT NULL
)
;


CREATE TABLE Balancing.Queries
(
	QueryId INT IDENTITY PRIMARY KEY,
	DataSourceId INT CONSTRAINT FK_DataSourceId FOREIGN KEY REFERENCES Balancing.DataSources(DataSourceId),
	QueryName VARCHAR(200),
	QueryText VARCHAR(max)
)
;


CREATE TABLE Balancing.Tests
(
	TestId INT IDENTITY PRIMARY KEY,
	QueryId INT CONSTRAINT FK_QueryId FOREIGN KEY REFERENCES Balancing.Queries(QueryId),
	ExpectedResult VARCHAR(max),
	ExpectedResultText VARCHAR(max)
)
;

CREATE TABLE Balancing.Reports
(
	ReportId INT IDENTITY PRIMARY KEY,
	FunctionalAreaId INT CONSTRAINT FK_FunctionalAreaId FOREIGN KEY REFERENCES Balancing.FunctionalAreas(FunctionalAreaId),
	TestId INT CONSTRAINT FK_TestId FOREIGN KEY REFERENCES Balancing.Tests(TestId),
	TestResult VARCHAR (300),
	TestDateTime DateTime DEFAULT GETDATE()
)
;

