/// <reference path="data.js" />

(function (lightSwitchApplication) {

    var $Screen = msls.Screen,
        $defineScreen = msls._defineScreen,
        $DataServiceQuery = msls.DataServiceQuery,
        $toODataString = msls._toODataString,
        $defineShowScreen = msls._defineShowScreen;

    function AddEditDatabase(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditDatabase screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Database" type="msls.application.Database">
        /// Gets or sets the database for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditDatabase.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditDatabase", parameters);
    }

    function AddEditPackage(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditPackage screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Package" type="msls.application.Package">
        /// Gets or sets the package for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditPackage.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditPackage", parameters);
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
        /// <field name="TestSteps" type="msls.VisualCollection" elementType="msls.application.TestStep">
        /// Gets the testSteps for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditTest.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditTest", parameters);
    }

    function AddEditTestStep(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditTestStep screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="TestStep" type="msls.application.TestStep">
        /// Gets or sets the testStep for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditTestStep.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditTestStep", parameters);
    }

    function BrowseDatabases(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseDatabases screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Databases" type="msls.VisualCollection" elementType="msls.application.Database">
        /// Gets the databases for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseDatabases.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseDatabases", parameters);
    }

    function BrowsePackages(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowsePackages screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Packages" type="msls.VisualCollection" elementType="msls.application.Package">
        /// Gets the packages for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowsePackages.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowsePackages", parameters);
    }

    function BrowseTests(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseTests screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Tests" type="msls.VisualCollection" elementType="msls.application.Test">
        /// Gets the tests for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseTests.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseTests", parameters);
    }

    msls._addToNamespace("msls.application", {

        AddEditDatabase: $defineScreen(AddEditDatabase, [
            { name: "Database", kind: "local", type: lightSwitchApplication.Database }
        ], [
        ]),

        AddEditPackage: $defineScreen(AddEditPackage, [
            { name: "Package", kind: "local", type: lightSwitchApplication.Package }
        ], [
        ]),

        AddEditTest: $defineScreen(AddEditTest, [
            { name: "Test", kind: "local", type: lightSwitchApplication.Test },
            {
                name: "TestSteps", kind: "collection", elementType: lightSwitchApplication.TestStep,
                getNavigationProperty: function () {
                    if (this.owner.Test) {
                        return this.owner.Test.details.properties.TestSteps;
                    }
                    return null;
                },
                appendQuery: function () {
                    return this.expand("SrcDatabase").expand("Package").expand("DestDatabase");
                }
            }
        ], [
        ]),

        AddEditTestStep: $defineScreen(AddEditTestStep, [
            { name: "TestStep", kind: "local", type: lightSwitchApplication.TestStep }
        ], [
        ]),

        BrowseDatabases: $defineScreen(BrowseDatabases, [
            {
                name: "Databases", kind: "collection", elementType: lightSwitchApplication.Database,
                createQuery: function () {
                    return this.dataWorkspace.PerformanceTest.Databases;
                }
            }
        ], [
        ]),

        BrowsePackages: $defineScreen(BrowsePackages, [
            {
                name: "Packages", kind: "collection", elementType: lightSwitchApplication.Package,
                createQuery: function () {
                    return this.dataWorkspace.PerformanceTest.Packages;
                }
            }
        ], [
        ]),

        BrowseTests: $defineScreen(BrowseTests, [
            {
                name: "Tests", kind: "collection", elementType: lightSwitchApplication.Test,
                createQuery: function () {
                    return this.dataWorkspace.PerformanceTest.Tests;
                }
            }
        ], [
        ]),

        showAddEditDatabase: $defineShowScreen(function showAddEditDatabase(Database, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditDatabase screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditDatabase", parameters, options);
        }),

        showAddEditPackage: $defineShowScreen(function showAddEditPackage(Package, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditPackage screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditPackage", parameters, options);
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

        showAddEditTestStep: $defineShowScreen(function showAddEditTestStep(TestStep, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditTestStep screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditTestStep", parameters, options);
        }),

        showBrowseDatabases: $defineShowScreen(function showBrowseDatabases(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseDatabases screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseDatabases", parameters, options);
        }),

        showBrowsePackages: $defineShowScreen(function showBrowsePackages(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowsePackages screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowsePackages", parameters, options);
        }),

        showBrowseTests: $defineShowScreen(function showBrowseTests(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseTests screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseTests", parameters, options);
        })

    });

}(msls.application));
