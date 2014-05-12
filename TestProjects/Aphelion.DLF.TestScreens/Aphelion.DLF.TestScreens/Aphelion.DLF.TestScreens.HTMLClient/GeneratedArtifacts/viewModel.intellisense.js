/// <reference path="viewModel.js" />

(function (lightSwitchApplication) {

    var $element = document.createElement("div");

    lightSwitchApplication.AddEditDatabase.prototype._$contentItems = {
        Tabs: {
            _$class: msls.ContentItem,
            _$name: "Tabs",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.AddEditDatabase
        },
        Details: {
            _$class: msls.ContentItem,
            _$name: "Details",
            _$parentName: "Tabs",
            screen: lightSwitchApplication.AddEditDatabase,
            data: lightSwitchApplication.AddEditDatabase,
            value: lightSwitchApplication.AddEditDatabase
        },
        columns: {
            _$class: msls.ContentItem,
            _$name: "columns",
            _$parentName: "Details",
            screen: lightSwitchApplication.AddEditDatabase,
            data: lightSwitchApplication.AddEditDatabase,
            value: lightSwitchApplication.Database
        },
        left: {
            _$class: msls.ContentItem,
            _$name: "left",
            _$parentName: "columns",
            screen: lightSwitchApplication.AddEditDatabase,
            data: lightSwitchApplication.Database,
            value: lightSwitchApplication.Database
        },
        DatabaseName: {
            _$class: msls.ContentItem,
            _$name: "DatabaseName",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditDatabase,
            data: lightSwitchApplication.Database,
            value: String
        },
        ServerName: {
            _$class: msls.ContentItem,
            _$name: "ServerName",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditDatabase,
            data: lightSwitchApplication.Database,
            value: String
        },
        Description: {
            _$class: msls.ContentItem,
            _$name: "Description",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditDatabase,
            data: lightSwitchApplication.Database,
            value: String
        },
        right: {
            _$class: msls.ContentItem,
            _$name: "right",
            _$parentName: "columns",
            screen: lightSwitchApplication.AddEditDatabase,
            data: lightSwitchApplication.Database,
            value: lightSwitchApplication.Database
        },
        Username: {
            _$class: msls.ContentItem,
            _$name: "Username",
            _$parentName: "right",
            screen: lightSwitchApplication.AddEditDatabase,
            data: lightSwitchApplication.Database,
            value: String
        },
        Password: {
            _$class: msls.ContentItem,
            _$name: "Password",
            _$parentName: "right",
            screen: lightSwitchApplication.AddEditDatabase,
            data: lightSwitchApplication.Database,
            value: String
        },
        Popups: {
            _$class: msls.ContentItem,
            _$name: "Popups",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.AddEditDatabase
        }
    };

    msls._addEntryPoints(lightSwitchApplication.AddEditDatabase, {
        /// <field>
        /// Called when a new AddEditDatabase screen is created.
        /// <br/>created(msls.application.AddEditDatabase screen)
        /// </field>
        created: [lightSwitchApplication.AddEditDatabase],
        /// <field>
        /// Called before changes on an active AddEditDatabase screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditDatabase screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditDatabase],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: [$element, function () { return new lightSwitchApplication.AddEditDatabase().findContentItem("Details"); }],
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: [$element, function () { return new lightSwitchApplication.AddEditDatabase().findContentItem("columns"); }],
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: [$element, function () { return new lightSwitchApplication.AddEditDatabase().findContentItem("left"); }],
        /// <field>
        /// Called after the DatabaseName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DatabaseName_postRender: [$element, function () { return new lightSwitchApplication.AddEditDatabase().findContentItem("DatabaseName"); }],
        /// <field>
        /// Called after the ServerName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ServerName_postRender: [$element, function () { return new lightSwitchApplication.AddEditDatabase().findContentItem("ServerName"); }],
        /// <field>
        /// Called after the Description content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Description_postRender: [$element, function () { return new lightSwitchApplication.AddEditDatabase().findContentItem("Description"); }],
        /// <field>
        /// Called after the right content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        right_postRender: [$element, function () { return new lightSwitchApplication.AddEditDatabase().findContentItem("right"); }],
        /// <field>
        /// Called after the Username content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Username_postRender: [$element, function () { return new lightSwitchApplication.AddEditDatabase().findContentItem("Username"); }],
        /// <field>
        /// Called after the Password content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Password_postRender: [$element, function () { return new lightSwitchApplication.AddEditDatabase().findContentItem("Password"); }]
    });

    lightSwitchApplication.AddEditPackage.prototype._$contentItems = {
        Tabs: {
            _$class: msls.ContentItem,
            _$name: "Tabs",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.AddEditPackage
        },
        Details: {
            _$class: msls.ContentItem,
            _$name: "Details",
            _$parentName: "Tabs",
            screen: lightSwitchApplication.AddEditPackage,
            data: lightSwitchApplication.AddEditPackage,
            value: lightSwitchApplication.AddEditPackage
        },
        columns: {
            _$class: msls.ContentItem,
            _$name: "columns",
            _$parentName: "Details",
            screen: lightSwitchApplication.AddEditPackage,
            data: lightSwitchApplication.AddEditPackage,
            value: lightSwitchApplication.Package
        },
        left: {
            _$class: msls.ContentItem,
            _$name: "left",
            _$parentName: "columns",
            screen: lightSwitchApplication.AddEditPackage,
            data: lightSwitchApplication.Package,
            value: lightSwitchApplication.Package
        },
        PackageName: {
            _$class: msls.ContentItem,
            _$name: "PackageName",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditPackage,
            data: lightSwitchApplication.Package,
            value: String
        },
        PackageGUID: {
            _$class: msls.ContentItem,
            _$name: "PackageGUID",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditPackage,
            data: lightSwitchApplication.Package,
            value: String
        },
        right: {
            _$class: msls.ContentItem,
            _$name: "right",
            _$parentName: "columns",
            screen: lightSwitchApplication.AddEditPackage,
            data: lightSwitchApplication.Package,
            value: lightSwitchApplication.Package
        },
        Description: {
            _$class: msls.ContentItem,
            _$name: "Description",
            _$parentName: "right",
            screen: lightSwitchApplication.AddEditPackage,
            data: lightSwitchApplication.Package,
            value: String
        },
        Popups: {
            _$class: msls.ContentItem,
            _$name: "Popups",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.AddEditPackage
        }
    };

    msls._addEntryPoints(lightSwitchApplication.AddEditPackage, {
        /// <field>
        /// Called when a new AddEditPackage screen is created.
        /// <br/>created(msls.application.AddEditPackage screen)
        /// </field>
        created: [lightSwitchApplication.AddEditPackage],
        /// <field>
        /// Called before changes on an active AddEditPackage screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditPackage screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditPackage],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: [$element, function () { return new lightSwitchApplication.AddEditPackage().findContentItem("Details"); }],
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: [$element, function () { return new lightSwitchApplication.AddEditPackage().findContentItem("columns"); }],
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: [$element, function () { return new lightSwitchApplication.AddEditPackage().findContentItem("left"); }],
        /// <field>
        /// Called after the PackageName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        PackageName_postRender: [$element, function () { return new lightSwitchApplication.AddEditPackage().findContentItem("PackageName"); }],
        /// <field>
        /// Called after the PackageGUID content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        PackageGUID_postRender: [$element, function () { return new lightSwitchApplication.AddEditPackage().findContentItem("PackageGUID"); }],
        /// <field>
        /// Called after the right content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        right_postRender: [$element, function () { return new lightSwitchApplication.AddEditPackage().findContentItem("right"); }],
        /// <field>
        /// Called after the Description content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Description_postRender: [$element, function () { return new lightSwitchApplication.AddEditPackage().findContentItem("Description"); }]
    });

    lightSwitchApplication.AddEditTest.prototype._$contentItems = {
        Tabs: {
            _$class: msls.ContentItem,
            _$name: "Tabs",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.AddEditTest
        },
        Details: {
            _$class: msls.ContentItem,
            _$name: "Details",
            _$parentName: "Tabs",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.AddEditTest,
            value: lightSwitchApplication.AddEditTest
        },
        columns: {
            _$class: msls.ContentItem,
            _$name: "columns",
            _$parentName: "Details",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.AddEditTest,
            value: lightSwitchApplication.Test
        },
        left: {
            _$class: msls.ContentItem,
            _$name: "left",
            _$parentName: "columns",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.Test,
            value: lightSwitchApplication.Test
        },
        TestName: {
            _$class: msls.ContentItem,
            _$name: "TestName",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.Test,
            value: String
        },
        right: {
            _$class: msls.ContentItem,
            _$name: "right",
            _$parentName: "columns",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.Test,
            value: lightSwitchApplication.Test
        },
        Description: {
            _$class: msls.ContentItem,
            _$name: "Description",
            _$parentName: "right",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.Test,
            value: String
        },
        TestSteps: {
            _$class: msls.ContentItem,
            _$name: "TestSteps",
            _$parentName: "Tabs",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.AddEditTest,
            value: lightSwitchApplication.AddEditTest
        },
        TestSteps1: {
            _$class: msls.ContentItem,
            _$name: "TestSteps1",
            _$parentName: "TestSteps",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.AddEditTest,
            value: {
                _$class: msls.VisualCollection,
                screen: lightSwitchApplication.AddEditTest,
                _$entry: {
                    elementType: lightSwitchApplication.TestStep
                }
            }
        },
        RowTemplate: {
            _$class: msls.ContentItem,
            _$name: "RowTemplate",
            _$parentName: "TestSteps1",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.TestStep,
            value: lightSwitchApplication.TestStep
        },
        TestStepName: {
            _$class: msls.ContentItem,
            _$name: "TestStepName",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.TestStep,
            value: String
        },
        Description1: {
            _$class: msls.ContentItem,
            _$name: "Description1",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.TestStep,
            value: String
        },
        SrcDatabase: {
            _$class: msls.ContentItem,
            _$name: "SrcDatabase",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.TestStep,
            value: lightSwitchApplication.Database
        },
        Package: {
            _$class: msls.ContentItem,
            _$name: "Package",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.TestStep,
            value: lightSwitchApplication.Package
        },
        DestDatabase: {
            _$class: msls.ContentItem,
            _$name: "DestDatabase",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.TestStep,
            value: lightSwitchApplication.Database
        },
        Popups: {
            _$class: msls.ContentItem,
            _$name: "Popups",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.AddEditTest
        }
    };

    msls._addEntryPoints(lightSwitchApplication.AddEditTest, {
        /// <field>
        /// Called when a new AddEditTest screen is created.
        /// <br/>created(msls.application.AddEditTest screen)
        /// </field>
        created: [lightSwitchApplication.AddEditTest],
        /// <field>
        /// Called before changes on an active AddEditTest screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditTest screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditTest],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("Details"); }],
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("columns"); }],
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("left"); }],
        /// <field>
        /// Called after the TestName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TestName_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("TestName"); }],
        /// <field>
        /// Called after the right content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        right_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("right"); }],
        /// <field>
        /// Called after the Description content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Description_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("Description"); }],
        /// <field>
        /// Called after the TestSteps content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TestSteps_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("TestSteps"); }],
        /// <field>
        /// Called after the TestSteps1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TestSteps1_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("TestSteps1"); }],
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("RowTemplate"); }],
        /// <field>
        /// Called after the TestStepName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TestStepName_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("TestStepName"); }],
        /// <field>
        /// Called after the Description1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Description1_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("Description1"); }],
        /// <field>
        /// Called after the SrcDatabase content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        SrcDatabase_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("SrcDatabase"); }],
        /// <field>
        /// Called after the Package content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Package_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("Package"); }],
        /// <field>
        /// Called after the DestDatabase content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DestDatabase_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("DestDatabase"); }]
    });

    lightSwitchApplication.AddEditTestStep.prototype._$contentItems = {
        Tabs: {
            _$class: msls.ContentItem,
            _$name: "Tabs",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.AddEditTestStep
        },
        Details: {
            _$class: msls.ContentItem,
            _$name: "Details",
            _$parentName: "Tabs",
            screen: lightSwitchApplication.AddEditTestStep,
            data: lightSwitchApplication.AddEditTestStep,
            value: lightSwitchApplication.AddEditTestStep
        },
        columns: {
            _$class: msls.ContentItem,
            _$name: "columns",
            _$parentName: "Details",
            screen: lightSwitchApplication.AddEditTestStep,
            data: lightSwitchApplication.AddEditTestStep,
            value: lightSwitchApplication.TestStep
        },
        left: {
            _$class: msls.ContentItem,
            _$name: "left",
            _$parentName: "columns",
            screen: lightSwitchApplication.AddEditTestStep,
            data: lightSwitchApplication.TestStep,
            value: lightSwitchApplication.TestStep
        },
        TestStepName: {
            _$class: msls.ContentItem,
            _$name: "TestStepName",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditTestStep,
            data: lightSwitchApplication.TestStep,
            value: String
        },
        Description: {
            _$class: msls.ContentItem,
            _$name: "Description",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditTestStep,
            data: lightSwitchApplication.TestStep,
            value: String
        },
        SrcDatabase: {
            _$class: msls.ContentItem,
            _$name: "SrcDatabase",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditTestStep,
            data: lightSwitchApplication.TestStep,
            value: lightSwitchApplication.Database
        },
        RowTemplate: {
            _$class: msls.ContentItem,
            _$name: "RowTemplate",
            _$parentName: "SrcDatabase",
            screen: lightSwitchApplication.AddEditTestStep,
            data: lightSwitchApplication.Database,
            value: lightSwitchApplication.Database
        },
        right: {
            _$class: msls.ContentItem,
            _$name: "right",
            _$parentName: "columns",
            screen: lightSwitchApplication.AddEditTestStep,
            data: lightSwitchApplication.TestStep,
            value: lightSwitchApplication.TestStep
        },
        Package: {
            _$class: msls.ContentItem,
            _$name: "Package",
            _$parentName: "right",
            screen: lightSwitchApplication.AddEditTestStep,
            data: lightSwitchApplication.TestStep,
            value: lightSwitchApplication.Package
        },
        RowTemplate1: {
            _$class: msls.ContentItem,
            _$name: "RowTemplate1",
            _$parentName: "Package",
            screen: lightSwitchApplication.AddEditTestStep,
            data: lightSwitchApplication.Package,
            value: lightSwitchApplication.Package
        },
        DestDatabase: {
            _$class: msls.ContentItem,
            _$name: "DestDatabase",
            _$parentName: "right",
            screen: lightSwitchApplication.AddEditTestStep,
            data: lightSwitchApplication.TestStep,
            value: lightSwitchApplication.Database
        },
        RowTemplate2: {
            _$class: msls.ContentItem,
            _$name: "RowTemplate2",
            _$parentName: "DestDatabase",
            screen: lightSwitchApplication.AddEditTestStep,
            data: lightSwitchApplication.Database,
            value: lightSwitchApplication.Database
        },
        Test: {
            _$class: msls.ContentItem,
            _$name: "Test",
            _$parentName: "right",
            screen: lightSwitchApplication.AddEditTestStep,
            data: lightSwitchApplication.TestStep,
            value: lightSwitchApplication.Test
        },
        RowTemplate3: {
            _$class: msls.ContentItem,
            _$name: "RowTemplate3",
            _$parentName: "Test",
            screen: lightSwitchApplication.AddEditTestStep,
            data: lightSwitchApplication.Test,
            value: lightSwitchApplication.Test
        },
        Popups: {
            _$class: msls.ContentItem,
            _$name: "Popups",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.AddEditTestStep
        }
    };

    msls._addEntryPoints(lightSwitchApplication.AddEditTestStep, {
        /// <field>
        /// Called when a new AddEditTestStep screen is created.
        /// <br/>created(msls.application.AddEditTestStep screen)
        /// </field>
        created: [lightSwitchApplication.AddEditTestStep],
        /// <field>
        /// Called before changes on an active AddEditTestStep screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditTestStep screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditTestStep],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: [$element, function () { return new lightSwitchApplication.AddEditTestStep().findContentItem("Details"); }],
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: [$element, function () { return new lightSwitchApplication.AddEditTestStep().findContentItem("columns"); }],
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: [$element, function () { return new lightSwitchApplication.AddEditTestStep().findContentItem("left"); }],
        /// <field>
        /// Called after the TestStepName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TestStepName_postRender: [$element, function () { return new lightSwitchApplication.AddEditTestStep().findContentItem("TestStepName"); }],
        /// <field>
        /// Called after the Description content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Description_postRender: [$element, function () { return new lightSwitchApplication.AddEditTestStep().findContentItem("Description"); }],
        /// <field>
        /// Called after the SrcDatabase content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        SrcDatabase_postRender: [$element, function () { return new lightSwitchApplication.AddEditTestStep().findContentItem("SrcDatabase"); }],
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: [$element, function () { return new lightSwitchApplication.AddEditTestStep().findContentItem("RowTemplate"); }],
        /// <field>
        /// Called after the right content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        right_postRender: [$element, function () { return new lightSwitchApplication.AddEditTestStep().findContentItem("right"); }],
        /// <field>
        /// Called after the Package content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Package_postRender: [$element, function () { return new lightSwitchApplication.AddEditTestStep().findContentItem("Package"); }],
        /// <field>
        /// Called after the RowTemplate1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate1_postRender: [$element, function () { return new lightSwitchApplication.AddEditTestStep().findContentItem("RowTemplate1"); }],
        /// <field>
        /// Called after the DestDatabase content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DestDatabase_postRender: [$element, function () { return new lightSwitchApplication.AddEditTestStep().findContentItem("DestDatabase"); }],
        /// <field>
        /// Called after the RowTemplate2 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate2_postRender: [$element, function () { return new lightSwitchApplication.AddEditTestStep().findContentItem("RowTemplate2"); }],
        /// <field>
        /// Called after the Test content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Test_postRender: [$element, function () { return new lightSwitchApplication.AddEditTestStep().findContentItem("Test"); }],
        /// <field>
        /// Called after the RowTemplate3 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate3_postRender: [$element, function () { return new lightSwitchApplication.AddEditTestStep().findContentItem("RowTemplate3"); }]
    });

    lightSwitchApplication.BrowseDatabases.prototype._$contentItems = {
        Tabs: {
            _$class: msls.ContentItem,
            _$name: "Tabs",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.BrowseDatabases
        },
        DatabaseList: {
            _$class: msls.ContentItem,
            _$name: "DatabaseList",
            _$parentName: "Tabs",
            screen: lightSwitchApplication.BrowseDatabases,
            data: lightSwitchApplication.BrowseDatabases,
            value: lightSwitchApplication.BrowseDatabases
        },
        Database: {
            _$class: msls.ContentItem,
            _$name: "Database",
            _$parentName: "DatabaseList",
            screen: lightSwitchApplication.BrowseDatabases,
            data: lightSwitchApplication.BrowseDatabases,
            value: {
                _$class: msls.VisualCollection,
                screen: lightSwitchApplication.BrowseDatabases,
                _$entry: {
                    elementType: lightSwitchApplication.Database
                }
            }
        },
        RowTemplate: {
            _$class: msls.ContentItem,
            _$name: "RowTemplate",
            _$parentName: "Database",
            screen: lightSwitchApplication.BrowseDatabases,
            data: lightSwitchApplication.Database,
            value: lightSwitchApplication.Database
        },
        DatabaseName: {
            _$class: msls.ContentItem,
            _$name: "DatabaseName",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.BrowseDatabases,
            data: lightSwitchApplication.Database,
            value: String
        },
        ServerName: {
            _$class: msls.ContentItem,
            _$name: "ServerName",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.BrowseDatabases,
            data: lightSwitchApplication.Database,
            value: String
        },
        Description: {
            _$class: msls.ContentItem,
            _$name: "Description",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.BrowseDatabases,
            data: lightSwitchApplication.Database,
            value: String
        },
        Username: {
            _$class: msls.ContentItem,
            _$name: "Username",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.BrowseDatabases,
            data: lightSwitchApplication.Database,
            value: String
        },
        Password: {
            _$class: msls.ContentItem,
            _$name: "Password",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.BrowseDatabases,
            data: lightSwitchApplication.Database,
            value: String
        },
        Popups: {
            _$class: msls.ContentItem,
            _$name: "Popups",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.BrowseDatabases
        }
    };

    msls._addEntryPoints(lightSwitchApplication.BrowseDatabases, {
        /// <field>
        /// Called when a new BrowseDatabases screen is created.
        /// <br/>created(msls.application.BrowseDatabases screen)
        /// </field>
        created: [lightSwitchApplication.BrowseDatabases],
        /// <field>
        /// Called before changes on an active BrowseDatabases screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseDatabases screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseDatabases],
        /// <field>
        /// Called after the DatabaseList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DatabaseList_postRender: [$element, function () { return new lightSwitchApplication.BrowseDatabases().findContentItem("DatabaseList"); }],
        /// <field>
        /// Called after the Database content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Database_postRender: [$element, function () { return new lightSwitchApplication.BrowseDatabases().findContentItem("Database"); }],
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: [$element, function () { return new lightSwitchApplication.BrowseDatabases().findContentItem("RowTemplate"); }],
        /// <field>
        /// Called after the DatabaseName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DatabaseName_postRender: [$element, function () { return new lightSwitchApplication.BrowseDatabases().findContentItem("DatabaseName"); }],
        /// <field>
        /// Called after the ServerName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ServerName_postRender: [$element, function () { return new lightSwitchApplication.BrowseDatabases().findContentItem("ServerName"); }],
        /// <field>
        /// Called after the Description content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Description_postRender: [$element, function () { return new lightSwitchApplication.BrowseDatabases().findContentItem("Description"); }],
        /// <field>
        /// Called after the Username content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Username_postRender: [$element, function () { return new lightSwitchApplication.BrowseDatabases().findContentItem("Username"); }],
        /// <field>
        /// Called after the Password content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Password_postRender: [$element, function () { return new lightSwitchApplication.BrowseDatabases().findContentItem("Password"); }]
    });

    lightSwitchApplication.BrowsePackages.prototype._$contentItems = {
        Tabs: {
            _$class: msls.ContentItem,
            _$name: "Tabs",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.BrowsePackages
        },
        PackageList: {
            _$class: msls.ContentItem,
            _$name: "PackageList",
            _$parentName: "Tabs",
            screen: lightSwitchApplication.BrowsePackages,
            data: lightSwitchApplication.BrowsePackages,
            value: lightSwitchApplication.BrowsePackages
        },
        Package: {
            _$class: msls.ContentItem,
            _$name: "Package",
            _$parentName: "PackageList",
            screen: lightSwitchApplication.BrowsePackages,
            data: lightSwitchApplication.BrowsePackages,
            value: {
                _$class: msls.VisualCollection,
                screen: lightSwitchApplication.BrowsePackages,
                _$entry: {
                    elementType: lightSwitchApplication.Package
                }
            }
        },
        RowTemplate: {
            _$class: msls.ContentItem,
            _$name: "RowTemplate",
            _$parentName: "Package",
            screen: lightSwitchApplication.BrowsePackages,
            data: lightSwitchApplication.Package,
            value: lightSwitchApplication.Package
        },
        PackageName: {
            _$class: msls.ContentItem,
            _$name: "PackageName",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.BrowsePackages,
            data: lightSwitchApplication.Package,
            value: String
        },
        PackageGUID: {
            _$class: msls.ContentItem,
            _$name: "PackageGUID",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.BrowsePackages,
            data: lightSwitchApplication.Package,
            value: String
        },
        Description: {
            _$class: msls.ContentItem,
            _$name: "Description",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.BrowsePackages,
            data: lightSwitchApplication.Package,
            value: String
        },
        Popups: {
            _$class: msls.ContentItem,
            _$name: "Popups",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.BrowsePackages
        }
    };

    msls._addEntryPoints(lightSwitchApplication.BrowsePackages, {
        /// <field>
        /// Called when a new BrowsePackages screen is created.
        /// <br/>created(msls.application.BrowsePackages screen)
        /// </field>
        created: [lightSwitchApplication.BrowsePackages],
        /// <field>
        /// Called before changes on an active BrowsePackages screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowsePackages screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowsePackages],
        /// <field>
        /// Called after the PackageList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        PackageList_postRender: [$element, function () { return new lightSwitchApplication.BrowsePackages().findContentItem("PackageList"); }],
        /// <field>
        /// Called after the Package content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Package_postRender: [$element, function () { return new lightSwitchApplication.BrowsePackages().findContentItem("Package"); }],
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: [$element, function () { return new lightSwitchApplication.BrowsePackages().findContentItem("RowTemplate"); }],
        /// <field>
        /// Called after the PackageName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        PackageName_postRender: [$element, function () { return new lightSwitchApplication.BrowsePackages().findContentItem("PackageName"); }],
        /// <field>
        /// Called after the PackageGUID content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        PackageGUID_postRender: [$element, function () { return new lightSwitchApplication.BrowsePackages().findContentItem("PackageGUID"); }],
        /// <field>
        /// Called after the Description content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Description_postRender: [$element, function () { return new lightSwitchApplication.BrowsePackages().findContentItem("Description"); }]
    });

    lightSwitchApplication.BrowseTests.prototype._$contentItems = {
        Tabs: {
            _$class: msls.ContentItem,
            _$name: "Tabs",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.BrowseTests
        },
        TestList: {
            _$class: msls.ContentItem,
            _$name: "TestList",
            _$parentName: "Tabs",
            screen: lightSwitchApplication.BrowseTests,
            data: lightSwitchApplication.BrowseTests,
            value: lightSwitchApplication.BrowseTests
        },
        Test: {
            _$class: msls.ContentItem,
            _$name: "Test",
            _$parentName: "TestList",
            screen: lightSwitchApplication.BrowseTests,
            data: lightSwitchApplication.BrowseTests,
            value: {
                _$class: msls.VisualCollection,
                screen: lightSwitchApplication.BrowseTests,
                _$entry: {
                    elementType: lightSwitchApplication.Test
                }
            }
        },
        RowTemplate: {
            _$class: msls.ContentItem,
            _$name: "RowTemplate",
            _$parentName: "Test",
            screen: lightSwitchApplication.BrowseTests,
            data: lightSwitchApplication.Test,
            value: lightSwitchApplication.Test
        },
        TestName: {
            _$class: msls.ContentItem,
            _$name: "TestName",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.BrowseTests,
            data: lightSwitchApplication.Test,
            value: String
        },
        Description: {
            _$class: msls.ContentItem,
            _$name: "Description",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.BrowseTests,
            data: lightSwitchApplication.Test,
            value: String
        },
        Popups: {
            _$class: msls.ContentItem,
            _$name: "Popups",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.BrowseTests
        }
    };

    msls._addEntryPoints(lightSwitchApplication.BrowseTests, {
        /// <field>
        /// Called when a new BrowseTests screen is created.
        /// <br/>created(msls.application.BrowseTests screen)
        /// </field>
        created: [lightSwitchApplication.BrowseTests],
        /// <field>
        /// Called before changes on an active BrowseTests screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseTests screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseTests],
        /// <field>
        /// Called after the TestList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TestList_postRender: [$element, function () { return new lightSwitchApplication.BrowseTests().findContentItem("TestList"); }],
        /// <field>
        /// Called after the Test content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Test_postRender: [$element, function () { return new lightSwitchApplication.BrowseTests().findContentItem("Test"); }],
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: [$element, function () { return new lightSwitchApplication.BrowseTests().findContentItem("RowTemplate"); }],
        /// <field>
        /// Called after the TestName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TestName_postRender: [$element, function () { return new lightSwitchApplication.BrowseTests().findContentItem("TestName"); }],
        /// <field>
        /// Called after the Description content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Description_postRender: [$element, function () { return new lightSwitchApplication.BrowseTests().findContentItem("Description"); }]
    });

}(msls.application));