var FileService = require('../../service/business/FileService.js');

secureRoutes.post('/PDF/Generate', FileService.PDFGenerate);

