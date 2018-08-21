var mysql = require('mysql');
var config = require('../../config/db-configuration.json')

var connection = mysql.createConnection(config);
connection.connect();

exports.GetAll = function() {
  console.log('Menu/GetAll');
  return new Promise(function (res, rej) {
    connection.query('CALL SP_MenuGroup_Menu_Permission_GetAll()',
      function (error, results, fields) {
        res(results);
      });
  });

}