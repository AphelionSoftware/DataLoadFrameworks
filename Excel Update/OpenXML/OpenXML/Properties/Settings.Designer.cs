﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.34014
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OpenXML.Properties {
    
    
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "12.0.0.0")]
    internal sealed partial class Settings : global::System.Configuration.ApplicationSettingsBase {
        
        private static Settings defaultInstance = ((Settings)(global::System.Configuration.ApplicationSettingsBase.Synchronized(new Settings())));
        
        public static Settings Default {
            get {
                return defaultInstance;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("\r\nSELECT TOP 100 CAST([p].[PeopleReachedValuesID] AS NVARCHAR(MAX)),CAST([Activit" +
            "y].[BusinessKey] AS NVARCHAR(MAX)),CAST([AgeBand].[BusinessKey] AS NVARCHAR(MAX)" +
            "),CAST([CommunityType].[BusinessKey] AS NVARCHAR(MAX)),CAST([DataVersion].[Busin" +
            "essKey] AS NVARCHAR(MAX)),CAST([Donor].[BusinessKey] AS NVARCHAR(MAX)),CAST([Fra" +
            "mework].[BusinessKey] AS NVARCHAR(MAX)),CAST([FrameworkDetail_Indicator].[Busine" +
            "ssKey] AS NVARCHAR(MAX)),CAST([Gender].[BusinessKey] AS NVARCHAR(MAX)),CAST([Gro" +
            "up].[BusinessKey] AS NVARCHAR(MAX)),CAST([Institution].[BusinessKey] AS NVARCHAR" +
            "(MAX)),CAST([Location].[BusinessKey] AS NVARCHAR(MAX)),CAST([Outcome].[BusinessK" +
            "ey] AS NVARCHAR(MAX)),CAST([Output].[BusinessKey] AS NVARCHAR(MAX)),CAST([Progra" +
            "mme].[BusinessKey] AS NVARCHAR(MAX)),CAST([Project].[BusinessKey] AS NVARCHAR(MA" +
            "X)),CAST([ReportingPeriod].[BusinessKey] AS NVARCHAR(MAX)),CAST([ResultArea].[Bu" +
            "sinessKey] AS NVARCHAR(MAX)),CAST([Sector].[BusinessKey] AS NVARCHAR(MAX)),CAST(" +
            "[StatusType].[BusinessKey] AS NVARCHAR(MAX)),CAST([StrategicElement].[BusinessKe" +
            "y] AS NVARCHAR(MAX)),CAST([SubOutput].[BusinessKey] AS NVARCHAR(MAX)),CAST([SubS" +
            "ector].[BusinessKey] AS NVARCHAR(MAX)),CAST([p].[Notes] AS NVARCHAR(MAX)),CAST([" +
            "p].[NumberReached] AS NVARCHAR(MAX)) FROM  [RBM].[PeopleReachedValues] AS p LEFT" +
            " JOIN [app].[Activity] AS [Activity] ON [p].[Activity_ID] = [Activity].[Activity" +
            "_ID] LEFT JOIN [disagg].[AgeBand] AS [AgeBand] ON [p].[AgeBand_ID] = [AgeBand].[" +
            "AgeBand_ID] LEFT JOIN [disagg].[CommunityType] AS [CommunityType] ON [p].[Commun" +
            "ityType_ID] = [CommunityType].[CommunityType_ID] JOIN [Core].[DataVersion] AS [D" +
            "ataVersion] ON [p].[DataVersion_ID] = [DataVersion].[DataVersion_ID] LEFT JOIN [" +
            "disagg].[Donor] AS [Donor] ON [p].[Donor_ID] = [Donor].[Donor_ID] LEFT JOIN [dis" +
            "agg].[Framework] AS [Framework] ON [p].[Framework_ID] = [Framework].[Framework_I" +
            "D] LEFT JOIN [disagg].[FrameworkDetail_Indicator] AS [FrameworkDetail_Indicator]" +
            " ON [p].[FrameworkDetail_Indicator_ID] = [FrameworkDetail_Indicator].[FrameworkD" +
            "etail_Indicator_ID] LEFT JOIN [disagg].[Gender] AS [Gender] ON [p].[Gender_ID] =" +
            " [Gender].[Gender_ID] LEFT JOIN [disagg].[Group] AS [Group] ON [p].[Group_ID] = " +
            "[Group].[Group_ID] LEFT JOIN [disagg].[Institution] AS [Institution] ON [p].[Ins" +
            "titution_ID] = [Institution].[Institution_ID] JOIN [Core].[Location] AS [Locatio" +
            "n] ON [p].[Location_ID] = [Location].[Location_ID] LEFT JOIN [app].[Outcome] AS " +
            "[Outcome] ON [p].[Outcome_ID] = [Outcome].[Outcome_ID] LEFT JOIN [app].[Output] " +
            "AS [Output] ON [p].[Output_ID] = [Output].[Output_ID] LEFT JOIN [app].[Programme" +
            "] AS [Programme] ON [p].[Programme_ID] = [Programme].[Programme_ID] LEFT JOIN [a" +
            "pp].[Project] AS [Project] ON [p].[ProjectID] = [Project].[ProjectID] JOIN [Core" +
            "].[ReportingPeriod] AS [ReportingPeriod] ON [p].[ReportingPeriod_ID] = [Reportin" +
            "gPeriod].[ID] LEFT JOIN [disagg].[ResultArea] AS [ResultArea] ON [p].[ResultArea" +
            "_ID] = [ResultArea].[ResultArea_ID] LEFT JOIN [app].[Sector] AS [Sector] ON [p]." +
            "[Sector_ID] = [Sector].[Sector_ID] LEFT JOIN [Core].[StatusType] AS [StatusType]" +
            " ON [p].[StatusType_ID] = [StatusType].[ID] LEFT JOIN [disagg].[StrategicElement" +
            "] AS [StrategicElement] ON [p].[StrategicElement_ID] = [StrategicElement].[Strat" +
            "egicElement_ID] LEFT JOIN [app].[SubOutput] AS [SubOutput] ON [p].[SubOutput_ID]" +
            " = [SubOutput].[SubOutput_ID] LEFT JOIN [app].[SubSector] AS [SubSector] ON [p]." +
            "[SubSector_ID] = [SubSector].[SubSector_ID]\r\n")]
        public string txtSQL_Text {
            get {
                return ((string)(this["txtSQL_Text"]));
            }
            set {
                this["txtSQL_Text"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("Data Source=.\\sql2012;Initial Catalog=Meerkat;Integrated Security=True")]
        public string txtConn_Text {
            get {
                return ((string)(this["txtConn_Text"]));
            }
            set {
                this["txtConn_Text"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("Sheet1")]
        public string txtSheet_Text {
            get {
                return ((string)(this["txtSheet_Text"]));
            }
            set {
                this["txtSheet_Text"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("C:\\Dropbox (Data)\\Clients\\Meerkat\\CARE Somalia\\Data\\StagingTemplates\\Templates\\St" +
            "aging.Activity.xlsx")]
        public string txtFileLocation_Text {
            get {
                return ((string)(this["txtFileLocation_Text"]));
            }
            set {
                this["txtFileLocation_Text"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("SELECT * FROM [Sheet1$A2:XFD]")]
        public string txtExcel_Text {
            get {
                return ((string)(this["txtExcel_Text"]));
            }
            set {
                this["txtExcel_Text"] = value;
            }
        }
    }
}
