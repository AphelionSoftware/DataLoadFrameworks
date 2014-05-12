/// <reference path="data.js" />

(function (lightSwitchApplication) {

    msls._addEntryPoints(lightSwitchApplication.Database, {
        /// <field>
        /// Called when a new database is created.
        /// <br/>created(msls.application.Database entity)
        /// </field>
        created: [lightSwitchApplication.Database]
    });

    msls._addEntryPoints(lightSwitchApplication.Package, {
        /// <field>
        /// Called when a new package is created.
        /// <br/>created(msls.application.Package entity)
        /// </field>
        created: [lightSwitchApplication.Package]
    });

    msls._addEntryPoints(lightSwitchApplication.Run, {
        /// <field>
        /// Called when a new run is created.
        /// <br/>created(msls.application.Run entity)
        /// </field>
        created: [lightSwitchApplication.Run]
    });

    msls._addEntryPoints(lightSwitchApplication.RunStep, {
        /// <field>
        /// Called when a new runStep is created.
        /// <br/>created(msls.application.RunStep entity)
        /// </field>
        created: [lightSwitchApplication.RunStep]
    });

    msls._addEntryPoints(lightSwitchApplication.Test, {
        /// <field>
        /// Called when a new test is created.
        /// <br/>created(msls.application.Test entity)
        /// </field>
        created: [lightSwitchApplication.Test]
    });

    msls._addEntryPoints(lightSwitchApplication.TestStep, {
        /// <field>
        /// Called when a new testStep is created.
        /// <br/>created(msls.application.TestStep entity)
        /// </field>
        created: [lightSwitchApplication.TestStep]
    });

}(msls.application));
