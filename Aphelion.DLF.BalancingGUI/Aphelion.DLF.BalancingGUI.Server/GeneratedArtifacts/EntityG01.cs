﻿

//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LightSwitchApplication
{
    #region Entities
    
    /// <summary>
    /// No Modeled Description Available
    /// </summary>
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
    public sealed partial class DataSource : global::Microsoft.LightSwitch.Framework.Base.EntityObject<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass>
    {
        #region Constructors
    
        /// <summary>
        /// Initializes a new instance of the DataSource entity.
        /// </summary>
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public DataSource()
            : this(null)
        {
        }
    
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public DataSource(global::Microsoft.LightSwitch.Framework.EntitySet<global::LightSwitchApplication.DataSource> entitySet)
            : base(entitySet)
        {
            global::LightSwitchApplication.DataSource.DetailsClass.Initialize(this);
        }
    
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void DataSource_Created();
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void DataSource_AllowSaveWithErrors(ref bool result);
    
        #endregion
    
        #region Private Properties
        
        /// <summary>
        /// Gets the Application object for this application.  The Application object provides access to active screens, methods to open screens and access to the current user.
        /// </summary>
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        private global::Microsoft.LightSwitch.IApplication<global::LightSwitchApplication.DataWorkspace> Application
        {
            get
            {
                return (global::Microsoft.LightSwitch.IApplication<global::LightSwitchApplication.DataWorkspace>)global::LightSwitchApplication.Application.Current;
            }
        }
        
        /// <summary>
        /// Gets the containing data workspace.  The data workspace provides access to all data sources in the application.
        /// </summary>
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        private global::LightSwitchApplication.DataWorkspace DataWorkspace
        {
            get
            {
                return (global::LightSwitchApplication.DataWorkspace)this.Details.EntitySet.Details.DataService.Details.DataWorkspace;
            }
        }
        
        #endregion
    
        #region Public Properties
    
        /// <summary>
        /// No Modeled Description Available
        /// </summary>
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public int DataSourceID
        {
            get
            {
                return global::LightSwitchApplication.DataSource.DetailsClass.GetValue(this, global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.DataSourceID);
            }
        }
        
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void DataSourceID_IsReadOnly(ref bool result);
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void DataSourceID_Validate(global::Microsoft.LightSwitch.EntityValidationResultsBuilder results);
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void DataSourceID_Changed();

        /// <summary>
        /// No Modeled Description Available
        /// </summary>
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public string DataSourceName
        {
            get
            {
                return global::LightSwitchApplication.DataSource.DetailsClass.GetValue(this, global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.DataSourceName);
            }
            set
            {
                global::LightSwitchApplication.DataSource.DetailsClass.SetValue(this, global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.DataSourceName, value);
            }
        }
        
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void DataSourceName_IsReadOnly(ref bool result);
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void DataSourceName_Validate(global::Microsoft.LightSwitch.EntityValidationResultsBuilder results);
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void DataSourceName_Changed();

        /// <summary>
        /// No Modeled Description Available
        /// </summary>
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public string ConnectionString
        {
            get
            {
                return global::LightSwitchApplication.DataSource.DetailsClass.GetValue(this, global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.ConnectionString);
            }
            set
            {
                global::LightSwitchApplication.DataSource.DetailsClass.SetValue(this, global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.ConnectionString, value);
            }
        }
        
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void ConnectionString_IsReadOnly(ref bool result);
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void ConnectionString_Validate(global::Microsoft.LightSwitch.EntityValidationResultsBuilder results);
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void ConnectionString_Changed();

        /// <summary>
        /// No Modeled Description Available
        /// </summary>
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public global::LightSwitchApplication.DataSourceType DataSourceType
        {
            get
            {
                return global::LightSwitchApplication.DataSource.DetailsClass.GetValue(this, global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.DataSourceType);
            }
            set
            {
                global::LightSwitchApplication.DataSource.DetailsClass.SetValue(this, global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.DataSourceType, value);
            }
        }
        
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void DataSourceType_IsReadOnly(ref bool result);
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void DataSourceType_Validate(global::Microsoft.LightSwitch.EntityValidationResultsBuilder results);
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void DataSourceType_Changed();

        /// <summary>
        /// No Modeled Description Available
        /// </summary>
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public global::Microsoft.LightSwitch.Framework.EntityCollection<global::LightSwitchApplication.Query> Queries
        {
            get
            {
                return global::LightSwitchApplication.DataSource.DetailsClass.GetValue(this, global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.Queries);
            }
        }
        
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public Microsoft.LightSwitch.IDataServiceQueryable<global::LightSwitchApplication.Query> QueriesQuery
        {
            get
            {
                return global::LightSwitchApplication.DataSource.DetailsClass.GetQuery(this, global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.Queries);
            }
        }

        #endregion
    
        #region Details Class
    
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
        [global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1034:NestedTypesShouldNotBeVisible")]
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public sealed class DetailsClass : global::Microsoft.LightSwitch.Details.Framework.Base.EntityDetails<
                global::LightSwitchApplication.DataSource,
                global::LightSwitchApplication.DataSource.DetailsClass,
                global::LightSwitchApplication.DataSource.DetailsClass.IImplementation,
                global::LightSwitchApplication.DataSource.DetailsClass.PropertySet,
                global::Microsoft.LightSwitch.Details.Framework.EntityCommandSet<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass>,
                global::Microsoft.LightSwitch.Details.Framework.EntityMethodSet<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass>>
        {
    
            static DetailsClass()
            {
                var initializeEntry = global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.DataSourceID;
            }
    
            [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
            private static readonly global::Microsoft.LightSwitch.Details.Framework.Base.EntityDetails<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass>.Entry
                __DataSourceEntry = new global::Microsoft.LightSwitch.Details.Framework.Base.EntityDetails<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass>.Entry(
                    global::LightSwitchApplication.DataSource.DetailsClass.__DataSource_CreateNew,
                    global::LightSwitchApplication.DataSource.DetailsClass.__DataSource_Created,
                    global::LightSwitchApplication.DataSource.DetailsClass.__DataSource_AllowSaveWithErrors);
            private static global::LightSwitchApplication.DataSource __DataSource_CreateNew(global::Microsoft.LightSwitch.Framework.EntitySet<global::LightSwitchApplication.DataSource> es)
            {
                return new global::LightSwitchApplication.DataSource(es);
            }
            private static void __DataSource_Created(global::LightSwitchApplication.DataSource e)
            {
                e.DataSource_Created();
            }
            private static bool __DataSource_AllowSaveWithErrors(global::LightSwitchApplication.DataSource e)
            {
                bool result = false;
                e.DataSource_AllowSaveWithErrors(ref result);
                return result;
            }
    
            public DetailsClass() : base()
            {
            }
    
            public new global::Microsoft.LightSwitch.Details.Framework.EntityCommandSet<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass> Commands
            {
                get
                {
                    return base.Commands;
                }
            }
    
            public new global::Microsoft.LightSwitch.Details.Framework.EntityMethodSet<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass> Methods
            {
                get
                {
                    return base.Methods;
                }
            }
    
            public new global::LightSwitchApplication.DataSource.DetailsClass.PropertySet Properties
            {
                get
                {
                    return base.Properties;
                }
            }
    
            [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
            [global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1034:NestedTypesShouldNotBeVisible")]
            [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
            [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
            public sealed class PropertySet : global::Microsoft.LightSwitch.Details.Framework.Base.EntityPropertySet<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass>
            {
    
                public PropertySet() : base()
                {
                }
    
                public global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, int> DataSourceID
                {
                    get
                    {
                        return base.GetItem(global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.DataSourceID) as global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, int>;
                    }
                }
                
                public global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, string> DataSourceName
                {
                    get
                    {
                        return base.GetItem(global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.DataSourceName) as global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, string>;
                    }
                }
                
                public global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, string> ConnectionString
                {
                    get
                    {
                        return base.GetItem(global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.ConnectionString) as global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, string>;
                    }
                }
                
                public global::Microsoft.LightSwitch.Details.Framework.EntityReferenceProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, global::LightSwitchApplication.DataSourceType> DataSourceType
                {
                    get
                    {
                        return base.GetItem(global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.DataSourceType) as global::Microsoft.LightSwitch.Details.Framework.EntityReferenceProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, global::LightSwitchApplication.DataSourceType>;
                    }
                }
                
                public global::Microsoft.LightSwitch.Details.Framework.EntityCollectionProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, global::LightSwitchApplication.Query> Queries
                {
                    get
                    {
                        return base.GetItem(global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.Queries) as global::Microsoft.LightSwitch.Details.Framework.EntityCollectionProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, global::LightSwitchApplication.Query>;
                    }
                }
                
            }
    
            #pragma warning disable 109
            [global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1034:NestedTypesShouldNotBeVisible")]
            public interface IImplementation : global::Microsoft.LightSwitch.Internal.IEntityImplementation
            {
                new int DataSourceID { get; }
                new string DataSourceName { get; set; }
                new string ConnectionString { get; set; }
                new global::Microsoft.LightSwitch.Internal.IEntityImplementation DataSourceType { get; set; }
                new global::System.Collections.IEnumerable Queries { get; }
            }
            #pragma warning restore 109
    
            [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
            [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
            [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
            internal class PropertySetProperties
            {
    
                [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
                public static readonly global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, int>.Entry
                    DataSourceID = new global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, int>.Entry(
                        "DataSourceID",
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceID_Stub,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceID_ComputeIsReadOnly,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceID_Validate,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceID_GetImplementationValue,
                        null,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceID_OnValueChanged);
                private static void _DataSourceID_Stub(global::Microsoft.LightSwitch.Details.Framework.Base.DetailsCallback<global::LightSwitchApplication.DataSource.DetailsClass, global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, int>.Data> c, global::LightSwitchApplication.DataSource.DetailsClass d, object sf)
                {
                    c(d, ref d._DataSourceID, sf);
                }
                private static bool _DataSourceID_ComputeIsReadOnly(global::LightSwitchApplication.DataSource e)
                {
                    bool result = false;
                    e.DataSourceID_IsReadOnly(ref result);
                    return result;
                }
                private static void _DataSourceID_Validate(global::LightSwitchApplication.DataSource e, global::Microsoft.LightSwitch.EntityValidationResultsBuilder r)
                {
                    e.DataSourceID_Validate(r);
                }
                private static int _DataSourceID_GetImplementationValue(global::LightSwitchApplication.DataSource.DetailsClass d)
                {
                    return d.ImplementationEntity.DataSourceID;
                }
                private static void _DataSourceID_OnValueChanged(global::LightSwitchApplication.DataSource e)
                {
                    e.DataSourceID_Changed();
                }
    
                [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
                public static readonly global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, string>.Entry
                    DataSourceName = new global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, string>.Entry(
                        "DataSourceName",
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceName_Stub,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceName_ComputeIsReadOnly,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceName_Validate,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceName_GetImplementationValue,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceName_SetImplementationValue,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceName_OnValueChanged);
                private static void _DataSourceName_Stub(global::Microsoft.LightSwitch.Details.Framework.Base.DetailsCallback<global::LightSwitchApplication.DataSource.DetailsClass, global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, string>.Data> c, global::LightSwitchApplication.DataSource.DetailsClass d, object sf)
                {
                    c(d, ref d._DataSourceName, sf);
                }
                private static bool _DataSourceName_ComputeIsReadOnly(global::LightSwitchApplication.DataSource e)
                {
                    bool result = false;
                    e.DataSourceName_IsReadOnly(ref result);
                    return result;
                }
                private static void _DataSourceName_Validate(global::LightSwitchApplication.DataSource e, global::Microsoft.LightSwitch.EntityValidationResultsBuilder r)
                {
                    e.DataSourceName_Validate(r);
                }
                private static string _DataSourceName_GetImplementationValue(global::LightSwitchApplication.DataSource.DetailsClass d)
                {
                    return d.ImplementationEntity.DataSourceName;
                }
                private static void _DataSourceName_SetImplementationValue(global::LightSwitchApplication.DataSource.DetailsClass d, string v)
                {
                    d.ImplementationEntity.DataSourceName = v;
                }
                private static void _DataSourceName_OnValueChanged(global::LightSwitchApplication.DataSource e)
                {
                    e.DataSourceName_Changed();
                }
    
                [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
                public static readonly global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, string>.Entry
                    ConnectionString = new global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, string>.Entry(
                        "ConnectionString",
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._ConnectionString_Stub,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._ConnectionString_ComputeIsReadOnly,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._ConnectionString_Validate,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._ConnectionString_GetImplementationValue,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._ConnectionString_SetImplementationValue,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._ConnectionString_OnValueChanged);
                private static void _ConnectionString_Stub(global::Microsoft.LightSwitch.Details.Framework.Base.DetailsCallback<global::LightSwitchApplication.DataSource.DetailsClass, global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, string>.Data> c, global::LightSwitchApplication.DataSource.DetailsClass d, object sf)
                {
                    c(d, ref d._ConnectionString, sf);
                }
                private static bool _ConnectionString_ComputeIsReadOnly(global::LightSwitchApplication.DataSource e)
                {
                    bool result = false;
                    e.ConnectionString_IsReadOnly(ref result);
                    return result;
                }
                private static void _ConnectionString_Validate(global::LightSwitchApplication.DataSource e, global::Microsoft.LightSwitch.EntityValidationResultsBuilder r)
                {
                    e.ConnectionString_Validate(r);
                }
                private static string _ConnectionString_GetImplementationValue(global::LightSwitchApplication.DataSource.DetailsClass d)
                {
                    return d.ImplementationEntity.ConnectionString;
                }
                private static void _ConnectionString_SetImplementationValue(global::LightSwitchApplication.DataSource.DetailsClass d, string v)
                {
                    d.ImplementationEntity.ConnectionString = v;
                }
                private static void _ConnectionString_OnValueChanged(global::LightSwitchApplication.DataSource e)
                {
                    e.ConnectionString_Changed();
                }
    
                [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
                public static readonly global::Microsoft.LightSwitch.Details.Framework.EntityReferenceProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, global::LightSwitchApplication.DataSourceType>.Entry
                    DataSourceType = new global::Microsoft.LightSwitch.Details.Framework.EntityReferenceProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, global::LightSwitchApplication.DataSourceType>.Entry(
                        "DataSourceType",
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceType_Stub,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceType_ComputeIsReadOnly,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceType_Validate,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceType_GetCoreImplementationValue,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceType_GetImplementationValue,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceType_SetImplementationValue,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceType_Refresh,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._DataSourceType_OnValueChanged);
                private static void _DataSourceType_Stub(global::Microsoft.LightSwitch.Details.Framework.Base.DetailsCallback<global::LightSwitchApplication.DataSource.DetailsClass, global::Microsoft.LightSwitch.Details.Framework.EntityReferenceProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, global::LightSwitchApplication.DataSourceType>.Data> c, global::LightSwitchApplication.DataSource.DetailsClass d, object sf)
                {
                    c(d, ref d._DataSourceType, sf);
                }
                private static bool _DataSourceType_ComputeIsReadOnly(global::LightSwitchApplication.DataSource e)
                {
                    bool result = false;
                    e.DataSourceType_IsReadOnly(ref result);
                    return result;
                }
                private static void _DataSourceType_Validate(global::LightSwitchApplication.DataSource e, global::Microsoft.LightSwitch.EntityValidationResultsBuilder r)
                {
                    e.DataSourceType_Validate(r);
                }
                private static global::Microsoft.LightSwitch.Internal.IEntityImplementation _DataSourceType_GetCoreImplementationValue(global::LightSwitchApplication.DataSource.DetailsClass d)
                {
                    return d.ImplementationEntity.DataSourceType;
                }
                private static global::LightSwitchApplication.DataSourceType _DataSourceType_GetImplementationValue(global::LightSwitchApplication.DataSource.DetailsClass d)
                {
                    return d.GetImplementationValue<global::LightSwitchApplication.DataSourceType, global::LightSwitchApplication.DataSourceType.DetailsClass>(global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.DataSourceType, ref d._DataSourceType);
                }
                private static void _DataSourceType_SetImplementationValue(global::LightSwitchApplication.DataSource.DetailsClass d, global::LightSwitchApplication.DataSourceType v)
                {
                    d.SetImplementationValue(global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.DataSourceType, ref d._DataSourceType, (i, ev) => i.DataSourceType = ev, v);
                }
                private static void _DataSourceType_Refresh(global::LightSwitchApplication.DataSource.DetailsClass d)
                {
                    d.RefreshNavigationProperty(global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.DataSourceType, ref d._DataSourceType);
                }
                private static void _DataSourceType_OnValueChanged(global::LightSwitchApplication.DataSource e)
                {
                    e.DataSourceType_Changed();
                }
    
                [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
                public static readonly global::Microsoft.LightSwitch.Details.Framework.EntityCollectionProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, global::LightSwitchApplication.Query>.Entry
                    Queries = new global::Microsoft.LightSwitch.Details.Framework.EntityCollectionProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, global::LightSwitchApplication.Query>.Entry(
                        "Queries",
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._Queries_Stub,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._Queries_GetReferencedEntities,
                        global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties._Queries_GetEntityCollection);
                private static void _Queries_Stub(global::Microsoft.LightSwitch.Details.Framework.Base.DetailsCallback<global::LightSwitchApplication.DataSource.DetailsClass, global::Microsoft.LightSwitch.Details.Framework.EntityCollectionProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, global::LightSwitchApplication.Query>.Data> c, global::LightSwitchApplication.DataSource.DetailsClass d, object sf)
                {
                    c(d, ref d._Queries, sf);
                }
                private static global::System.Collections.Generic.IEnumerable<global::LightSwitchApplication.Query> _Queries_GetReferencedEntities(global::LightSwitchApplication.DataSource.DetailsClass d)
                {
                    return d.GetReferencedEntities<global::LightSwitchApplication.Query, global::LightSwitchApplication.Query.DetailsClass>(global::LightSwitchApplication.DataSource.DetailsClass.PropertySetProperties.Queries, ref d._Queries);
                }
                private static global::System.Collections.IEnumerable _Queries_GetEntityCollection(global::LightSwitchApplication.DataSource.DetailsClass d)
                {
                    return d.ImplementationEntity.Queries;
                }
    
            }
    
            [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
            private global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, int>.Data _DataSourceID;
            
            [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
            private global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, string>.Data _DataSourceName;
            
            [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
            private global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, string>.Data _ConnectionString;
            
            [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
            private global::Microsoft.LightSwitch.Details.Framework.EntityReferenceProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, global::LightSwitchApplication.DataSourceType>.Data _DataSourceType;
            
            [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
            private global::Microsoft.LightSwitch.Details.Framework.EntityCollectionProperty<global::LightSwitchApplication.DataSource, global::LightSwitchApplication.DataSource.DetailsClass, global::LightSwitchApplication.Query>.Data _Queries;
            
        }
    
        #endregion
    }
    
    #endregion
}
