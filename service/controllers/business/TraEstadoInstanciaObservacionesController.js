var TraEstadoInstanciaObservacionesService = require('../../service/business/TraEstadoInstanciaObservacionesService.js');

// TraEstadoInstanciaObservacionesController Routes
secureRoutes.post('/TraEstadoInstanciaObservaciones/CreateOrUpdate', TraEstadoInstanciaObservacionesService.CreateOrUpdate)