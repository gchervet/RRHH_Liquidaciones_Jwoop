var SessionService = require('../../service/configuration/SessionService.js');
var jwt = require('jsonwebtoken');

//Service Routes
app.post('/api/authenticate', SessionService.Authenticate);
secureroutes.post('/api/changePassword', SessionService.changePassword);