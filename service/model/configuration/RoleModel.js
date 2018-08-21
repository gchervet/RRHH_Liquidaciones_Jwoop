var mysql = require('mysql');
var config = require('../../config/db-configuration.json')

var connection = mysql.createConnection(config);
connection.connect();

exports.GetRolePermissionByUsername = function (username) {
  console.log('Role/GetRolePermissionByUsername');
  return new Promise(function (res, rej) {
    connection.query(
      "SELECT * FROM Permission " +
      "WHERE Id in " +
      "(" +
        "SELECT IdPermission FROM RolePermission " +
        "WHERE IdRole = " +
        "(" +
          "SELECT idRole FROM UserRole " +
          "WHERE Username = '" + username + "' " +
        ") " +
      ");",
      function (error, results, fields) {
        res(results);
      });
  });
}