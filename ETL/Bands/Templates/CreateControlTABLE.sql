USE [MiXStaging]
GO
/****** Object:  Table [Control].[SSIS_Configurations]    Script Date: 2012/12/02 02:35:33 PM ******/
DROP TABLE [Control].[SSIS_Configurations]
GO
/****** Object:  Table [Control].[SSIS_Configurations]    Script Date: 2012/12/02 02:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Control].[SSIS_Configurations](
	[ConfigurationFilter] [nvarchar](255) NOT NULL,
	[ConfiguredValue] [nvarchar](255) NULL,
	[PackagePath] [nvarchar](255) NOT NULL,
	[ConfiguredValueType] [nvarchar](20) NOT NULL
) ON [ControlFG]

GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N' ', N'10.34.5.141', N'N/A, only for reporting configurations', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'SSISServerNames', N'DSSTBPSQL01', N'\Package.Variables[User::SSIS_Server].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'SSISServerNames', N'DSSTBPSQL01', N'\Package.Variables[User::SourceDBServer].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'SSISServerNames', N'DSSTBPSQL01', N'\Package.Variables[User::DWDBServer].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'SSISServerNames', N'DSSTBPSQL01', N'\Package.Variables[User::ControllerDBServer].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'SSISServerNames', N'DSSTBPSQL01', N'\Package.Variables[User::StagingDBServer].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'SSISServerNames', N'rtcptmsx01.domain.local', N'\Package.Variables[User::EmailServer].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'SSISServerNames', N'otto.langenegger@mixtelematics.com;stefan.smeda@mixtelematics.com', N'\Package.Variables[User::EmailTo].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'SSISServerNames', N'C', N'\Package.Variables[User::DriveSpaceDriveLetters].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'SSISServerNames', N'27832297407', N'\Package.Variables[User::SMSNotificationList].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'PPServer', N'DSSTBPSQL02\SQL2012Tabular', N'\Package.Variables[User::PPServer].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'PPBackupFolder', N'S:\OLAP\Backup\MiX.abf', N'\Package.Variables[User::PPBackupFolder].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'PPBackupUNC', N'\\DSSTBPSQL02\Backup\MiX.abf', N'\Package.Variables[User::PPBackupUNC].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'PPDestination', N'C:\MixFiles\PowerPivotExports\MixTelDestination', N'\Package.Variables[User::PPDestination].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'PPTemplate', N'C:\MixFiles\PowerPivotExports\MixTelTemplate.xlsx', N'\Package.Variables[User::PPTemplate].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'Staging', N'WarehouseReports', N'\Package.Variables[User::WarehouseReportsUser].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'Staging', N'4rcn7ynhdfuncvw78oq776!', N'\Package.Variables[User::WarehouseReportsPassword].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'DWDB', N'WarehouseMaintenance
', N'\Package.Variables[User::DWDBUser].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'DWDB', N'DSSTBPSQL01', N'\Package.Variables[User::DWDBServer].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'DWDB', N'0´q{­z0i>éï20ÂùF0ïa3°LaêmsFT7_&#$!~<ooToooao4
', N'\Package.Variables[User::DWDBPassword].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'DWDB', N'MiXData_TestCube', N'\Package.Variables[User::DWDBCatalog].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'Email', N'otto.langenegger@mixtelematics.com;', N'\Package.Variables[User::EmailTo].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'Email', N'', N'\Package.Variables[User::emailText].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'Email', N'rtcptmsx01.domain.local', N'\Package.Variables[User::EmailServer].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'Email', N'no_reply@mixtelematics.com', N'\Package.Variables[User::EmailFrom].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'Staging', N'WarehouseExtract', N'\Package.Variables[User::StagingDBUser].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'Staging', N'DSSTBPSQL01', N'\Package.Variables[User::StagingDBServer].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'Staging', N'õ^³§Ðç¯£ÑÁÄÿ§õæóX#è¬msFT7_&#$!~<¸¢Â¤{À2', N'\Package.Variables[User::StagingDBPwd].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'Staging', N'MiXStaging', N'\Package.Variables[User::StagingDBCatalog].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'DestinationFileFolder', N's:\MixFiles', N'\Package.Variables[User::DestinationFileFolder].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'SourceFileFolder', N's:\MixLandingZone', N'\Package.Variables[User::SourceFileFolder].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'PackageExecutionSettings', N'\WarehousePackages\MiXCubes', N'\Package.Variables[User::MSDBFolder].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'PackageExecutionSettings', N'C:\Work\DeployCubePakages\SSIS Packages\PW.Mix.Cubes ETL', N'\Package.Variables[User::ExecutePackageFolder].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'PackageExecutionSettings', N'False', N'\Package.Variables[User::boolExecuteFromMSDB].Properties[Value]', N'Boolean')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'MixControllerServerDetails', N'WarehouseMaintenance', N'\Package.Variables[User::MixControllerDBUser].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'MixControllerServerDetails', N'0´q{­z0i>éï20ÂùF0ïa3°LaêmsFT7_&#$!~<ooToooao4', N'\Package.Variables[User::MixControllerDBPwd].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'MixControllerServerDetails', N'MixAggregator', N'\Package.Variables[User::MixControllerDBCatalog].Properties[Value]', N'String')
GO
INSERT [Control].[SSIS_Configurations] ([ConfigurationFilter], [ConfiguredValue], [PackagePath], [ConfiguredValueType]) VALUES (N'MixControllerServerDetails', N'DSSTBPSQL01', N'\Package.Variables[User::MixControllerDBServer].Properties[Value]', N'String')
GO
