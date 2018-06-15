var TraInstanciaTramiteService = require('../../service/business/TraInstanciaTramiteService.js');

// TraInstanciaTramite routes
secureRoutes.get('/TraInstanciaTramite/GetAll', TraInstanciaTramiteService.GetAll);
secureRoutes.post('/TraInstanciaTramite/Create', TraInstanciaTramiteService.Create);
secureRoutes.post('/TraInstanciaTramite/Update', TraInstanciaTramiteService.Update);
secureRoutes.get('/TraInstanciaTramite/GetTramiteInstanciaByLegajo/:legajo/:idUsuario', TraInstanciaTramiteService.GetTramiteInstanciaByLegajo);

app.get('/api/TraInstanciaTramite/ShowNotification', function (param) {
    io.emit("TraInstanciaTramite.ShowNotification", "TraInstanciaTramite");
    return true;
});

app.get('/api/TraInstanciaTramite/ShowNotificationObservaciones', function (param) {
    io.emit("TraInstanciaTramite.ShowNotificationObservation", "TraInstanciaTramite");
    return true;
});

app.get('/api/TraInstanciaTramite/SocketUpdateTraInstanciaGrid', function (param) {
    io.emit("TraInstanciaTramite.Socket_UpdateTraInstanciaGrid", { test: 123 });
    return true;
});
