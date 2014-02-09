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

    function DataSource(entitySet) {
        /// <summary>
        /// Represents the DataSource entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this dataSource.
        /// </param>
        /// <field name="DataSourceID" type="Number">
        /// Gets or sets the dataSourceID for this dataSource.
        /// </field>
        /// <field name="DataSourceName" type="String">
        /// Gets or sets the dataSourceName for this dataSource.
        /// </field>
        /// <field name="ConnectionString" type="String">
        /// Gets or sets the connectionString for this dataSource.
        /// </field>
        /// <field name="DataSourceType" type="msls.application.DataSourceType">
        /// Gets or sets the dataSourceType for this dataSource.
        /// </field>
        /// <field name="Queries" type="msls.EntityCollection" elementType="msls.application.Query">
        /// Gets the queries for this dataSource.
        /// </field>
        /// <field name="details" type="msls.application.DataSource.Details">
        /// Gets the details for this dataSource.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function DataSourceType(entitySet) {
        /// <summary>
        /// Represents the DataSourceType entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this dataSourceType.
        /// </param>
        /// <field name="DataSourceTypeID" type="Number">
        /// Gets or sets the dataSourceTypeID for this dataSourceType.
        /// </field>
        /// <field name="DataSourceTypeName" type="String">
        /// Gets or sets the dataSourceTypeName for this dataSourceType.
        /// </field>
        /// <field name="DataSources" type="msls.EntityCollection" elementType="msls.application.DataSource">
        /// Gets the dataSources for this dataSourceType.
        /// </field>
        /// <field name="details" type="msls.application.DataSourceType.Details">
        /// Gets the details for this dataSourceType.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function FunctionalArea(entitySet) {
        /// <summary>
        /// Represents the FunctionalArea entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this functionalArea.
        /// </param>
        /// <field name="FunctionalAreaID" type="Number">
        /// Gets or sets the functionalAreaID for this functionalArea.
        /// </field>
        /// <field name="FunctionalAreaName" type="String">
        /// Gets or sets the functionalAreaName for this functionalArea.
        /// </field>
        /// <field name="Tests" type="msls.EntityCollection" elementType="msls.application.Test">
        /// Gets the tests for this functionalArea.
        /// </field>
        /// <field name="details" type="msls.application.FunctionalArea.Details">
        /// Gets the details for this functionalArea.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function Query(entitySet) {
        /// <summary>
        /// Represents the Query entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this query.
        /// </param>
        /// <field name="QueryID" type="Number">
        /// Gets or sets the queryID for this query.
        /// </field>
        /// <field name="QueryName" type="String">
        /// Gets or sets the queryName for this query.
        /// </field>
        /// <field name="QueryText" type="String">
        /// Gets or sets the queryText for this query.
        /// </field>
        /// <field name="DataSource" type="msls.application.DataSource">
        /// Gets or sets the dataSource for this query.
        /// </field>
        /// <field name="Test" type="msls.application.Test">
        /// Gets or sets the test for this query.
        /// </field>
        /// <field name="Results" type="msls.EntityCollection" elementType="msls.application.Result">
        /// Gets the results for this query.
        /// </field>
        /// <field name="details" type="msls.application.Query.Details">
        /// Gets the details for this query.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function Result(entitySet) {
        /// <summary>
        /// Represents the Result entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this result.
        /// </param>
        /// <field name="ResultID" type="Number">
        /// Gets or sets the resultID for this result.
        /// </field>
        /// <field name="TestResult" type="Number">
        /// Gets or sets the testResult for this result.
        /// </field>
        /// <field name="TestDateTime" type="Date">
        /// Gets or sets the testDateTime for this result.
        /// </field>
        /// <field name="Query" type="msls.application.Query">
        /// Gets or sets the query for this result.
        /// </field>
        /// <field name="Run" type="msls.application.Run">
        /// Gets or sets the run for this result.
        /// </field>
        /// <field name="details" type="msls.application.Result.Details">
        /// Gets the details for this result.
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
        /// <field name="RunName" type="String">
        /// Gets or sets the runName for this run.
        /// </field>
        /// <field name="RunTime" type="Date">
        /// Gets or sets the runTime for this run.
        /// </field>
        /// <field name="Results" type="msls.EntityCollection" elementType="msls.application.Result">
        /// Gets the results for this run.
        /// </field>
        /// <field name="details" type="msls.application.Run.Details">
        /// Gets the details for this run.
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
        /// <field name="ExpectedResult" type="Number">
        /// Gets or sets the expectedResult for this test.
        /// </field>
        /// <field name="ExpectedResultText" type="String">
        /// Gets or sets the expectedResultText for this test.
        /// </field>
        /// <field name="FunctionalArea" type="msls.application.FunctionalArea">
        /// Gets or sets the functionalArea for this test.
        /// </field>
        /// <field name="Queries" type="msls.EntityCollection" elementType="msls.application.Query">
        /// Gets the queries for this test.
        /// </field>
        /// <field name="details" type="msls.application.Test.Details">
        /// Gets the details for this test.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function Aphelion_DB_BalancingData(dataWorkspace) {
        /// <summary>
        /// Represents the Aphelion_DB_BalancingData data service.
        /// </summary>
        /// <param name="dataWorkspace" type="msls.DataWorkspace">
        /// The data workspace that created this data service.
        /// </param>
        /// <field name="DataSources" type="msls.EntitySet">
        /// Gets the DataSources entity set.
        /// </field>
        /// <field name="DataSourceTypes" type="msls.EntitySet">
        /// Gets the DataSourceTypes entity set.
        /// </field>
        /// <field name="FunctionalAreas" type="msls.EntitySet">
        /// Gets the FunctionalAreas entity set.
        /// </field>
        /// <field name="Queries" type="msls.EntitySet">
        /// Gets the Queries entity set.
        /// </field>
        /// <field name="Results" type="msls.EntitySet">
        /// Gets the Results entity set.
        /// </field>
        /// <field name="Runs" type="msls.EntitySet">
        /// Gets the Runs entity set.
        /// </field>
        /// <field name="Tests" type="msls.EntitySet">
        /// Gets the Tests entity set.
        /// </field>
        /// <field name="details" type="msls.application.Aphelion_DB_BalancingData.Details">
        /// Gets the details for this data service.
        /// </field>
        $DataService.call(this, dataWorkspace);
    };
    function DataWorkspace() {
        /// <summary>
        /// Represents the data workspace.
        /// </summary>
        /// <field name="Aphelion_DB_BalancingData" type="msls.application.Aphelion_DB_BalancingData">
        /// Gets the Aphelion_DB_BalancingData data service.
        /// </field>
        /// <field name="details" type="msls.application.DataWorkspace.Details">
        /// Gets the details for this data workspace.
        /// </field>
        $DataWorkspace.call(this);
    };

    msls._addToNamespace("msls.application", {

        DataSource: $defineEntity(DataSource, [
            { name: "DataSourceID", type: Number, isReadOnly: true },
            { name: "DataSourceName", type: String },
            { name: "ConnectionString", type: String },
            { name: "DataSourceType", kind: "reference", type: DataSourceType },
            { name: "Queries", kind: "collection", elementType: Query }
        ]),

        DataSourceType: $defineEntity(DataSourceType, [
            { name: "DataSourceTypeID", type: Number, isReadOnly: true },
            { name: "DataSourceTypeName", type: String },
            { name: "DataSources", kind: "collection", elementType: DataSource }
        ]),

        FunctionalArea: $defineEntity(FunctionalArea, [
            { name: "FunctionalAreaID", type: Number, isReadOnly: true },
            { name: "FunctionalAreaName", type: String },
            { name: "Tests", kind: "collection", elementType: Test }
        ]),

        Query: $defineEntity(Query, [
            { name: "QueryID", type: Number, isReadOnly: true },
            { name: "QueryName", type: String },
            { name: "QueryText", type: String },
            { name: "DataSource", kind: "reference", type: DataSource },
            { name: "Test", kind: "reference", type: Test },
            { name: "Results", kind: "collection", elementType: Result }
        ]),

        Result: $defineEntity(Result, [
            { name: "ResultID", type: Number, isReadOnly: true },
            { name: "TestResult", type: Number },
            { name: "TestDateTime", type: Date },
            { name: "Query", kind: "reference", type: Query },
            { name: "Run", kind: "reference", type: Run }
        ]),

        Run: $defineEntity(Run, [
            { name: "RunID", type: Number, isReadOnly: true },
            { name: "RunName", type: String },
            { name: "RunTime", type: Date },
            { name: "Results", kind: "collection", elementType: Result }
        ]),

        Test: $defineEntity(Test, [
            { name: "TestID", type: Number, isReadOnly: true },
            { name: "TestName", type: String },
            { name: "ExpectedResult", type: Number },
            { name: "ExpectedResultText", type: String },
            { name: "FunctionalArea", kind: "reference", type: FunctionalArea },
            { name: "Queries", kind: "collection", elementType: Query }
        ]),

        Aphelion_DB_BalancingData: $defineDataService(Aphelion_DB_BalancingData, lightSwitchApplication.rootUri + "/Aphelion_DB_BalancingData.svc", [
            { name: "DataSources", elementType: DataSource },
            { name: "DataSourceTypes", elementType: DataSourceType },
            { name: "FunctionalAreas", elementType: FunctionalArea },
            { name: "Queries", elementType: Query },
            { name: "Results", elementType: Result },
            { name: "Runs", elementType: Run },
            { name: "Tests", elementType: Test }
        ], [
            {
                name: "DataSources_SingleOrDefault", value: function (DataSourceID) {
                    return new $DataServiceQuery({ _entitySet: this.DataSources },
                        lightSwitchApplication.rootUri + "/Aphelion_DB_BalancingData.svc" + "/DataSources(" + "DataSourceID=" + $toODataString(DataSourceID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "DataSourceTypes_SingleOrDefault", value: function (DataSourceTypeID) {
                    return new $DataServiceQuery({ _entitySet: this.DataSourceTypes },
                        lightSwitchApplication.rootUri + "/Aphelion_DB_BalancingData.svc" + "/DataSourceTypes(" + "DataSourceTypeID=" + $toODataString(DataSourceTypeID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "FunctionalAreas_SingleOrDefault", value: function (FunctionalAreaID) {
                    return new $DataServiceQuery({ _entitySet: this.FunctionalAreas },
                        lightSwitchApplication.rootUri + "/Aphelion_DB_BalancingData.svc" + "/FunctionalAreas(" + "FunctionalAreaID=" + $toODataString(FunctionalAreaID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "Queries_SingleOrDefault", value: function (QueryID) {
                    return new $DataServiceQuery({ _entitySet: this.Queries },
                        lightSwitchApplication.rootUri + "/Aphelion_DB_BalancingData.svc" + "/Queries(" + "QueryID=" + $toODataString(QueryID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "Results_SingleOrDefault", value: function (ResultID) {
                    return new $DataServiceQuery({ _entitySet: this.Results },
                        lightSwitchApplication.rootUri + "/Aphelion_DB_BalancingData.svc" + "/Results(" + "ResultID=" + $toODataString(ResultID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "Runs_SingleOrDefault", value: function (RunID) {
                    return new $DataServiceQuery({ _entitySet: this.Runs },
                        lightSwitchApplication.rootUri + "/Aphelion_DB_BalancingData.svc" + "/Runs(" + "RunID=" + $toODataString(RunID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "Tests_SingleOrDefault", value: function (TestID) {
                    return new $DataServiceQuery({ _entitySet: this.Tests },
                        lightSwitchApplication.rootUri + "/Aphelion_DB_BalancingData.svc" + "/Tests(" + "TestID=" + $toODataString(TestID, "Int32?") + ")"
                    );
                }
            }
        ]),

        DataWorkspace: $defineDataWorkspace(DataWorkspace, [
            { name: "Aphelion_DB_BalancingData", type: Aphelion_DB_BalancingData }
        ])

    });

}(msls.application));
