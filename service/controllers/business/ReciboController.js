var ReciboService = require('../../service/business/ReciboService.js');

secureRoutes.get('/Recibo/GetReciboList/:legProvi/:ames', ReciboService.GetReciboList);

