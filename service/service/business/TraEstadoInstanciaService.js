var TraEstadoInstanciaModel = require('../../model/business/TraEstadoInstanciaModel');

/* Para uso administrativo, no para el alumno */
module.exports.GetEstadoInstanciaListByUsername = function(req, res){

    return TraEstadoInstanciaModel.GetEstadoInstanciaListByUsername(req.params.username).then(function(result, $filter){
        
        var rtn = [];
        if(result.recordset){
            result.recordset.forEach(element => {
                
                if(element){
                    // Se arma el DTO
                    var resultDTO = {
                        IdTramite : element.IdTramite,
                        NroTramite : element.NroTramite,
                        NombreTramite : element.NombreTramite,
                        NombreTarea : element.NombreTarea,
                        IdentificadorInteresado : element.IdentificadorInteresado,
                        IdInstanciaTramiteActivo : element.NroTramiteActivo,
                        DescripcionTramite: element.DescripcionTramite,
                        DuracionLimiteTarea: element.DuracionLimiteTarea,
                        PrioridadTramite : element.PrioridadTramite,
                        PrioridadInstanciaTramite : element.PrioridadInstanciaTramite,
                        PrioridadEstado : element.PrioridadEstado,
                        PrioridadInstanciaEstado : element.PrioridadInstanciaEstado,
                        IdEstadoEstado : element.IdEstadoEstado,
                        esJefe : element.esJefe,
                        Estado : element.Estado,
                        FechaEntradaBandeja : element.FechaEntradaBandeja,
                        FechaLimite : element.FechaLimite,
                        IdGrupoAsignado : element.IdGrupo,
                        IdUsuarioAsignado : element.IdUsuarioAsignado,
                        UsuarioAsignadoUsername : element.UsuarioAsignadoUsername,
                        UsuarioAsignadoEmail : element.UsuarioAsignadoEmail,
                        NombreGrupoAsignado : element.GrupoAsignado,
                        NroTarea : element.NroTarea,
                        IdTipoEstado : element.IdTipoEstado,
                        TipoEstadoNombre : element.TipoEstadoNombre,
                        Observaciones: element.Observaciones
                    }
                    rtn.push(resultDTO);
                }
            });
        }

        res.json(rtn);
    });
}

module.exports.GetByIdInstanciaTramite = function(req, res){

    return TraEstadoInstanciaModel.GetByIdInstanciaTramite(req.params.idInstanciaTramite).then(function(result, $filter){
        
        var rtn = [];
        if(result.recordset){
            result.recordset.forEach(element => {
                
                if(element){
                    // Se arma el DTO
                    var resultDTO = {
                        IdInstanciaTramite : element.IdInstanciaTramite,
                        IdEstadoDefinicion : element.IdEstadoDefinicion,
                        IdEstadoInstancia : element.IdEstadoInstancia,
                        IdAsignadoUsuario : element.FK_IdAsignadoUsuario,
                        PrioridadEstadoInstancia : element.Prioridad,
                        Comienzo : element.Comienzo,
                        Fin : element.Fin,
                        EstadoEstado : element.EstadoEstado,
                        ValoresEntrada : element.ValoresEntrada,
                        ValoresSalida : element.ValoresSalida,
                        EstadoEstadoNombre : element.EstadoEstadoNombre
                    }
                    rtn.push(resultDTO);
                }
            });
        }

        res.json(rtn);
    });
}

module.exports.GetByIdEstadoInstancia = function(req, res){

    return TraEstadoInstanciaModel.GetByIdEstadoInstancia(req.params.idEstadoInstancia).then(function(result, $filter){
        
        var rtn = [];
        if(result.recordset){
            result.recordset.forEach(element => {
                
                if(element){
                    // Se arma el DTO
                    var resultDTO = {
                        IdInstanciaTramite : element.IdInstanciaTramite,
                        IdEstadoDefinicion : element.IdEstadoDefinicion,
                        IdEstadoInstancia : element.IdEstadoInstancia,
                        IdAsignadoUsuario : element.FK_IdAsignadoUsuario,
                        Comienzo : element.Comienzo,
                        PrioridadEstadoInstancia: element.PrioridadEstadoInstancia,
                        PrioridadEstado: element.PrioridadEstado,
                        Fin : element.Fin,
                        EstadoEstado : element.EstadoEstado,
                        ValoresEntrada : element.ValoresEntrada,
                        ValoresSalida : element.ValoresSalida,
                        EstadoEstadoNombre : element.EstadoEstadoNombre,
                        Pantalla: {
                            IdPantalla: element.IdPantalla,
                            NombrePantalla: element.NombrePantalla
                        }
                    }
                    rtn.push(resultDTO);
                }
            });
        }

        res.json(rtn);
    });
}

