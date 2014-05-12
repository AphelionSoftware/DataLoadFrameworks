/// <reference path="../Scripts/msls.js" />

window.myapp = msls.application;

(function (lightSwitchApplication) {

    var $Entity = msls.Entity,
        $DataService = msls.DataService,
        $DataWorkspace = msls.DataWorkspace,
        $defineEntity = msls._defineEntity,
        $defineDataService = msls._defineDataService,
        $defineDataWorkspace = msls._defineDataWorkspace,
        $DataServiceQuery = msls.DataServiceQuery,
        $toODataString = msls._toODataString;

    function Database(entitySet) {
        /// <summary>
        /// Represents the Database entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this database.
        /// </param>
        /// <field name="DatabaseID" type="Number">
        /// Gets or sets the databaseID for this database.
        /// </field>
        /// <field name="DatabaseName" type="String">
        /// Gets or sets the databaseName for this database.
        /// </field>
        /// <field name="ServerName" type="String">
        /// Gets or sets the serverName for this database.
        /// </field>
        /// <field name="Description" type="String">
        /// Gets or sets the description for this database.
        /// </field>
        /// <field name="Username" type="String">
        /// Gets or sets the username for this database.
        /// </field>
        /// <field name="Password" type="String">
        /// Gets or sets the password for this database.
        /// </field>
        /// <field name="TestSteps" type="msls.EntityCollection" elementType="msls.application.TestStep">
        /// Gets the testSteps for this database.
        /// </field>
        /// <field name="TestSteps1" type="msls.EntityCollection" elementType="msls.application.TestStep">
        /// Gets the testSteps1 for this database.
        /// </field>
        /// <field name="details" type="msls.application.Database.Details">
        /// Gets the details for this database.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function Package(entitySet) {
        /// <summary>
        /// Represents the Package entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this package.
        /// </param>
        /// <field name="PackageID" type="Number">
        /// Gets or sets the packageID for this package.
        /// </field>
        /// <field name="PackageName" type="String">
        /// Gets or sets the packageName for this package.
        /// </field>
        /// <field name="PackageGUID" type="String">
        /// Gets or sets the packageGUID for this package.
        /// </field>
        /// <field name="Description" type="String">
        /// Gets or sets the description for this package.
        /// </field>
        /// <field name="TestSteps" type="msls.EntityCollection" elementType="msls.application.TestStep">
        /// Gets the testSteps for this package.
        /// </field>
        /// <field name="details" type="msls.application.Package.Details">
        /// Gets the details for this package.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function Run(entitySet) {
        /// <summary>
        /// Represents the Run entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this run.
        /// </param>
        /// <field name="RunID" type="Number">
        /// Gets or sets the runID for this run.
        /// </field>
        /// <field name="RunStartTime" type="Date">
        /// Gets or sets the runStartTime for this run.
        /// </field>
        /// <field name="RunEndTime" type="Date">
        /// Gets or sets the runEndTime for this run.
        /// </field>
        /// <field name="RunTime" type="Number">
        /// Gets or sets the runTime for this run.
        /// </field>
        /// <field name="Test" type="msls.application.Test">
        /// Gets or sets the test for this run.
        /// </field>
        /// <field name="details" type="msls.application.Run.Details">
        /// Gets the details for this run.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function RunStep(entitySet) {
        /// <summary>
        /// Represents the RunStep entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this runStep.
        /// </param>
        /// <field name="RunStepID" type="Number">
        /// Gets or sets the runStepID for this runStep.
        /// </field>
        /// <field name="RunStepStartTime" type="Date">
        /// Gets or sets the runStepStartTime for this runStep.
        /// </field>
        /// <field name="RunStepEndTime" type="Date">
        /// Gets or sets the runStepEndTime for this runStep.
        /// </field>
        /// <field name="RunStepTime" type="Number">
        /// Gets or sets the runStepTime for this runStep.
        /// </field>
        /// <field name="TestStep" type="msls.application.TestStep">
        /// Gets or sets the testStep for this runStep.
        /// </field>
        /// <field name="details" type="msls.application.RunStep.Details">
        /// Gets the details for this runStep.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function Test(entitySet) {
        /// <summary>
        /// Represents the Test entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this test.
        /// </param>
        /// <field name="TestID" type="Number">
        /// Gets or sets the testID for this test.
        /// </field>
        /// <field name="TestName" type="String">
        /// Gets or sets the testName for this test.
        /// </field>
        /// <field name="Description" type="String">
        /// Gets or sets the description for this test.
        /// </field>
        /// <field name="Runs" type="msls.EntityCollection" elementType="msls.application.Run">
        /// Gets the runs for this test.
        /// </field>
        /// <field name="TestSteps" type="msls.EntityCollection" elementType="msls.application.TestStep">
        /// Gets the testSteps for this test.
        /// </field>
        /// <field name="details" type="msls.application.Test.Details">
        /// Gets the details for this test.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function TestStep(entitySet) {
        /// <summary>
        /// Represents the TestStep entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this testStep.
        /// </param>
        /// <field name="TestStepID" type="Number">
        /// Gets or sets the testStepID for this testStep.
        /// </field>
        /// <field name="TestStepName" type="String">
        /// Gets or sets the testStepName for this testStep.
        /// </field>
        /// <field name="Description" type="String">
        /// Gets or sets the description for this testStep.
        /// </field>
        /// <field name="RunSteps" type="msls.EntityCollection" elementType="msls.application.RunStep">
        /// Gets the runSteps for this testStep.
        /// </field>
        /// <field name="SrcDatabase" type="msls.application.Database">
        /// Gets or sets the srcDatabase for this testStep.
        /// </field>
        /// <field name="Package" type="msls.application.Package">
        /// Gets or sets the package for this testStep.
        /// </field>
        /// <field name="DestDatabase" type="msls.application.Database">
        /// Gets or sets the destDatabase for this testStep.
        /// </field>
        /// <field name="Test" type="msls.application.Test">
        /// Gets or sets the test for this testStep.
        /// </field>
        /// <field name="details" type="msls.application.TestStep.Details">
        /// Gets the details for this testStep.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function PerformanceTest(dataWorkspace) {
        /// <summary>
        /// Represents the PerformanceTest data service.
        /// </summary>
        /// <param name="dataWorkspace" type="msls.DataWorkspace">
        /// The data workspace that created this data service.
        /// </param>
        /// <field name="Databases" type="msls.EntitySet">
        /// Gets the Databases entity set.
        /// </field>
        /// <field name="Packages" type="msls.EntitySet">
        /// Gets the Packages entity set.
        /// </field>
        /// <field name="Runs" type="msls.EntitySet">
        /// Gets the Runs entity set.
        /// </field>
        /// <field name="RunSteps" type="msls.EntitySet">
        /// Gets the RunSteps entity set.
        /// </field>
        /// <field name="Tests" type="msls.EntitySet">
        /// Gets the Tests entity set.
        /// </field>
        /// <field name="TestSteps" type="msls.EntitySet">
        /// Gets the TestSteps entity set.
        /// </field>
        /// <field name="details" type="msls.application.PerformanceTest.Details">
        /// Gets the details for this data service.
        /// </field>
        $DataService.call(this, dataWorkspace);
    };
    function DataWorkspace() {
        /// <summary>
        /// Represents the data workspace.
        /// </summary>
        /// <field name="PerformanceTest" type="msls.application.PerformanceTest">
        /// Gets the PerformanceTest data service.
        /// </field>
        /// <field name="details" type="msls.application.DataWorkspace.Details">
        /// Gets the details for this data workspace.
        /// </field>
        $DataWorkspace.call(this);
    };

    msls._addToNamespace("msls.application", {

        Database: $defineEntity(Database, [
            { name: "DatabaseID", type: Number, isReadOnly: true },
            { name: "DatabaseName", type: String },
            { name: "ServerName", type: String },
            { name: "Description", type: String },
            { name: "Username", type: String },
            { name: "Password", type: String },
            { name: "TestSteps", kind: "collection", elementType: TestStep },
            { name: "TestSteps1", kind: "collection", elementType: TestStep }
        ]),

        Package: $defineEntity(Package, [
            { name: "PackageID", type: Number, isReadOnly: true },
            { name: "PackageName", type: String },
            { name: "PackageGUID", type: String },
            { name: "Description", type: String },
            { name: "TestSteps", kind: "collection", elementType: TestStep }
        ]),

        Run: $defineEntity(Run, [
            { name: "RunID", type: Number, isReadOnly: true },
            { name: "RunStartTime", type: Date },
            { name: "RunEndTime", type: Date },
            { name: "RunTime", type: Number, isReadOnly: true },
            { name: "Test", kind: "reference", type: Test }
        ]),

        RunStep: $defineEntity(RunStep, [
            { name: "RunStepID", type: Number, isReadOnly: true },
            { name: "RunStepStartTime", type: Date },
            { name: "RunStepEndTime", type: Date },
            { name: "RunStepTime", type: Number, isReadOnly: true },
            { name: "TestStep", kind: "reference", type: TestStep }
        ]),

        Test: $defineEntity(Test, [
            { name: "TestID", type: Number, isReadOnly: true },
            { name: "TestName", type: String },
            { name: "Description", type: String },
            { name: "Runs", kind: "collection", elementType: Run },
            { name: "TestSteps", kind: "collection", elementType: TestStep }
        ]),

        TestStep: $defineEntity(TestStep, [
            { name: "TestStepID", type: Number, isReadOnly: true },
            { name: "TestStepName", type: String },
            { name: "Description", type: String },
            { name: "RunSteps", kind: "collection", elementType: RunStep },
            { name: "SrcDatabase", kind: "reference", type: Database },
            { name: "Package", kind: "reference", type: Package },
            { name: "DestDatabase", kind: "reference", type: Database },
            { name: "Test", kind: "reference", type: Test }
        ]),

        PerformanceTest: $defineDataService(PerformanceTest, lightSwitchApplication.rootUri + "/PerformanceTest.svc", [
            { name: "Databases", elementType: Database },
            { name: "Packages", elementType: Package },
            { name: "Runs", elementType: Run },
            { name: "RunSteps", elementType: RunStep },
            { name: "Tests", elementType: Test },
            { name: "TestSteps", elementType: TestStep }
        ], [
            {
                name: "Databases_SingleOrDefault", value: function (DatabaseID) {
                    return new $DataServiceQuery({ _entitySet: this.Databases },
                        lightSwitchApplication.rootUri + "/PerformanceTest.svc" + "/Databases(" + "DatabaseID=" + $toODataString(DatabaseID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "Packages_SingleOrDefault", value: function (PackageID) {
                    return new $DataServiceQuery({ _entitySet: this.Packages },
                        lightSwitchApplication.rootUri + "/PerformanceTest.svc" + "/Packages(" + "PackageID=" + $toODataString(PackageID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "Runs_SingleOrDefault", value: function (RunID) {
                    return new $DataServiceQuery({ _entitySet: this.Runs },
                        lightSwitchApplication.rootUri + "/PerformanceTest.svc" + "/Runs(" + "RunID=" + $toODataString(RunID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "RunSteps_SingleOrDefault", value: function (RunStepID) {
                    return new $DataServiceQuery({ _entitySet: this.RunSteps },
                        lightSwitchApplication.rootUri + "/PerformanceTest.svc" + "/RunSteps(" + "RunStepID=" + $toODataString(RunStepID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "Tests_SingleOrDefault", value: function (TestID) {
                    return new $DataServiceQuery({ _entitySet: this.Tests },
                        lightSwitchApplication.rootUri + "/PerformanceTest.svc" + "/Tests(" + "TestID=" + $toODataString(TestID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "TestSteps_SingleOrDefault", value: function (TestStepID) {
                    return new $DataServiceQuery({ _entitySet: this.TestSteps },
                        lightSwitchApplication.rootUri + "/PerformanceTest.svc" + "/TestSteps(" + "TestStepID=" + $toODataString(TestStepID, "Int32?") + ")"
                    );
                }
            }
        ]),

        DataWorkspace: $defineDataWorkspace(DataWorkspace, [
            { name: "PerformanceTest", type: PerformanceTest }
        ])

    });

}(msls.application));
