var EmpleadoService = require('../../service/business/EmpleadoService.js');

secureRoutes.get('/Empleado/GetAll', EmpleadoService.GetAll);

