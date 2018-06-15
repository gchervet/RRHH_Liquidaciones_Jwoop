var TraEstadoInstanciaService = require('../../service/business/TraEstadoInstanciaService.js');

// TraEstadoInstancia routes
secureRoutes.get('/TraEstadoInstancia/GetEstadoInstanciaListByUsername/:username', TraEstadoInstanciaService.GetEstadoInstanciaListByUsername);
secureRoutes.get('/TraEstadoInstancia/GetByIdInstanciaTramite/:idInstanciaTramite', TraEstadoInstanciaService.GetByIdInstanciaTramite);
secureRoutes.get('/TraEstadoInstancia/GetByIdEstadoInstancia/:idEstadoInstancia', TraEstadoInstanciaService.GetByIdEstadoInstancia);
secureRoutes.post('/TraEstadoInstancia/Update', TraEstadoInstanciaService.Update);
secureRoutes.post('/TraEstadoInstancia/Create', TraEstadoInstanciaService.Create);
secureRoutes.get('/TraEstadoInstancia/GetEstadoInstanciaByGrupoAsignadoAndIdUsuario/:idGrupo/:idUsuario', TraEstadoInstanciaService.GetEstadoInstanciaByGrupoAsignadoAndIdUsuario);
secureRoutes.get('/TraEstadoInstancia/GetPendingEstadosInstanciaByIdEstadoInstancia/:idEstadoInstancia', TraEstadoInstanciaService.GetPendingEstadosInstanciaByIdEstadoInstancia);
secureRoutes.get('/TraEstadoInstancia/GetPossibleAssignationUsuarios/:idEstadoInstancia', TraEstadoInstanciaService.GetPossibleAssignationUsuarios);