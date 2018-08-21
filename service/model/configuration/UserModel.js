var mysql = require('mysql');
var config = require('../../config/db-configuration.json')

var connection = mysql.createConnection(config);

connection.connect();

exports.CheckUserAndPassword = function (username, password) {
    console.log('User/CheckUserAndPassword');
    return new sql.ConnectionPool(config).connect().then(pool => {
        return pool.request().query("SELECT * FROM USER WHERE USERNAME = '" + username + "' AND PASSWORD = '" + password + "'")
    });
}

exports.GetPasswordHashByUsername = function (username) {
    return new Promise(function (res, rej) {
        connection.query("SELECT `Password` FROM `User` WHERE Username = '" + username + "'", function (error, results, fields) {
            res(results);
        });
    });
}