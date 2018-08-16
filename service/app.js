global.settings = require('../service/config/settings.json')
var express = require('express');
global.app = express();  
var server = require('http').createServer(app);  
global.io = require('socket.io')(server);

var bodyParser = require('body-parser');
var cors = require('cors');
var jwt = require('jsonwebtoken');

process.env.SECRET_KEY = "JWOOP_3142";

global.secureRoutes = express.Router();

// App uses
app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json({ limit: '5mb' }));
app.use('/secure-api', secureRoutes);
// Add headers
app.use(cors());
secureRoutes.use(cors());
//Validation middleware
secureRoutes.use(function(req, res, correctCallbackFunction){
    var token = req.body.token || req.headers['token'];

    if(token){
        //res.send("we have a token");
        jwt.verify(token, process.env.SECRET_KEY, function(err, decode){
            if(err){
                io.emit('401_invalid_token_error');
                res.status(401).send("Invalid token");
            } else {
                correctCallbackFunction();
            }
        });
    } else {
        res.status(401);
        res.send("please send a token");
    }

});


/*1. Se cargan los controladores */

//Configuartion Controllers
var menuController = require('./controllers/configuration/MenuController');
var roleController = require('./controllers/configuration/RoleController');
// Business Controllers
var sessionController = require('./controllers/business/SessionController');
var empleadoController = require('./controllers/business/EmpleadoController');
var reciboController = require('./controllers/business/ReciboController');

// Socket connection
io.on('connection', function(socket){
    console.log('a user connected');
});

server.listen(9009, function(){
    console.log("server running on port 9009");
})  