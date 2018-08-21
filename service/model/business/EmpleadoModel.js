var mysql = require('mysql');
var config = require('../../config/db.json')

var connection = mysql.createConnection(config);
connection.connect();

exports.GetAll = function (legProvi) {
  console.log('Empleado/GetAll');
    return new Promise(function (res, rej) {
      connection.query(
        
        'select ' +

        'remp.Codigo as Legajo,  ' +
        'remp.Nombre,  ' +
        'remp.Rut as CUITCUIL,  ' +
        'remp.Sexo,  ' +
        'remp.Direccion,   ' +
        'remp.Fono as Telefono,  ' +
        'remp.Celular,  ' +
        'remp.Est_civil as EstadoCivil,  ' +
        'remp.pmail as Email,   ' +
        'remp.Numdoc as DNI,  ' +
        'remp.Fecha_ing as FechaIngreso,   ' +
        'descCencos.Cencos as CentroCosto,  ' +
        'descCatego.Catego as Categoria,  ' +
        'descCargo.Cargo as Cargo,  ' +
        'descConvenio.Convenio as Convenio   ' +
      
      'from REMPLES as remp   ' +
      'CROSS JOIN (select rt1.Descrip as Cencos  from RTABLAS rt1 where rt1.Cotab=1 AND rt1.Codigo in (select Cencos from REMPLES)) descCencos    ' +
      'CROSS JOIN (select rt2.Descrip as Catego  from RTABLAS rt2 where rt2.Cotab=2 AND rt2.Codigo in (select Catego from REMPLES)) descCatego   ' +
      'CROSS JOIN (select rt3.Descrip as Cargo  from RTABLAS rt3 where rt3.Cotab=3 AND rt3.Codigo  in (select Cargo from REMPLES)) descCargo   ' +
      'CROSS JOIN (select rt4.Descrip as Convenio  from RTABLAS rt4 where rt4.Cotab=49 AND rt4.Codigo in (select Convenio from REMPLES)) descConvenio ',
        function (error, results, fields) {
          res(results);
        });
    });
  }
