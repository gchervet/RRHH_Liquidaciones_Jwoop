/* General configuration */
var bcrypt = require('bcrypt');
var ActiveDirectory = require('activedirectory');
var JWT = require('jsonwebtoken');
var sessionTokenService = require('../../model/configuration/SessionTokenModel');
var UserModel = require('../../model/configuration/UserModel');

var LDAPConfig = {
    url: 'LDAP://AR-WINDC-01.central.kennedy.edu.ar',
    baseDN: 'dc=KENNEDY,dc=edu.ar'
}
var activeDirectory = new ActiveDirectory(LDAPConfig);

/* Particular configuration */
var roleController = require('../../controllers/configuration/RoleController.js');
var roleService = require('../../service/configuration/RoleService.js');
var expireSeconds = 4000;

module.exports.Authenticate = function (req, res) {

    /* Se espera un JSON como el siguiente */
    //{
    //  "username":"usuario@kennedy.edu.ar",
    //  "password":"2"
    //}    

    if (settings.connectionType == "database") {

        // Se encripta el password y se verifica que sea igual al de la BDD
        UserModel.GetPasswordHashByUsername(req.body.UserName).then(function (result) {
            if (result[0]) {
                bcrypt.compare(req.body.Password, result[0].Password, function (err, resCompare) {
                    // Comparacion de password
                    if (resCompare) {
                        // El password es correcto

                        sessionTokenService.ValidateIfTokenAndUserAreLoggedIn({ username: req.body.UserName }).then(resolve => {

                            if (!resolve || (resolve.length == 0)) {
                                // No hay registros del usuario
                                var user = {
                                    username: req.body.UserName,
                                    email: req.body.Password
                                }
                                var token = JWT.sign(user, process.env.SECRET_KEY, {
                                    expiresIn: expireSeconds
                                });
                                sessionTokenService.CreateNewSessionToken({ username: req.body.UserName, token: token, expireSeconds: expireSeconds });

                                var usernameWithoutDomain = req.body.UserName.split('@')[0];

                                var permissionListRequest = roleService.GetRolePermissionByUsername;

                                permissionListRequest(usernameWithoutDomain).then(permissionResult => {

                                    res.json({
                                        ValidLogin: true,
                                        ResponseMessage: null,
                                        Error: null,
                                        ResponseStatus: 200,
                                        Token: token,
                                        name: req.body.UserName,
                                        permissions: permissionResult,
                                        FailedLoginCode: 1
                                    })

                                });

                            }
                            else {
                                // Llego un registro del usuario
                                var actualSessionToken = resolve.recordset[0];

                                if (actualSessionToken.ExpirationDate.valueOf() > new Date().valueOf() && !actualSessionToken.Expired) {

                                    // Hay que marcar la baja logica del token anterior
                                    sessionTokenService.DeleteTokenLogically({ username: actualSessionToken.Username, token: actualSessionToken.SessionToken });

                                }
                                var user = {
                                    username: req.body.UserName,
                                    email: req.body.Password
                                }

                                var token = JWT.sign(user, process.env.SECRET_KEY, {
                                    expiresIn: expireSeconds
                                });

                                // Almacenamos el nuevo token en la base
                                sessionTokenService.CreateNewSessionToken({ username: req.body.UserName, token: token, expireSeconds: expireSeconds });

                                // Permission list
                                var permissionListRequest = roleService.GetRolePermissionByUsername;
                                var permissionList = [];
                                var usernameWithoutDomain = req.body.UserName.split('@')[0];

                                permissionListRequest(usernameWithoutDomain).then(permissionResult => {

                                    res.json({
                                        ValidLogin: true,
                                        ResponseMessage: null,
                                        Error: null,
                                        ResponseStatus: 200,
                                        Token: token,
                                        name: req.body.UserName,
                                        permissions: permissionResult,
                                        FailedLoginCode: 1
                                    })
                                });
                            }
                        });
                    }
                    else {
                        // El password es incorrecto
                        res.json({
                            ValidLogin: false,
                            ResponseMessage: 'Invalid password',
                            Error: 'Invalid password',
                            ResponseStatus: null,
                            Token: null,
                            name: req.body.UserName,
                            permissions: [],
                            FailedLoginCode: 2
                        })
                    }
                });
            }
        })
    }
    else {

        activeDirectory.authenticate(req.body.UserName, req.body.Password, function (err, auth) {

            if (err) {
                console.log('ERROR: ' + JSON.stringify(err));
                res.json({
                    ValidLogin: false,
                    ResponseMessage: err,
                    Error: err.error,
                    ResponseStatus: null,
                    Token: null,
                    name: req.body.UserName,
                    permissions: [],
                    FailedLoginCode: 2
                })
            }
            else if (auth) {

                // Authentication success

                sessionTokenService.ValidateIfTokenAndUserAreLoggedIn({ username: req.body.UserName }).then(resolve => {

                    if (resolve.recordset.length == 0) {
                        // No hay registros del usuario
                        var user = {
                            username: req.body.UserName,
                            email: req.body.Password
                        }
                        var token = JWT.sign(user, process.env.SECRET_KEY, {
                            expiresIn: expireSeconds
                        });
                        sessionTokenService.CreateNewSessionToken({ username: req.body.UserName, token: token, expireSeconds: expireSeconds });

                        var usernameWithoutDomain = req.body.UserName.split('@')[0];

                        var permissionListRequest = roleService.GetRolePermissionByUsername;
                        var permissionList = [];
                        permissionListRequest(usernameWithoutDomain).then(permissionResult => {

                            res.json({
                                ValidLogin: true,
                                ResponseMessage: null,
                                Error: null,
                                ResponseStatus: 200,
                                Token: token,
                                name: req.body.UserName,
                                permissions: permissionResult,
                                FailedLoginCode: 1
                            })

                        });

                    }
                    else {
                        // Llego un registro del usuario
                        var actualSessionToken = resolve.recordset[0];

                        if (actualSessionToken.ExpirationDate.valueOf() > new Date().valueOf() && !actualSessionToken.Expired) {

                            // Hay que marcar la baja logica del token anterior
                            sessionTokenService.DeleteTokenLogically({ username: actualSessionToken.Username, token: actualSessionToken.SessionToken });

                        }
                        var user = {
                            username: req.body.UserName,
                            email: req.body.Password
                        }

                        var token = JWT.sign(user, process.env.SECRET_KEY, {
                            expiresIn: expireSeconds
                        });

                        // Almacenamos el nuevo token en la base
                        sessionTokenService.CreateNewSessionToken({ username: req.body.UserName, token: token, expireSeconds: expireSeconds });

                        // Permission list
                        var permissionListRequest = roleService.GetRolePermissionByUsername;
                        var permissionList = [];
                        var usernameWithoutDomain = req.body.UserName.split('@')[0];

                        permissionListRequest(usernameWithoutDomain).then(permissionResult => {

                            res.json({
                                ValidLogin: true,
                                ResponseMessage: null,
                                Error: null,
                                ResponseStatus: 200,
                                Token: token,
                                name: req.body.UserName,
                                permissions: permissionResult,
                                FailedLoginCode: 1
                            })
                        });
                    }
                });
            }
            else {
                // Authentication failure
                res.json({
                    ValidLogin: false,
                    ResponseMessage: null,
                    Error: null,
                    ResponseStatus: 401,
                    Token: null,
                    name: req.body.UserName,
                    permissions: [],
                    FailedLoginCode: 2
                })
            }

        });
    }

};

