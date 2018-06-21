var sql = require('mssql');
var config = require('../../config/db.json')

exports.GetAll = function (legProvi) {
  console.log('Empleado/GetAll');
  return new sql.ConnectionPool(config).connect().then(pool => {
      return pool.request().query(
            "select remp.Codigo as Legajo, Nombre, Rut as 'CUITCUIL', Sexo, Direccion, " +
            'Fono as Telefono, Celular, Est_civil as EstadoCivil, pmail as Email, ' +
            'Numdoc as DNI, Fecha_ing as FechaIngreso, ' +
            'descCencos.Cencos as CentroCosto, descCatego.Catego as Categoria, descCargo.Cargo as Cargo, descConvenio.Convenio as Convenio ' +
        'from REMPLES remp ' +
        'cross apply (select rt1.Descrip as Cencos  from RTABLAS rt1 where rt1.Cotab=1 AND rt1.Codigo=remp.Cencos) descCencos ' + 
        'cross apply (select rt2.Descrip as Catego  from RTABLAS rt2 where rt2.Cotab=2 AND rt2.Codigo=remp.Catego) descCatego ' +
        'cross apply (select rt3.Descrip as Cargo  from RTABLAS rt3 where rt3.Cotab=3 AND rt3.Codigo=remp.Cargo) descCargo ' +
        'cross apply (select rt4.Descrip as Convenio  from RTABLAS rt4 where rt4.Cotab=49 AND rt4.Codigo=remp.Convenio) descConvenio'
      )
    });
  }
