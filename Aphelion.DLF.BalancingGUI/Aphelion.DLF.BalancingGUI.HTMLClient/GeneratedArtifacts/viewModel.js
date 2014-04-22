/// <reference path="data.js" />

(function (lightSwitchApplication) {

    var $Screen = msls.Screen,
        $defineScreen = msls._defineScreen,
        $DataServiceQuery = msls.DataServiceQuery,
        $toODataString = msls._toODataString,
        $defineShowScreen = msls._defineShowScreen;

    function AddEditDataSource(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditDataSource screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="DataSource" type="msls.application.DataSource">
        /// Gets or sets the dataSource for this screen.
        /// </field>
        /// <field name="DataSourceTypesSorted" type="msls.VisualCollection" elementType="msls.application.DataSourceType">
        /// Gets the dataSourceTypesSorted for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditDataSource.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditDataSource", parameters);
    }

    function AddEditDataSourceType(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditDataSourceType screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="DataSourceType" type="msls.application.DataSourceType">
        /// Gets or sets the dataSourceType for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditDataSourceType.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditDataSourceType", parameters);
    }

    function AddEditFunctionalArea(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditFunctionalArea screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="FunctionalArea" type="msls.application.FunctionalArea">
        /// Gets or sets the functionalArea for this screen.
        /// </field>
        /// <field name="Tests" type="msls.VisualCollection" elementType="msls.application.Test">
        /// Gets the tests for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditFunctionalArea.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditFunctionalArea", parameters);
    }

    function AddEditQuery(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditQuery screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Query" type="msls.application.Query">
        /// Gets or sets the query for this screen.
        /// </field>
        /// <field name="TestsSorted" type="msls.VisualCollection" elementType="msls.application.Test">
        /// Gets the testsSorted for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditQuery.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditQuery", parameters);
    }

    function AddEditTest(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditTest screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Test" type="msls.application.Test">
        /// Gets or sets the test for this screen.
        /// </field>
        /// <field name="Queries" type="msls.VisualCollection" elementType="msls.application.Query">
        /// Gets the queries for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditTest.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditTest", parameters);
    }

    function BrowseDataSources(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseDataSources screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="DataSources" type="msls.VisualCollection" elementType="msls.application.DataSource">
        /// Gets the dataSources for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseDataSources.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseDataSources", parameters);
    }

    function BrowseDataSourceTypes(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseDataSourceTypes screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="DataSourceTypes" type="msls.VisualCollection" elementType="msls.application.DataSourceType">
        /// Gets the dataSourceTypes for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseDataSourceTypes.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseDataSourceTypes", parameters);
    }

    function BrowseFunctionalAreas(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseFunctionalAreas screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="FunctionalAreas" type="msls.VisualCollection" elementType="msls.application.FunctionalArea">
        /// Gets the functionalAreas for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseFunctionalAreas.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseFunctionalAreas", parameters);
    }

    msls._addToNamespace("msls.application", {

        AddEditDataSource: $defineScreen(AddEditDataSource, [
            { name: "DataSource", kind: "local", type: lightSwitchApplication.DataSource },
            {
                name: "DataSourceTypesSorted", kind: "collection", elementType: lightSwitchApplication.DataSourceType,
                createQuery: function () {
                    return this.dataWorkspace.Aphelion_DB_BalancingData.DataSourceTypesSorted();
                }
            }
        ], [
        ]),

        AddEditDataSourceType: $defineScreen(AddEditDataSourceType, [
            { name: "DataSourceType", kind: "local", type: lightSwitchApplication.DataSourceType }
        ], [
        ]),

        AddEditFunctionalArea: $defineScreen(AddEditFunctionalArea, [
            { name: "FunctionalArea", kind: "local", type: lightSwitchApplication.FunctionalArea },
            {
                name: "Tests", kind: "collection", elementType: lightSwitchApplication.Test,
                getNavigationProperty: function () {
                    if (this.owner.FunctionalArea) {
                        return this.owner.FunctionalArea.details.properties.Tests;
                    }
                    return null;
                },
                appendQuery: function () {
                    return this;
                }
            }
        ], [
        ]),

        AddEditQuery: $defineScreen(AddEditQuery, [
            { name: "Query", kind: "local", type: lightSwitchApplication.Query },
            {
                name: "TestsSorted", kind: "collection", elementType: lightSwitchApplication.Test,
                createQuery: function () {
                    return this.dataWorkspace.Aphelion_DB_BalancingData.TestsSorted();
                }
            }
        ], [
        ]),

        AddEditTest: $defineScreen(AddEditTest, [
            { name: "Test", kind: "local", type: lightSwitchApplication.Test },
            {
                name: "Queries", kind: "collection", elementType: lightSwitchApplication.Query,
                getNavigationProperty: function () {
                    if (this.owner.Test) {
                        return this.owner.Test.details.properties.Queries;
                    }
                    return null;
                },
                appendQuery: function () {
                    return this.expand("DataSource");
                }
            }
        ], [
        ]),

        BrowseDataSources: $defineScreen(BrowseDataSources, [
            {
                name: "DataSources", kind: "collection", elementType: lightSwitchApplication.DataSource,
                createQuery: function () {
                    return this.dataWorkspace.Aphelion_DB_BalancingData.DataSources.orderBy("DataSourceName").expand("DataSourceType");
                }
            }
        ], [
        ]),

        BrowseDataSourceTypes: $defineScreen(BrowseDataSourceTypes, [
            {
                name: "DataSourceTypes", kind: "collection", elementType: lightSwitchApplication.DataSourceType,
                createQuery: function () {
                    return this.dataWorkspace.Aphelion_DB_BalancingData.DataSourceTypes.orderBy("DataSourceTypeName");
                }
            }
        ], [
        ]),

        BrowseFunctionalAreas: $defineScreen(BrowseFunctionalAreas, [
            {
                name: "FunctionalAreas", kind: "collection", elementType: lightSwitchApplication.FunctionalArea,
                createQuery: function () {
                    return this.dataWorkspace.Aphelion_DB_BalancingData.FunctionalAreas.orderBy("FunctionalAreaName");
                }
            }
        ], [
        ]),

        showAddEditDataSource: $defineShowScreen(function showAddEditDataSource(DataSource, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditDataSource screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditDataSource", parameters, options);
        }),

        showAddEditDataSourceType: $defineShowScreen(function showAddEditDataSourceType(DataSourceType, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditDataSourceType screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditDataSourceType", parameters, options);
        }),

        showAddEditFunctionalArea: $defineShowScreen(function showAddEditFunctionalArea(FunctionalArea, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditFunctionalArea screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditFunctionalArea", parameters, options);
        }),

        showAddEditQuery: $defineShowScreen(function showAddEditQuery(Query, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditQuery screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditQuery", parameters, options);
        }),

        showAddEditTest: $defineShowScreen(function showAddEditTest(Test, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditTest screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditTest", parameters, options);
        }),

        showBrowseDataSources: $defineShowScreen(function showBrowseDataSources(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseDataSources screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseDataSources", parameters, options);
        }),

        showBrowseDataSourceTypes: $defineShowScreen(function showBrowseDataSourceTypes(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseDataSourceTypes screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseDataSourceTypes", parameters, options);
        }),

        showBrowseFunctionalAreas: $defineShowScreen(function showBrowseFunctionalAreas(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseFunctionalAreas screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseFunctionalAreas", parameters, options);
        })

    });

}(msls.application));