module.exports.ChangePassword = function (req, res) {
    UserModel.GetPasswordHashByUsername(req.body.UserName).then(function (result) {
        if (result[0]) {
            bcrypt.compare(req.body.Password, result[0].Password, function (err, resCompare) {
                // Comparacion de password
                if (resCompare) {
                    // El password es correcto

                    var saltRounds = 10;
                    bcrypt.hash(req.body.NewPassword, saltRounds, function(err, hash) {
                        //UserModel.ChangePassword(hash)
                    });


                    if (!resolve || (resolve.length == 0)) {
                        // No hay registros del usuario
                        var user = {
                            username: req.body.UserName,
                            email: req.body.Password
                        }
                        var token = JWT.sign(user, process.env.SECRET_KEY, {
                            expiresIn: expireSeconds
                        });
                        sessionTokenService.CreateNewSessionToken({ username: req.body.UserName, token: token, expireSeconds: expireSeconds });

                        var usernameWithoutDomain = req.body.UserName.split('@')[0];

                        var permissionListRequest = roleService.GetRolePermissionByUsername;

                        permissionListRequest(usernameWithoutDomain).then(permissionResult => {

                            res.json({
                                ValidLogin: true,
                                ResponseMessage: null,
                                Error: null,
                                ResponseStatus: 200,
                                Token: token,
                                name: req.body.UserName,
                                permissions: permissionResult,
                                FailedLoginCode: 1
                            })

                        });

                    }
                    else {
                        // Llego un registro del usuario
                        var actualSessionToken = resolve.recordset[0];

                        if (actualSessionToken.ExpirationDate.valueOf() > new Date().valueOf() && !actualSessionToken.Expired) {

                            // Hay que marcar la baja logica del token anterior
                            sessionTokenService.DeleteTokenLogically({ username: actualSessionToken.Username, token: actualSessionToken.SessionToken });

                        }
                        var user = {
                            username: req.body.UserName,
                            email: req.body.Password
                        }

                        var token = JWT.sign(user, process.env.SECRET_KEY, {
                            expiresIn: expireSeconds
                        });

                        // Almacenamos el nuevo token en la base
                        sessionTokenService.CreateNewSessionToken({ username: req.body.UserName, token: token, expireSeconds: expireSeconds });

                        // Permission list
                        var permissionListRequest = roleService.GetRolePermissionByUsername;
                        var usernameWithoutDomain = req.body.UserName.split('@')[0];

                        permissionListRequest(usernameWithoutDomain).then(permissionResult => {

                            res.json({
                                ValidLogin: true,
                                ResponseMessage: null,
                                Error: null,
                                ResponseStatus: 200,
                                Token: token,
                                name: req.body.UserName,
                                permissions: permissionResult,
                                FailedLoginCode: 1
                            })
                        });
                    }
                }
                else {
                    // El password es incorrecto
                    res.json({
                        ValidLogin: false,
                        ResponseMessage: 'Invalid password',
                        Error: 'Invalid password',
                        ResponseStatus: null,
                        Token: null,
                        name: req.body.UserName,
                        permissions: [],
                        FailedLoginCode: 2
                    })
                }
            });
        }
    })
}