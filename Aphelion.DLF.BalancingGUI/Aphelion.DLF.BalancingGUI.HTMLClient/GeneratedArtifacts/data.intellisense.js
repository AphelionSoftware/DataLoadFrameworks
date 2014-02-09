/// <reference path="data.js" />

(function (lightSwitchApplication) {

    msls._addEntryPoints(lightSwitchApplication.DataSource, {
        /// <field>
        /// Called when a new dataSource is created.
        /// <br/>created(msls.application.DataSource entity)
        /// </field>
        created: [lightSwitchApplication.DataSource]
    });

    msls._addEntryPoints(lightSwitchApplication.DataSourceType, {
        /// <field>
        /// Called when a new dataSourceType is created.
        /// <br/>created(msls.application.DataSourceType entity)
        /// </field>
        created: [lightSwitchApplication.DataSourceType]
    });

    msls._addEntryPoints(lightSwitchApplication.FunctionalArea, {
        /// <field>
        /// Called when a new functionalArea is created.
        /// <br/>created(msls.application.FunctionalArea entity)
        /// </field>
        created: [lightSwitchApplication.FunctionalArea]
    });

    msls._addEntryPoints(lightSwitchApplication.Query, {
        /// <field>
        /// Called when a new query is created.
        /// <br/>created(msls.application.Query entity)
        /// </field>
        created: [lightSwitchApplication.Query]
    });

    msls._addEntryPoints(lightSwitchApplication.Result, {
        /// <field>
        /// Called when a new result is created.
        /// <br/>created(msls.application.Result entity)
        /// </field>
        created: [lightSwitchApplication.Result]
    });

    msls._addEntryPoints(lightSwitchApplication.Run, {
        /// <field>
        /// Called when a new run is created.
        /// <br/>created(msls.application.Run entity)
        /// </field>
        created: [lightSwitchApplication.Run]
    });

    msls._addEntryPoints(lightSwitchApplication.Test, {
        /// <field>
        /// Called when a new test is created.
        /// <br/>created(msls.application.Test entity)
        /// </field>
        created: [lightSwitchApplication.Test]
    });

}(msls.application));
