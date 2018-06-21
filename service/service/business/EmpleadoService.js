var EmpleadoModel = require('../../model/business/EmpleadoModel.js');

module.exports.GetAll = function (req, res) {

    return EmpleadoModel.GetAll().then(function (result, $filter) {

        var rtn = [];
        if (result.recordset) {
            result.recordset.forEach(element => {

                if (element) {
                    // Se arma el DTO
                    var resultDTO = {
                        Legajo: element.Legajo,
                        Nombre: element.Nombre,
                        CUITCUIL: element.CUITCUIL,
                        Sexo: element.Sexo,
                        Direccion: element.Direccion,
                        Telefono: element.Telefono,
                        Celular: element.Celular,
                        EstadoCivil: element.EstadoCivil,
                        Email: element.Email,
                        DNI: element.DNI,
                        FechaIngreso: element.FechaIngreso,
                        CentroCosto: element.CentroCosto,
                        Categoria: element.Categoria,
                        Cargo: element.Cargo,
                        Convenio: element.Convenio
                    }
                    rtn.push(resultDTO);
                }
            });
        }

        res.json(rtn);
    });
}
