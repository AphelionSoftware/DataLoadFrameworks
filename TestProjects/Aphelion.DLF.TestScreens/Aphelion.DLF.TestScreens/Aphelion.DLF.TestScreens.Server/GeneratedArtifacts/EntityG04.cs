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
    public sealed partial class RunStep : global::Microsoft.LightSwitch.Framework.Base.EntityObject<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass>
    {
        #region Constructors
    
        /// <summary>
        /// Initializes a new instance of the RunStep entity.
        /// </summary>
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public RunStep()
            : this(null)
        {
        }
    
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public RunStep(global::Microsoft.LightSwitch.Framework.EntitySet<global::LightSwitchApplication.RunStep> entitySet)
            : base(entitySet)
        {
            global::LightSwitchApplication.RunStep.DetailsClass.Initialize(this);
        }
    
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void RunStep_Created();
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void RunStep_AllowSaveWithErrors(ref bool result);
    
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
        public int RunStepID
        {
            get
            {
                return global::LightSwitchApplication.RunStep.DetailsClass.GetValue(this, global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties.RunStepID);
            }
        }
        
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void RunStepID_IsReadOnly(ref bool result);
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void RunStepID_Validate(global::Microsoft.LightSwitch.EntityValidationResultsBuilder results);
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void RunStepID_Changed();

        /// <summary>
        /// No Modeled Description Available
        /// </summary>
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public global::System.Nullable<global::System.DateTime> RunStepStartTime
        {
            get
            {
                return global::LightSwitchApplication.RunStep.DetailsClass.GetValue(this, global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties.RunStepStartTime);
            }
            set
            {
                global::LightSwitchApplication.RunStep.DetailsClass.SetValue(this, global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties.RunStepStartTime, value);
            }
        }
        
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void RunStepStartTime_IsReadOnly(ref bool result);
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void RunStepStartTime_Validate(global::Microsoft.LightSwitch.EntityValidationResultsBuilder results);
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void RunStepStartTime_Changed();

        /// <summary>
        /// No Modeled Description Available
        /// </summary>
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public global::System.Nullable<global::System.DateTime> RunStepEndTime
        {
            get
            {
                return global::LightSwitchApplication.RunStep.DetailsClass.GetValue(this, global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties.RunStepEndTime);
            }
            set
            {
                global::LightSwitchApplication.RunStep.DetailsClass.SetValue(this, global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties.RunStepEndTime, value);
            }
        }
        
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void RunStepEndTime_IsReadOnly(ref bool result);
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void RunStepEndTime_Validate(global::Microsoft.LightSwitch.EntityValidationResultsBuilder results);
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void RunStepEndTime_Changed();

        /// <summary>
        /// No Modeled Description Available
        /// </summary>
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public global::System.Nullable<int> RunStepTime
        {
            get
            {
                return global::LightSwitchApplication.RunStep.DetailsClass.GetValue(this, global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties.RunStepTime);
            }
        }
        
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void RunStepTime_IsReadOnly(ref bool result);
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void RunStepTime_Validate(global::Microsoft.LightSwitch.EntityValidationResultsBuilder results);
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void RunStepTime_Changed();

        /// <summary>
        /// No Modeled Description Available
        /// </summary>
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public global::LightSwitchApplication.TestStep TestStep
        {
            get
            {
                return global::LightSwitchApplication.RunStep.DetailsClass.GetValue(this, global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties.TestStep);
            }
            set
            {
                global::LightSwitchApplication.RunStep.DetailsClass.SetValue(this, global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties.TestStep, value);
            }
        }
        
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void TestStep_IsReadOnly(ref bool result);
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void TestStep_Validate(global::Microsoft.LightSwitch.EntityValidationResultsBuilder results);
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        partial void TestStep_Changed();

        #endregion
    
        #region Details Class
    
        [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
        [global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1034:NestedTypesShouldNotBeVisible")]
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public sealed class DetailsClass : global::Microsoft.LightSwitch.Details.Framework.Base.EntityDetails<
                global::LightSwitchApplication.RunStep,
                global::LightSwitchApplication.RunStep.DetailsClass,
                global::LightSwitchApplication.RunStep.DetailsClass.IImplementation,
                global::LightSwitchApplication.RunStep.DetailsClass.PropertySet,
                global::Microsoft.LightSwitch.Details.Framework.EntityCommandSet<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass>,
                global::Microsoft.LightSwitch.Details.Framework.EntityMethodSet<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass>>
        {
    
            static DetailsClass()
            {
                var initializeEntry = global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties.RunStepID;
            }
    
            [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
            private static readonly global::Microsoft.LightSwitch.Details.Framework.Base.EntityDetails<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass>.Entry
                __RunStepEntry = new global::Microsoft.LightSwitch.Details.Framework.Base.EntityDetails<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass>.Entry(
                    global::LightSwitchApplication.RunStep.DetailsClass.__RunStep_CreateNew,
                    global::LightSwitchApplication.RunStep.DetailsClass.__RunStep_Created,
                    global::LightSwitchApplication.RunStep.DetailsClass.__RunStep_AllowSaveWithErrors);
            private static global::LightSwitchApplication.RunStep __RunStep_CreateNew(global::Microsoft.LightSwitch.Framework.EntitySet<global::LightSwitchApplication.RunStep> es)
            {
                return new global::LightSwitchApplication.RunStep(es);
            }
            private static void __RunStep_Created(global::LightSwitchApplication.RunStep e)
            {
                e.RunStep_Created();
            }
            private static bool __RunStep_AllowSaveWithErrors(global::LightSwitchApplication.RunStep e)
            {
                bool result = false;
                e.RunStep_AllowSaveWithErrors(ref result);
                return result;
            }
    
            public DetailsClass() : base()
            {
            }
    
            public new global::Microsoft.LightSwitch.Details.Framework.EntityCommandSet<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass> Commands
            {
                get
                {
                    return base.Commands;
                }
            }
    
            public new global::Microsoft.LightSwitch.Details.Framework.EntityMethodSet<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass> Methods
            {
                get
                {
                    return base.Methods;
                }
            }
    
            public new global::LightSwitchApplication.RunStep.DetailsClass.PropertySet Properties
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
            public sealed class PropertySet : global::Microsoft.LightSwitch.Details.Framework.Base.EntityPropertySet<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass>
            {
    
                public PropertySet() : base()
                {
                }
    
                public global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, int> RunStepID
                {
                    get
                    {
                        return base.GetItem(global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties.RunStepID) as global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, int>;
                    }
                }
                
                public global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::System.Nullable<global::System.DateTime>> RunStepStartTime
                {
                    get
                    {
                        return base.GetItem(global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties.RunStepStartTime) as global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::System.Nullable<global::System.DateTime>>;
                    }
                }
                
                public global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::System.Nullable<global::System.DateTime>> RunStepEndTime
                {
                    get
                    {
                        return base.GetItem(global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties.RunStepEndTime) as global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::System.Nullable<global::System.DateTime>>;
                    }
                }
                
                public global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::System.Nullable<int>> RunStepTime
                {
                    get
                    {
                        return base.GetItem(global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties.RunStepTime) as global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::System.Nullable<int>>;
                    }
                }
                
                public global::Microsoft.LightSwitch.Details.Framework.EntityReferenceProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::LightSwitchApplication.TestStep> TestStep
                {
                    get
                    {
                        return base.GetItem(global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties.TestStep) as global::Microsoft.LightSwitch.Details.Framework.EntityReferenceProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::LightSwitchApplication.TestStep>;
                    }
                }
                
            }
    
            #pragma warning disable 109
            [global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1034:NestedTypesShouldNotBeVisible")]
            public interface IImplementation : global::Microsoft.LightSwitch.Internal.IEntityImplementation
            {
                new int RunStepID { get; }
                new global::System.Nullable<global::System.DateTime> RunStepStartTime { get; set; }
                new global::System.Nullable<global::System.DateTime> RunStepEndTime { get; set; }
                new global::System.Nullable<int> RunStepTime { get; }
                new global::Microsoft.LightSwitch.Internal.IEntityImplementation TestStep { get; set; }
            }
            #pragma warning restore 109
    
            [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
            [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.LightSwitch.BuildTasks.CodeGen", "12.0.0.0")]
            [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
            internal class PropertySetProperties
            {
    
                [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
                public static readonly global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, int>.Entry
                    RunStepID = new global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, int>.Entry(
                        "RunStepID",
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepID_Stub,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepID_ComputeIsReadOnly,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepID_Validate,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepID_GetImplementationValue,
                        null,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepID_OnValueChanged);
                private static void _RunStepID_Stub(global::Microsoft.LightSwitch.Details.Framework.Base.DetailsCallback<global::LightSwitchApplication.RunStep.DetailsClass, global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, int>.Data> c, global::LightSwitchApplication.RunStep.DetailsClass d, object sf)
                {
                    c(d, ref d._RunStepID, sf);
                }
                private static bool _RunStepID_ComputeIsReadOnly(global::LightSwitchApplication.RunStep e)
                {
                    bool result = false;
                    e.RunStepID_IsReadOnly(ref result);
                    return result;
                }
                private static void _RunStepID_Validate(global::LightSwitchApplication.RunStep e, global::Microsoft.LightSwitch.EntityValidationResultsBuilder r)
                {
                    e.RunStepID_Validate(r);
                }
                private static int _RunStepID_GetImplementationValue(global::LightSwitchApplication.RunStep.DetailsClass d)
                {
                    return d.ImplementationEntity.RunStepID;
                }
                private static void _RunStepID_OnValueChanged(global::LightSwitchApplication.RunStep e)
                {
                    e.RunStepID_Changed();
                }
    
                [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
                public static readonly global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::System.Nullable<global::System.DateTime>>.Entry
                    RunStepStartTime = new global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::System.Nullable<global::System.DateTime>>.Entry(
                        "RunStepStartTime",
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepStartTime_Stub,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepStartTime_ComputeIsReadOnly,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepStartTime_Validate,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepStartTime_GetImplementationValue,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepStartTime_SetImplementationValue,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepStartTime_OnValueChanged);
                private static void _RunStepStartTime_Stub(global::Microsoft.LightSwitch.Details.Framework.Base.DetailsCallback<global::LightSwitchApplication.RunStep.DetailsClass, global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::System.Nullable<global::System.DateTime>>.Data> c, global::LightSwitchApplication.RunStep.DetailsClass d, object sf)
                {
                    c(d, ref d._RunStepStartTime, sf);
                }
                private static bool _RunStepStartTime_ComputeIsReadOnly(global::LightSwitchApplication.RunStep e)
                {
                    bool result = false;
                    e.RunStepStartTime_IsReadOnly(ref result);
                    return result;
                }
                private static void _RunStepStartTime_Validate(global::LightSwitchApplication.RunStep e, global::Microsoft.LightSwitch.EntityValidationResultsBuilder r)
                {
                    e.RunStepStartTime_Validate(r);
                }
                private static global::System.Nullable<global::System.DateTime> _RunStepStartTime_GetImplementationValue(global::LightSwitchApplication.RunStep.DetailsClass d)
                {
                    return d.ImplementationEntity.RunStepStartTime;
                }
                private static void _RunStepStartTime_SetImplementationValue(global::LightSwitchApplication.RunStep.DetailsClass d, global::System.Nullable<global::System.DateTime> v)
                {
                    d.ImplementationEntity.RunStepStartTime = global::LightSwitchApplication.RunStep.DetailsClass.ClearDateTimeKind(v);
                }
                private static void _RunStepStartTime_OnValueChanged(global::LightSwitchApplication.RunStep e)
                {
                    e.RunStepStartTime_Changed();
                }
    
                [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
                public static readonly global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::System.Nullable<global::System.DateTime>>.Entry
                    RunStepEndTime = new global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::System.Nullable<global::System.DateTime>>.Entry(
                        "RunStepEndTime",
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepEndTime_Stub,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepEndTime_ComputeIsReadOnly,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepEndTime_Validate,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepEndTime_GetImplementationValue,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepEndTime_SetImplementationValue,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepEndTime_OnValueChanged);
                private static void _RunStepEndTime_Stub(global::Microsoft.LightSwitch.Details.Framework.Base.DetailsCallback<global::LightSwitchApplication.RunStep.DetailsClass, global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::System.Nullable<global::System.DateTime>>.Data> c, global::LightSwitchApplication.RunStep.DetailsClass d, object sf)
                {
                    c(d, ref d._RunStepEndTime, sf);
                }
                private static bool _RunStepEndTime_ComputeIsReadOnly(global::LightSwitchApplication.RunStep e)
                {
                    bool result = false;
                    e.RunStepEndTime_IsReadOnly(ref result);
                    return result;
                }
                private static void _RunStepEndTime_Validate(global::LightSwitchApplication.RunStep e, global::Microsoft.LightSwitch.EntityValidationResultsBuilder r)
                {
                    e.RunStepEndTime_Validate(r);
                }
                private static global::System.Nullable<global::System.DateTime> _RunStepEndTime_GetImplementationValue(global::LightSwitchApplication.RunStep.DetailsClass d)
                {
                    return d.ImplementationEntity.RunStepEndTime;
                }
                private static void _RunStepEndTime_SetImplementationValue(global::LightSwitchApplication.RunStep.DetailsClass d, global::System.Nullable<global::System.DateTime> v)
                {
                    d.ImplementationEntity.RunStepEndTime = global::LightSwitchApplication.RunStep.DetailsClass.ClearDateTimeKind(v);
                }
                private static void _RunStepEndTime_OnValueChanged(global::LightSwitchApplication.RunStep e)
                {
                    e.RunStepEndTime_Changed();
                }
    
                [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
                public static readonly global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::System.Nullable<int>>.Entry
                    RunStepTime = new global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::System.Nullable<int>>.Entry(
                        "RunStepTime",
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepTime_Stub,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepTime_ComputeIsReadOnly,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepTime_Validate,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepTime_GetImplementationValue,
                        null,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._RunStepTime_OnValueChanged);
                private static void _RunStepTime_Stub(global::Microsoft.LightSwitch.Details.Framework.Base.DetailsCallback<global::LightSwitchApplication.RunStep.DetailsClass, global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::System.Nullable<int>>.Data> c, global::LightSwitchApplication.RunStep.DetailsClass d, object sf)
                {
                    c(d, ref d._RunStepTime, sf);
                }
                private static bool _RunStepTime_ComputeIsReadOnly(global::LightSwitchApplication.RunStep e)
                {
                    bool result = false;
                    e.RunStepTime_IsReadOnly(ref result);
                    return result;
                }
                private static void _RunStepTime_Validate(global::LightSwitchApplication.RunStep e, global::Microsoft.LightSwitch.EntityValidationResultsBuilder r)
                {
                    e.RunStepTime_Validate(r);
                }
                private static global::System.Nullable<int> _RunStepTime_GetImplementationValue(global::LightSwitchApplication.RunStep.DetailsClass d)
                {
                    return d.ImplementationEntity.RunStepTime;
                }
                private static void _RunStepTime_OnValueChanged(global::LightSwitchApplication.RunStep e)
                {
                    e.RunStepTime_Changed();
                }
    
                [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
                public static readonly global::Microsoft.LightSwitch.Details.Framework.EntityReferenceProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::LightSwitchApplication.TestStep>.Entry
                    TestStep = new global::Microsoft.LightSwitch.Details.Framework.EntityReferenceProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::LightSwitchApplication.TestStep>.Entry(
                        "TestStep",
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._TestStep_Stub,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._TestStep_ComputeIsReadOnly,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._TestStep_Validate,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._TestStep_GetCoreImplementationValue,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._TestStep_GetImplementationValue,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._TestStep_SetImplementationValue,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._TestStep_Refresh,
                        global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties._TestStep_OnValueChanged);
                private static void _TestStep_Stub(global::Microsoft.LightSwitch.Details.Framework.Base.DetailsCallback<global::LightSwitchApplication.RunStep.DetailsClass, global::Microsoft.LightSwitch.Details.Framework.EntityReferenceProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::LightSwitchApplication.TestStep>.Data> c, global::LightSwitchApplication.RunStep.DetailsClass d, object sf)
                {
                    c(d, ref d._TestStep, sf);
                }
                private static bool _TestStep_ComputeIsReadOnly(global::LightSwitchApplication.RunStep e)
                {
                    bool result = false;
                    e.TestStep_IsReadOnly(ref result);
                    return result;
                }
                private static void _TestStep_Validate(global::LightSwitchApplication.RunStep e, global::Microsoft.LightSwitch.EntityValidationResultsBuilder r)
                {
                    e.TestStep_Validate(r);
                }
                private static global::Microsoft.LightSwitch.Internal.IEntityImplementation _TestStep_GetCoreImplementationValue(global::LightSwitchApplication.RunStep.DetailsClass d)
                {
                    return d.ImplementationEntity.TestStep;
                }
                private static global::LightSwitchApplication.TestStep _TestStep_GetImplementationValue(global::LightSwitchApplication.RunStep.DetailsClass d)
                {
                    return d.GetImplementationValue<global::LightSwitchApplication.TestStep, global::LightSwitchApplication.TestStep.DetailsClass>(global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties.TestStep, ref d._TestStep);
                }
                private static void _TestStep_SetImplementationValue(global::LightSwitchApplication.RunStep.DetailsClass d, global::LightSwitchApplication.TestStep v)
                {
                    d.SetImplementationValue(global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties.TestStep, ref d._TestStep, (i, ev) => i.TestStep = ev, v);
                }
                private static void _TestStep_Refresh(global::LightSwitchApplication.RunStep.DetailsClass d)
                {
                    d.RefreshNavigationProperty(global::LightSwitchApplication.RunStep.DetailsClass.PropertySetProperties.TestStep, ref d._TestStep);
                }
                private static void _TestStep_OnValueChanged(global::LightSwitchApplication.RunStep e)
                {
                    e.TestStep_Changed();
                }
    
            }
    
            [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
            private global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, int>.Data _RunStepID;
            
            [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
            private global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::System.Nullable<global::System.DateTime>>.Data _RunStepStartTime;
            
            [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
            private global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::System.Nullable<global::System.DateTime>>.Data _RunStepEndTime;
            
            [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
            private global::Microsoft.LightSwitch.Details.Framework.EntityStorageProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::System.Nullable<int>>.Data _RunStepTime;
            
            [global::System.Diagnostics.DebuggerBrowsable(global::System.Diagnostics.DebuggerBrowsableState.Never)]
            private global::Microsoft.LightSwitch.Details.Framework.EntityReferenceProperty<global::LightSwitchApplication.RunStep, global::LightSwitchApplication.RunStep.DetailsClass, global::LightSwitchApplication.TestStep>.Data _TestStep;
            
        }
    
        #endregion
    }
    
    #endregion
}
