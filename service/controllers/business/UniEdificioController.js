var UniEdificioService = require('../../service/business/UniEdificioService');

// UniEdificio routes
secureRoutes.get('/UniEdificio/GetAll', UniEdificioService.GetAll);
secureRoutes.get('/UniEdificio/GetEdificioByCodins', UniEdificioService.GetEdificioByCodins);
secureRoutes.get('/UniEdificio/GetEdificioConstancia', UniEdificioService.GetEdificioConstancia);
secureRoutes.get('/UniEdificio/GetEdificioLibretaUniversitaria', UniEdificioService.GetEdificioLibretaUniversitaria);