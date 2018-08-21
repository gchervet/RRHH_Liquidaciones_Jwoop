var mysql = require('mysql');
var config = require('../../config/db-configuration.json')

var connection = mysql.createConnection(config);
connection.connect();

exports.ValidateIfTokenAndUserAreLoggedIn = function (data) {
  console.log('SessionToken/ValidateIfTokenAndUserAreLoggedIn');
  return new Promise(function (res, rej) {
    connection.query("SELECT Username, ExpirationDate = (SELECT DATEADD(mi, DATEDIFF(mi, GETDATE(), GETUTCDATE()), max(ExpirationDate))) , Expired FROM SessionToken where username = '" + data.username + "'  GROUP BY Username, Expired", 
    function (error, results, fields) {
      res(results);
    });
  });
}

exports.DeleteTokenLogically = function (data) {
  console.log('SessionToken/DeleteTokenLogically');
  return new Promise(function (res, rej) {
    connection.query("UPDATE SessionToken SET Expired = true where username = '" + data.username + "' and SessionToken = '" + data.token + "'", function (error, results, fields) {
      res(results);
    });
  });
}

exports.CreateNewSessionToken = function (data) {
  console.log('SessionToken/CreateNewSessionToken');
  return new Promise(function (res, rej) {
    connection.query("INSERT INTO SessionToken values ('" + data.username + "','" + data.token + "',getdate(),DATEADD(ss," + data.expireSeconds + ",getdate()),0)", function (error, results, fields) {
      res(results);
    });
  });
}