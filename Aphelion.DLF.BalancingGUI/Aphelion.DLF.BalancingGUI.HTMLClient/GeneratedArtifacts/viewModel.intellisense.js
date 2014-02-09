/// <reference path="viewModel.js" />

(function (lightSwitchApplication) {

    var $element = document.createElement("div");

    lightSwitchApplication.AddEditFunctionalArea.prototype._$contentItems = {
        Tabs: {
            _$class: msls.ContentItem,
            _$name: "Tabs",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.AddEditFunctionalArea
        },
        Details: {
            _$class: msls.ContentItem,
            _$name: "Details",
            _$parentName: "Tabs",
            screen: lightSwitchApplication.AddEditFunctionalArea,
            data: lightSwitchApplication.AddEditFunctionalArea,
            value: lightSwitchApplication.AddEditFunctionalArea
        },
        columns: {
            _$class: msls.ContentItem,
            _$name: "columns",
            _$parentName: "Details",
            screen: lightSwitchApplication.AddEditFunctionalArea,
            data: lightSwitchApplication.AddEditFunctionalArea,
            value: lightSwitchApplication.FunctionalArea
        },
        left: {
            _$class: msls.ContentItem,
            _$name: "left",
            _$parentName: "columns",
            screen: lightSwitchApplication.AddEditFunctionalArea,
            data: lightSwitchApplication.FunctionalArea,
            value: lightSwitchApplication.FunctionalArea
        },
        FunctionalAreaName: {
            _$class: msls.ContentItem,
            _$name: "FunctionalAreaName",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditFunctionalArea,
            data: lightSwitchApplication.FunctionalArea,
            value: String
        },
        right: {
            _$class: msls.ContentItem,
            _$name: "right",
            _$parentName: "columns",
            screen: lightSwitchApplication.AddEditFunctionalArea,
            data: lightSwitchApplication.FunctionalArea,
            value: lightSwitchApplication.FunctionalArea
        },
        Tests: {
            _$class: msls.ContentItem,
            _$name: "Tests",
            _$parentName: "Tabs",
            screen: lightSwitchApplication.AddEditFunctionalArea,
            data: lightSwitchApplication.AddEditFunctionalArea,
            value: lightSwitchApplication.AddEditFunctionalArea
        },
        Tests1: {
            _$class: msls.ContentItem,
            _$name: "Tests1",
            _$parentName: "Tests",
            screen: lightSwitchApplication.AddEditFunctionalArea,
            data: lightSwitchApplication.AddEditFunctionalArea,
            value: {
                _$class: msls.VisualCollection,
                screen: lightSwitchApplication.AddEditFunctionalArea,
                _$entry: {
                    elementType: lightSwitchApplication.Test
                }
            }
        },
        RowTemplate: {
            _$class: msls.ContentItem,
            _$name: "RowTemplate",
            _$parentName: "Tests1",
            screen: lightSwitchApplication.AddEditFunctionalArea,
            data: lightSwitchApplication.Test,
            value: lightSwitchApplication.Test
        },
        EditTest: {
            _$class: msls.ContentItem,
            _$name: "EditTest",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.AddEditFunctionalArea
        },
        TestName: {
            _$class: msls.ContentItem,
            _$name: "TestName",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.AddEditFunctionalArea,
            data: lightSwitchApplication.Test,
            value: String
        },
        ExpectedResult: {
            _$class: msls.ContentItem,
            _$name: "ExpectedResult",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.AddEditFunctionalArea,
            data: lightSwitchApplication.Test,
            value: Number
        },
        ExpectedResultText: {
            _$class: msls.ContentItem,
            _$name: "ExpectedResultText",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.AddEditFunctionalArea,
            data: lightSwitchApplication.Test,
            value: String
        },
        Popups: {
            _$class: msls.ContentItem,
            _$name: "Popups",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.AddEditFunctionalArea
        }
    };

    msls._addEntryPoints(lightSwitchApplication.AddEditFunctionalArea, {
        /// <field>
        /// Called when a new AddEditFunctionalArea screen is created.
        /// <br/>created(msls.application.AddEditFunctionalArea screen)
        /// </field>
        created: [lightSwitchApplication.AddEditFunctionalArea],
        /// <field>
        /// Called before changes on an active AddEditFunctionalArea screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditFunctionalArea screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditFunctionalArea],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: [$element, function () { return new lightSwitchApplication.AddEditFunctionalArea().findContentItem("Details"); }],
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: [$element, function () { return new lightSwitchApplication.AddEditFunctionalArea().findContentItem("columns"); }],
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: [$element, function () { return new lightSwitchApplication.AddEditFunctionalArea().findContentItem("left"); }],
        /// <field>
        /// Called after the FunctionalAreaName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        FunctionalAreaName_postRender: [$element, function () { return new lightSwitchApplication.AddEditFunctionalArea().findContentItem("FunctionalAreaName"); }],
        /// <field>
        /// Called after the right content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        right_postRender: [$element, function () { return new lightSwitchApplication.AddEditFunctionalArea().findContentItem("right"); }],
        /// <field>
        /// Called after the Tests content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Tests_postRender: [$element, function () { return new lightSwitchApplication.AddEditFunctionalArea().findContentItem("Tests"); }],
        /// <field>
        /// Called after the Tests1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Tests1_postRender: [$element, function () { return new lightSwitchApplication.AddEditFunctionalArea().findContentItem("Tests1"); }],
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: [$element, function () { return new lightSwitchApplication.AddEditFunctionalArea().findContentItem("RowTemplate"); }],
        /// <field>
        /// Called after the EditTest content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        EditTest_postRender: [$element, function () { return new lightSwitchApplication.AddEditFunctionalArea().findContentItem("EditTest"); }],
        /// <field>
        /// Called after the TestName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TestName_postRender: [$element, function () { return new lightSwitchApplication.AddEditFunctionalArea().findContentItem("TestName"); }],
        /// <field>
        /// Called after the ExpectedResult content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ExpectedResult_postRender: [$element, function () { return new lightSwitchApplication.AddEditFunctionalArea().findContentItem("ExpectedResult"); }],
        /// <field>
        /// Called after the ExpectedResultText content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ExpectedResultText_postRender: [$element, function () { return new lightSwitchApplication.AddEditFunctionalArea().findContentItem("ExpectedResultText"); }]
    });

    lightSwitchApplication.AddEditQuery.prototype._$contentItems = {
        Tabs: {
            _$class: msls.ContentItem,
            _$name: "Tabs",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.AddEditQuery
        },
        Details: {
            _$class: msls.ContentItem,
            _$name: "Details",
            _$parentName: "Tabs",
            screen: lightSwitchApplication.AddEditQuery,
            data: lightSwitchApplication.AddEditQuery,
            value: lightSwitchApplication.AddEditQuery
        },
        columns: {
            _$class: msls.ContentItem,
            _$name: "columns",
            _$parentName: "Details",
            screen: lightSwitchApplication.AddEditQuery,
            data: lightSwitchApplication.AddEditQuery,
            value: lightSwitchApplication.Query
        },
        left: {
            _$class: msls.ContentItem,
            _$name: "left",
            _$parentName: "columns",
            screen: lightSwitchApplication.AddEditQuery,
            data: lightSwitchApplication.Query,
            value: lightSwitchApplication.Query
        },
        Test: {
            _$class: msls.ContentItem,
            _$name: "Test",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditQuery,
            data: lightSwitchApplication.Query,
            value: lightSwitchApplication.Test
        },
        RowTemplate1: {
            _$class: msls.ContentItem,
            _$name: "RowTemplate1",
            _$parentName: "Test",
            screen: lightSwitchApplication.AddEditQuery,
            data: lightSwitchApplication.Test,
            value: lightSwitchApplication.Test
        },
        DataSource: {
            _$class: msls.ContentItem,
            _$name: "DataSource",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditQuery,
            data: lightSwitchApplication.Query,
            value: lightSwitchApplication.DataSource
        },
        RowTemplate: {
            _$class: msls.ContentItem,
            _$name: "RowTemplate",
            _$parentName: "DataSource",
            screen: lightSwitchApplication.AddEditQuery,
            data: lightSwitchApplication.DataSource,
            value: lightSwitchApplication.DataSource
        },
        QueryName: {
            _$class: msls.ContentItem,
            _$name: "QueryName",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditQuery,
            data: lightSwitchApplication.Query,
            value: String
        },
        QueryText: {
            _$class: msls.ContentItem,
            _$name: "QueryText",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditQuery,
            data: lightSwitchApplication.Query,
            value: String
        },
        Popups: {
            _$class: msls.ContentItem,
            _$name: "Popups",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.AddEditQuery
        }
    };

    msls._addEntryPoints(lightSwitchApplication.AddEditQuery, {
        /// <field>
        /// Called when a new AddEditQuery screen is created.
        /// <br/>created(msls.application.AddEditQuery screen)
        /// </field>
        created: [lightSwitchApplication.AddEditQuery],
        /// <field>
        /// Called before changes on an active AddEditQuery screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditQuery screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditQuery],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: [$element, function () { return new lightSwitchApplication.AddEditQuery().findContentItem("Details"); }],
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: [$element, function () { return new lightSwitchApplication.AddEditQuery().findContentItem("columns"); }],
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: [$element, function () { return new lightSwitchApplication.AddEditQuery().findContentItem("left"); }],
        /// <field>
        /// Called after the Test content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Test_postRender: [$element, function () { return new lightSwitchApplication.AddEditQuery().findContentItem("Test"); }],
        /// <field>
        /// Called after the RowTemplate1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate1_postRender: [$element, function () { return new lightSwitchApplication.AddEditQuery().findContentItem("RowTemplate1"); }],
        /// <field>
        /// Called after the DataSource content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataSource_postRender: [$element, function () { return new lightSwitchApplication.AddEditQuery().findContentItem("DataSource"); }],
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: [$element, function () { return new lightSwitchApplication.AddEditQuery().findContentItem("RowTemplate"); }],
        /// <field>
        /// Called after the QueryName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        QueryName_postRender: [$element, function () { return new lightSwitchApplication.AddEditQuery().findContentItem("QueryName"); }],
        /// <field>
        /// Called after the QueryText content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        QueryText_postRender: [$element, function () { return new lightSwitchApplication.AddEditQuery().findContentItem("QueryText"); }]
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
        FunctionalArea: {
            _$class: msls.ContentItem,
            _$name: "FunctionalArea",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.Test,
            value: lightSwitchApplication.FunctionalArea
        },
        RowTemplate: {
            _$class: msls.ContentItem,
            _$name: "RowTemplate",
            _$parentName: "FunctionalArea",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.FunctionalArea,
            value: lightSwitchApplication.FunctionalArea
        },
        TestName: {
            _$class: msls.ContentItem,
            _$name: "TestName",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.Test,
            value: String
        },
        ExpectedResult: {
            _$class: msls.ContentItem,
            _$name: "ExpectedResult",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.Test,
            value: Number
        },
        ExpectedResultText: {
            _$class: msls.ContentItem,
            _$name: "ExpectedResultText",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.Test,
            value: String
        },
        Queries: {
            _$class: msls.ContentItem,
            _$name: "Queries",
            _$parentName: "Tabs",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.AddEditTest,
            value: lightSwitchApplication.AddEditTest
        },
        Queries1: {
            _$class: msls.ContentItem,
            _$name: "Queries1",
            _$parentName: "Queries",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.AddEditTest,
            value: {
                _$class: msls.VisualCollection,
                screen: lightSwitchApplication.AddEditTest,
                _$entry: {
                    elementType: lightSwitchApplication.Query
                }
            }
        },
        RowTemplate1: {
            _$class: msls.ContentItem,
            _$name: "RowTemplate1",
            _$parentName: "Queries1",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.Query,
            value: lightSwitchApplication.Query
        },
        EditTest: {
            _$class: msls.ContentItem,
            _$name: "EditTest",
            _$parentName: "RowTemplate1",
            screen: lightSwitchApplication.AddEditTest
        },
        DataSource: {
            _$class: msls.ContentItem,
            _$name: "DataSource",
            _$parentName: "RowTemplate1",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.Query,
            value: lightSwitchApplication.DataSource
        },
        DataSourceTemplate: {
            _$class: msls.ContentItem,
            _$name: "DataSourceTemplate",
            _$parentName: "DataSource",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.DataSource,
            value: lightSwitchApplication.DataSource
        },
        QueryName: {
            _$class: msls.ContentItem,
            _$name: "QueryName",
            _$parentName: "RowTemplate1",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.Query,
            value: String
        },
        QueryText: {
            _$class: msls.ContentItem,
            _$name: "QueryText",
            _$parentName: "RowTemplate1",
            screen: lightSwitchApplication.AddEditTest,
            data: lightSwitchApplication.Query,
            value: String
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
        /// Called after the FunctionalArea content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        FunctionalArea_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("FunctionalArea"); }],
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("RowTemplate"); }],
        /// <field>
        /// Called after the TestName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TestName_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("TestName"); }],
        /// <field>
        /// Called after the ExpectedResult content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ExpectedResult_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("ExpectedResult"); }],
        /// <field>
        /// Called after the ExpectedResultText content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ExpectedResultText_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("ExpectedResultText"); }],
        /// <field>
        /// Called after the Queries content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Queries_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("Queries"); }],
        /// <field>
        /// Called after the Queries1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Queries1_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("Queries1"); }],
        /// <field>
        /// Called after the RowTemplate1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate1_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("RowTemplate1"); }],
        /// <field>
        /// Called after the EditTest content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        EditTest_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("EditTest"); }],
        /// <field>
        /// Called after the DataSource content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataSource_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("DataSource"); }],
        /// <field>
        /// Called after the DataSourceTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataSourceTemplate_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("DataSourceTemplate"); }],
        /// <field>
        /// Called after the QueryName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        QueryName_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("QueryName"); }],
        /// <field>
        /// Called after the QueryText content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        QueryText_postRender: [$element, function () { return new lightSwitchApplication.AddEditTest().findContentItem("QueryText"); }]
    });

    lightSwitchApplication.BrowseFunctionalAreas.prototype._$contentItems = {
        Tabs: {
            _$class: msls.ContentItem,
            _$name: "Tabs",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.BrowseFunctionalAreas
        },
        FunctionalAreaList: {
            _$class: msls.ContentItem,
            _$name: "FunctionalAreaList",
            _$parentName: "Tabs",
            screen: lightSwitchApplication.BrowseFunctionalAreas,
            data: lightSwitchApplication.BrowseFunctionalAreas,
            value: lightSwitchApplication.BrowseFunctionalAreas
        },
        FunctionalArea: {
            _$class: msls.ContentItem,
            _$name: "FunctionalArea",
            _$parentName: "FunctionalAreaList",
            screen: lightSwitchApplication.BrowseFunctionalAreas,
            data: lightSwitchApplication.BrowseFunctionalAreas,
            value: {
                _$class: msls.VisualCollection,
                screen: lightSwitchApplication.BrowseFunctionalAreas,
                _$entry: {
                    elementType: lightSwitchApplication.FunctionalArea
                }
            }
        },
        RowTemplate: {
            _$class: msls.ContentItem,
            _$name: "RowTemplate",
            _$parentName: "FunctionalArea",
            screen: lightSwitchApplication.BrowseFunctionalAreas,
            data: lightSwitchApplication.FunctionalArea,
            value: lightSwitchApplication.FunctionalArea
        },
        Popups: {
            _$class: msls.ContentItem,
            _$name: "Popups",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.BrowseFunctionalAreas
        }
    };

    msls._addEntryPoints(lightSwitchApplication.BrowseFunctionalAreas, {
        /// <field>
        /// Called when a new BrowseFunctionalAreas screen is created.
        /// <br/>created(msls.application.BrowseFunctionalAreas screen)
        /// </field>
        created: [lightSwitchApplication.BrowseFunctionalAreas],
        /// <field>
        /// Called before changes on an active BrowseFunctionalAreas screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseFunctionalAreas screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseFunctionalAreas],
        /// <field>
        /// Called after the FunctionalAreaList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        FunctionalAreaList_postRender: [$element, function () { return new lightSwitchApplication.BrowseFunctionalAreas().findContentItem("FunctionalAreaList"); }],
        /// <field>
        /// Called after the FunctionalArea content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        FunctionalArea_postRender: [$element, function () { return new lightSwitchApplication.BrowseFunctionalAreas().findContentItem("FunctionalArea"); }],
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: [$element, function () { return new lightSwitchApplication.BrowseFunctionalAreas().findContentItem("RowTemplate"); }]
    });

    lightSwitchApplication.BrowseDataSourceTypes.prototype._$contentItems = {
        Tabs: {
            _$class: msls.ContentItem,
            _$name: "Tabs",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.BrowseDataSourceTypes
        },
        DataSourceTypeList: {
            _$class: msls.ContentItem,
            _$name: "DataSourceTypeList",
            _$parentName: "Tabs",
            screen: lightSwitchApplication.BrowseDataSourceTypes,
            data: lightSwitchApplication.BrowseDataSourceTypes,
            value: lightSwitchApplication.BrowseDataSourceTypes
        },
        DataSourceType: {
            _$class: msls.ContentItem,
            _$name: "DataSourceType",
            _$parentName: "DataSourceTypeList",
            screen: lightSwitchApplication.BrowseDataSourceTypes,
            data: lightSwitchApplication.BrowseDataSourceTypes,
            value: {
                _$class: msls.VisualCollection,
                screen: lightSwitchApplication.BrowseDataSourceTypes,
                _$entry: {
                    elementType: lightSwitchApplication.DataSourceType
                }
            }
        },
        RowTemplate: {
            _$class: msls.ContentItem,
            _$name: "RowTemplate",
            _$parentName: "DataSourceType",
            screen: lightSwitchApplication.BrowseDataSourceTypes,
            data: lightSwitchApplication.DataSourceType,
            value: lightSwitchApplication.DataSourceType
        },
        DataSourceTypeName: {
            _$class: msls.ContentItem,
            _$name: "DataSourceTypeName",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.BrowseDataSourceTypes,
            data: lightSwitchApplication.DataSourceType,
            value: String
        },
        Popups: {
            _$class: msls.ContentItem,
            _$name: "Popups",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.BrowseDataSourceTypes
        }
    };

    msls._addEntryPoints(lightSwitchApplication.BrowseDataSourceTypes, {
        /// <field>
        /// Called when a new BrowseDataSourceTypes screen is created.
        /// <br/>created(msls.application.BrowseDataSourceTypes screen)
        /// </field>
        created: [lightSwitchApplication.BrowseDataSourceTypes],
        /// <field>
        /// Called before changes on an active BrowseDataSourceTypes screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseDataSourceTypes screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseDataSourceTypes],
        /// <field>
        /// Called after the DataSourceTypeList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataSourceTypeList_postRender: [$element, function () { return new lightSwitchApplication.BrowseDataSourceTypes().findContentItem("DataSourceTypeList"); }],
        /// <field>
        /// Called after the DataSourceType content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataSourceType_postRender: [$element, function () { return new lightSwitchApplication.BrowseDataSourceTypes().findContentItem("DataSourceType"); }],
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: [$element, function () { return new lightSwitchApplication.BrowseDataSourceTypes().findContentItem("RowTemplate"); }],
        /// <field>
        /// Called after the DataSourceTypeName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataSourceTypeName_postRender: [$element, function () { return new lightSwitchApplication.BrowseDataSourceTypes().findContentItem("DataSourceTypeName"); }]
    });

    lightSwitchApplication.AddEditDataSourceType.prototype._$contentItems = {
        Tabs: {
            _$class: msls.ContentItem,
            _$name: "Tabs",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.AddEditDataSourceType
        },
        Details: {
            _$class: msls.ContentItem,
            _$name: "Details",
            _$parentName: "Tabs",
            screen: lightSwitchApplication.AddEditDataSourceType,
            data: lightSwitchApplication.AddEditDataSourceType,
            value: lightSwitchApplication.AddEditDataSourceType
        },
        columns: {
            _$class: msls.ContentItem,
            _$name: "columns",
            _$parentName: "Details",
            screen: lightSwitchApplication.AddEditDataSourceType,
            data: lightSwitchApplication.AddEditDataSourceType,
            value: lightSwitchApplication.DataSourceType
        },
        left: {
            _$class: msls.ContentItem,
            _$name: "left",
            _$parentName: "columns",
            screen: lightSwitchApplication.AddEditDataSourceType,
            data: lightSwitchApplication.DataSourceType,
            value: lightSwitchApplication.DataSourceType
        },
        DataSourceTypeName: {
            _$class: msls.ContentItem,
            _$name: "DataSourceTypeName",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditDataSourceType,
            data: lightSwitchApplication.DataSourceType,
            value: String
        },
        right: {
            _$class: msls.ContentItem,
            _$name: "right",
            _$parentName: "columns",
            screen: lightSwitchApplication.AddEditDataSourceType,
            data: lightSwitchApplication.DataSourceType,
            value: lightSwitchApplication.DataSourceType
        },
        Popups: {
            _$class: msls.ContentItem,
            _$name: "Popups",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.AddEditDataSourceType
        }
    };

    msls._addEntryPoints(lightSwitchApplication.AddEditDataSourceType, {
        /// <field>
        /// Called when a new AddEditDataSourceType screen is created.
        /// <br/>created(msls.application.AddEditDataSourceType screen)
        /// </field>
        created: [lightSwitchApplication.AddEditDataSourceType],
        /// <field>
        /// Called before changes on an active AddEditDataSourceType screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditDataSourceType screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditDataSourceType],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: [$element, function () { return new lightSwitchApplication.AddEditDataSourceType().findContentItem("Details"); }],
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: [$element, function () { return new lightSwitchApplication.AddEditDataSourceType().findContentItem("columns"); }],
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: [$element, function () { return new lightSwitchApplication.AddEditDataSourceType().findContentItem("left"); }],
        /// <field>
        /// Called after the DataSourceTypeName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataSourceTypeName_postRender: [$element, function () { return new lightSwitchApplication.AddEditDataSourceType().findContentItem("DataSourceTypeName"); }],
        /// <field>
        /// Called after the right content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        right_postRender: [$element, function () { return new lightSwitchApplication.AddEditDataSourceType().findContentItem("right"); }]
    });

    lightSwitchApplication.BrowseDataSources.prototype._$contentItems = {
        Tabs: {
            _$class: msls.ContentItem,
            _$name: "Tabs",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.BrowseDataSources
        },
        DataSourceList: {
            _$class: msls.ContentItem,
            _$name: "DataSourceList",
            _$parentName: "Tabs",
            screen: lightSwitchApplication.BrowseDataSources,
            data: lightSwitchApplication.BrowseDataSources,
            value: lightSwitchApplication.BrowseDataSources
        },
        DataSource: {
            _$class: msls.ContentItem,
            _$name: "DataSource",
            _$parentName: "DataSourceList",
            screen: lightSwitchApplication.BrowseDataSources,
            data: lightSwitchApplication.BrowseDataSources,
            value: {
                _$class: msls.VisualCollection,
                screen: lightSwitchApplication.BrowseDataSources,
                _$entry: {
                    elementType: lightSwitchApplication.DataSource
                }
            }
        },
        RowTemplate: {
            _$class: msls.ContentItem,
            _$name: "RowTemplate",
            _$parentName: "DataSource",
            screen: lightSwitchApplication.BrowseDataSources,
            data: lightSwitchApplication.DataSource,
            value: lightSwitchApplication.DataSource
        },
        DataSourceName: {
            _$class: msls.ContentItem,
            _$name: "DataSourceName",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.BrowseDataSources,
            data: lightSwitchApplication.DataSource,
            value: String
        },
        ConnectionString: {
            _$class: msls.ContentItem,
            _$name: "ConnectionString",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.BrowseDataSources,
            data: lightSwitchApplication.DataSource,
            value: String
        },
        DataSourceType: {
            _$class: msls.ContentItem,
            _$name: "DataSourceType",
            _$parentName: "RowTemplate",
            screen: lightSwitchApplication.BrowseDataSources,
            data: lightSwitchApplication.DataSource,
            value: lightSwitchApplication.DataSourceType
        },
        DataSourceTypeTemplate: {
            _$class: msls.ContentItem,
            _$name: "DataSourceTypeTemplate",
            _$parentName: "DataSourceType",
            screen: lightSwitchApplication.BrowseDataSources,
            data: lightSwitchApplication.DataSourceType,
            value: lightSwitchApplication.DataSourceType
        },
        Popups: {
            _$class: msls.ContentItem,
            _$name: "Popups",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.BrowseDataSources
        }
    };

    msls._addEntryPoints(lightSwitchApplication.BrowseDataSources, {
        /// <field>
        /// Called when a new BrowseDataSources screen is created.
        /// <br/>created(msls.application.BrowseDataSources screen)
        /// </field>
        created: [lightSwitchApplication.BrowseDataSources],
        /// <field>
        /// Called before changes on an active BrowseDataSources screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseDataSources screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseDataSources],
        /// <field>
        /// Called after the DataSourceList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataSourceList_postRender: [$element, function () { return new lightSwitchApplication.BrowseDataSources().findContentItem("DataSourceList"); }],
        /// <field>
        /// Called after the DataSource content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataSource_postRender: [$element, function () { return new lightSwitchApplication.BrowseDataSources().findContentItem("DataSource"); }],
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: [$element, function () { return new lightSwitchApplication.BrowseDataSources().findContentItem("RowTemplate"); }],
        /// <field>
        /// Called after the DataSourceName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataSourceName_postRender: [$element, function () { return new lightSwitchApplication.BrowseDataSources().findContentItem("DataSourceName"); }],
        /// <field>
        /// Called after the ConnectionString content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ConnectionString_postRender: [$element, function () { return new lightSwitchApplication.BrowseDataSources().findContentItem("ConnectionString"); }],
        /// <field>
        /// Called after the DataSourceType content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataSourceType_postRender: [$element, function () { return new lightSwitchApplication.BrowseDataSources().findContentItem("DataSourceType"); }],
        /// <field>
        /// Called after the DataSourceTypeTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataSourceTypeTemplate_postRender: [$element, function () { return new lightSwitchApplication.BrowseDataSources().findContentItem("DataSourceTypeTemplate"); }]
    });

    lightSwitchApplication.AddEditDataSource.prototype._$contentItems = {
        Tabs: {
            _$class: msls.ContentItem,
            _$name: "Tabs",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.AddEditDataSource
        },
        Details: {
            _$class: msls.ContentItem,
            _$name: "Details",
            _$parentName: "Tabs",
            screen: lightSwitchApplication.AddEditDataSource,
            data: lightSwitchApplication.AddEditDataSource,
            value: lightSwitchApplication.AddEditDataSource
        },
        columns: {
            _$class: msls.ContentItem,
            _$name: "columns",
            _$parentName: "Details",
            screen: lightSwitchApplication.AddEditDataSource,
            data: lightSwitchApplication.AddEditDataSource,
            value: lightSwitchApplication.DataSource
        },
        left: {
            _$class: msls.ContentItem,
            _$name: "left",
            _$parentName: "columns",
            screen: lightSwitchApplication.AddEditDataSource,
            data: lightSwitchApplication.DataSource,
            value: lightSwitchApplication.DataSource
        },
        DataSourceName: {
            _$class: msls.ContentItem,
            _$name: "DataSourceName",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditDataSource,
            data: lightSwitchApplication.DataSource,
            value: String
        },
        ConnectionString: {
            _$class: msls.ContentItem,
            _$name: "ConnectionString",
            _$parentName: "left",
            screen: lightSwitchApplication.AddEditDataSource,
            data: lightSwitchApplication.DataSource,
            value: String
        },
        DataSourceType: {
            _$class: msls.ContentItem,
            _$name: "DataSourceType",
            _$parentName: "columns",
            screen: lightSwitchApplication.AddEditDataSource,
            data: lightSwitchApplication.DataSource,
            value: lightSwitchApplication.DataSourceType
        },
        RowTemplate: {
            _$class: msls.ContentItem,
            _$name: "RowTemplate",
            _$parentName: "DataSourceType",
            screen: lightSwitchApplication.AddEditDataSource,
            data: lightSwitchApplication.DataSourceType,
            value: lightSwitchApplication.DataSourceType
        },
        Popups: {
            _$class: msls.ContentItem,
            _$name: "Popups",
            _$parentName: "RootContentItem",
            screen: lightSwitchApplication.AddEditDataSource
        }
    };

    msls._addEntryPoints(lightSwitchApplication.AddEditDataSource, {
        /// <field>
        /// Called when a new AddEditDataSource screen is created.
        /// <br/>created(msls.application.AddEditDataSource screen)
        /// </field>
        created: [lightSwitchApplication.AddEditDataSource],
        /// <field>
        /// Called before changes on an active AddEditDataSource screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditDataSource screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditDataSource],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: [$element, function () { return new lightSwitchApplication.AddEditDataSource().findContentItem("Details"); }],
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: [$element, function () { return new lightSwitchApplication.AddEditDataSource().findContentItem("columns"); }],
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: [$element, function () { return new lightSwitchApplication.AddEditDataSource().findContentItem("left"); }],
        /// <field>
        /// Called after the DataSourceName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataSourceName_postRender: [$element, function () { return new lightSwitchApplication.AddEditDataSource().findContentItem("DataSourceName"); }],
        /// <field>
        /// Called after the ConnectionString content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ConnectionString_postRender: [$element, function () { return new lightSwitchApplication.AddEditDataSource().findContentItem("ConnectionString"); }],
        /// <field>
        /// Called after the DataSourceType content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataSourceType_postRender: [$element, function () { return new lightSwitchApplication.AddEditDataSource().findContentItem("DataSourceType"); }],
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: [$element, function () { return new lightSwitchApplication.AddEditDataSource().findContentItem("RowTemplate"); }]
    });

}(msls.application));