module.exports.Update = function(req, res){

    return TraEstadoInstanciaModel.Update(req.body).then(function(result, $filter){
        
        var rtn = [];
        if(result.recordset){
            result.recordset.forEach(element => {
                
                if(element){
                    // Se arma el DTO
                    var resultDTO = {
                        IdInstanciaTramite : element.IdInstanciaTramite,
                        IdEstadoDefinicion : element.IdEstadoDefinicion,
                        FechaEntradaBandeja : element.FechaEntradaBandeja,
                        FechaComienzo : element.FechaComienzo,
                        FechaFin : element.FechaFin,
                        PrioridadEstadoInstancia: element.Prioridad,
                        ValoresEntrada : element.ValoresEntrada,
                        ValoresSalida : element.ValoresSalida,
                        Pantalla: {
                            IdPantalla: element.IdPantalla,
                            NombrePantalla: element.NombrePantalla
                        }
                    }
                    rtn.push(resultDTO);
                }
            });
        }

        io.emit("TraInstanciaTramite.Socket_UpdateTraInstanciaGrid", {test:123});
        res.json(rtn);
    });
}

module.exports.Create = function(req, res){
    
    return TraEstadoInstanciaModel.Create(req.body).then(function(result, $filter){
        
        var rtn = [];
        if(result.recordset){
            result.recordset.forEach(element => {
                
                if(element){
                    // Se arma el DTO
                    var resultDTO = {
                        IdInstanciaTramite : element.IdInstanciaTramite,
                        IdEstadoDefinicion : element.IdEstadoDefinicion,
                        IdEstadoInstancia : element.IdEstadoInstancia,
                        FechaEntradaBandeja : element.FechaEntradaBandeja,
                        FechaComienzo : element.Comienzo,
                        PrioridadEstadoInstancia: element.Prioridad,
                        FechaFin : element.Fin,
                        UsuarioAsignado : element.FK_IdAsignadoUsuario,
                        EstadoEstado : element.EstadoEstado,
                        ValoresEntrada : element.ValoresEntrada,
                        ValoresSalida : element.ValoresSalida
                    }
                    rtn.push(resultDTO);
                }
            });
        }
        io.emit("TraInstanciaTramite.Socket_UpdateTraInstanciaGrid", {test:123});
        res.json(rtn);
    });
}

module.exports.GetEstadoInstanciaByGrupoAsignadoAndIdUsuario  = function(req, res){
    
    return TraEstadoInstanciaModel.GetEstadoInstanciaByGrupoAsignadoAndIdUsuario(req.params.idGrupo, req.params.idUsuario).then(function(result, $filter){
        
        var rtn = [];
        if(result.recordset){
            result.recordset.forEach(element => {
                
                if(element){
                    // Se arma el DTO
                    var resultDTO = {
                        IdInstanciaTramite : element.IdInstanciaTramite,
                        IdEstadoDefinicion : element.IdEstadoDefinicion,
                        IdEstadoInstancia : element.IdEstadoInstancia,
                        FK_IdAsignadoUsuario : element.FK_IdAsignadoUsuario,
                        PrioridadEstadoInstancia: element.Prioridad,
                        Comienzo : element.Comienzo,
                        Fin : element.Fin,
                        EstadoEstado : element.EstadoEstado,
                        ValoresEntrada : element.ValoresEntrada,
                        ValoresSalida : element.ValoresSalida,

                    }
                    rtn.push(resultDTO);
                }
            });
        }

        res.json(rtn);
    });
}

module.exports.GetPendingEstadosInstanciaByIdEstadoInstancia  = function(req, res){
    
    return TraEstadoInstanciaModel.GetPendingEstadosInstanciaByIdEstadoInstancia(req.params.idEstadoInstancia).then(function(result, $filter){
        
        var rtn = [];
        if(result.recordset){
            result.recordset.forEach(element => {
                
                if(element){
                    // Se arma el DTO
                    var resultDTO = {
                        PendingEstadosInstanciaCount: element.PendingEstadosInstanciaCount
                    }
                    rtn.push(resultDTO);
                }
            });
        }

        res.json(rtn);
    });
}

module.exports.GetPossibleAssignationUsuarios  = function(req, res){
    
    return TraEstadoInstanciaModel.GetPossibleAssignationUsuarios(req.params.idEstadoInstancia).then(function(result, $filter){
        
        var rtn = [];
        if(result.recordset){
            result.recordset.forEach(element => {
                
                if(element){
                    // Se arma el DTO
                    var resultDTO = {
                        IdUsuarioAsignado: element.IdUsuarioAsignado,
                        Username: element.Username,
                        Email: element.Email,
                        NombreGrupo: element.NombreGrupo,
                        IdGrupo: element.IdGrupo,
                    }
                    rtn.push(resultDTO);
                }
            });
        }

        res.json(rtn);
    });
}
