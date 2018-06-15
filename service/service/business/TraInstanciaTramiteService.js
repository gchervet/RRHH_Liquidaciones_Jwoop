var TraInstanciaTramiteModel = require('../../model/business/TraInstanciaTramiteModel');

module.exports.GetAll = function(req, res){

    return TraInstanciaTramiteModel.GetAll().then(function(result, $filter){
        
        var rtn = [];
        if(result.recordset){
            result.recordset.forEach(element => {
                
                if(element){
                    // Se arma el DTO
                    var resultDTO = {
                        IdInstanciaTramite : element.IdInstanciaTramite,
                        IdInstanciaTramiteActivo: element.IdInstanciaTramiteActivo,
                        IdTramite : element.FK_IdTramite,
                        FechaComienzo : element.FechaComienzo,
                        FechaFin : element.FechaFin,
                        IdentificadorInteresado : element.IdentificadorInteresado
                    }
                    rtn.push(resultDTO);
                }
            });
        }

        res.json(rtn);
    });
}

module.exports.Create = function(req, res){

    return TraInstanciaTramiteModel.Create(req.body).then(function(result, $filter){
        
        var rtn = [];
        if(result.recordset){
            result.recordset.forEach(element => {
                
                if(element){
                    // Se arma el DTO
                    var resultDTO = {
                        IdInstanciaTramite : element.IdInstanciaTramite,
                        IdTramite : element.FK_IdTramite,
                        FechaComienzo : element.FechaComienzo,
                        FechaFin : element.FechaFin,
                        IdentificadorInteresado : element.IdentificadorInteresado,
                        Prioridad : element.Prioridad
                    }
                    rtn.push(resultDTO);
                }
            });
        }

        res.json(rtn);
    });
}

module.exports.Update = function(req, res){

    return TraInstanciaTramiteModel.Update(req.body).then(function(result, $filter){
        
        var rtn = [];
        if(result.recordset){
            result.recordset.forEach(element => {
                
                if(element){
                    // Se arma el DTO
                    var resultDTO = {
                        IdInstanciaTramite : element.IdInstanciaTramite,
                        IdTramite : element.FK_IdTramite,
                        FechaComienzo : element.FechaComienzo,
                        FechaFin : element.FechaFin,
                        IdentificadorInteresado : element.IdentificadorInteresado,
                        Prioridad : element.Prioridad
                    }
                    rtn.push(resultDTO);
                }
            });
        }

        res.json(rtn);
    });
}


module.exports.GetTramiteInstanciaByLegajo = function(req, res){

    return TraInstanciaTramiteModel.GetTramiteInstanciaByLegajo(req.params.legajo, req.params.idUsuario).then(function(result, $filter){
        
        var rtn = [];
        var sizeResult = 0;
        var pivotResult = 0;
        if(result.recordset){
            sizeResult=result.recordset.length;
            if (sizeResult==0){
                res.json(rtn);
            }
            result.recordset.forEach(element => {
                var FechaFinalizacionEstimadaAux=0;
                TraInstanciaTramiteModel.GetDuracionEstimadoTramite(element.IdTramiteDef).then(function(result, $filter){
                    FechaFinalizacionEstimadaAux=result.recordset[0].DuracionLimiteTarea;
                    if(element){
                        // Se arma el DTO
                        var resultDTO = {
                            IdTramite : element.IdTramite,
                            Nombre : element.Nombre,
                            Descripcion: element.Descripcion,
                            IdentificadorInteresado : element.IdentificadorInteresado,
                            IdInstanciaTramite : element.IdInstanciaTramite,
                            IdInstanciaTramiteActivo : element.IdInstanciaTramiteActivo,
                            FechaComienzo : element.FechaComienzo,
                            FechaFinalizacionEstimada : FechaFinalizacionEstimadaAux,
                            FechaFin : element.FechaFin,
                            NombreEstadoParaAlumno: element.nombreEstadoParaAlumno,
                            EstadoEstado: element.EstadoEstado,
                            IdEstadoInstancia: element.IdEstadoInstancia,
                            ValoresEntrada: element.ValoresEntrada,
                            ValoresSalida: element.ValoresSalida
                        }
                        pivotResult++;
                        rtn.push(resultDTO);
                        if (sizeResult==pivotResult){
                            res.json(rtn);
                        }
                    }
                });
            });
        }
    });
}