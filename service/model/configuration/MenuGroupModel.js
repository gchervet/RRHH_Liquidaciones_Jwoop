var mysql = require('mysql');
var config = require('../../config/db-configuration.json')

var connection = mysql.createConnection(config);
connection.connect();

exports.GetAll = function() {
  console.log('MenuGroup/GetAll');
  return new Promise(function (res, rej) {
    connection.query("CALL SP_MenuGroup_Menu_Permission_GetAll()",
      function (error, results, fields) {
        res(results[0]);
      });
  });

}

exports.GetById = function(idMenu) {
  console.log('MenuGroup/GetById');
  return new Promise(function (res, rej) {
    connection.query('select * from Menu where IdMenu = ' + idMenu,
      function (error, results, fields) {
        res(results[0]);
      });
  });
}

exports.GetMenuPermissionByMenuId = function(idMenu) {
  console.log('MenuGroup/GetMenuPermissionByMenuId');
  return new Promise(function (res, rej) {
    connection.query('select * from MenuPermission where IdMenu = ' + idMenu,
      function (error, results, fields) {
        res(results);
      });
  });

}