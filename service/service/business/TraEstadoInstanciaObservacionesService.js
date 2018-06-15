var TraInstanciaTramiteObservacionesModel = require('../../model/business/TraEstadoInstanciaObservacionesModel');

module.exports.CreateOrUpdate = function(req, res){
    return TraInstanciaTramiteObservacionesModel.CreateOrUpdate(req.body.Texto, req.body.IdInstanciaTramite, req.body.IdEstadoInstancia, req.body.IdUsuarioAsignado).then(function(result, $filter){
        var rtn = [];
        if(result.recordset){
            result.recordset.forEach(element => {
                
                if(element){
                    // Se arma el DTO
                    var resultDTO = {
                        IdObservaciones: element.IdObservaciones,
                        Texto: element.Texto,
                        IdInstanciaTramite: element.FK_IdInstanciaTramite
                    }
                    rtn.push(resultDTO);
                }
            });
        }        
        io.emit("TraInstanciaTramite.Socket_UpdateTraInstanciaGrid", {test:123});
        res.json(rtn);
    });
}
