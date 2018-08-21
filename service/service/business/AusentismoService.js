var AusentismoModel = require('../../model/business/AusentismoModel.js');

module.exports.GetAll = function (req, res) {

    return AusentismoModel.GetAll().then(function (result, $filter) {

        var rtn = [];
        if (result) {
            result.forEach(element => {

                if (element) {
                    // Se arma el DTO
                    var resultDTO = {
                        Codigo: element.Codigo,
                        FechaIni: element.Fecha_ini, 
                        Dias: element.Dias, 
                        FechaFin: element.Fecha_fin, 
                        FechaLic: element.Fecha_lic, 
                        Rebsal: element.Rebsal, 
                        Escon: element.Escon, 
                        Tipo: element.Tipo, 
                        Dtipo: element.Dtipo, 
                        Causal: element.Causal, 
                        Dcausal: element.Dcausal, 
                        Detalle: element.Detalle, 
                        Medico: element.Medico, 
                        DiasE: element.DiasE, 
                        Medios: element.Medios, 
                        Diagnos: element.Diagnos, 
                        Mailen: element.Mailen, 
                        Rutpro: element.Rutpro, 
                        Especia: element.Especia, 
                        MontAn: element.MontAn, 
                        MontoRe: element.MontoRe, 
                        FechaRet: element.Fecha_ret, 
                        Estado: element.Estado, 
                        Nulic: element.Nulic, 
                        FechaEnv: element.Fecha_env, 
                        CodSub: element.CodSub, 
                        FechaIco: element.Fecha_ico, 
                        SubsilB: element.SubsilB, 
                        SubsilN: element.SubsilN, 
                        Dias3pd: element.Dias3pd, 
                        Origen: element.Origen, 
                        FechaIng: element.Fecha_ing, 
                        Usuario: element.Usuario, 
                        Fechault: element.Fecha_ult, 
                        Jdd: element.Jdd, 
                        Dv: element.Dv
                    }
                    rtn.push(resultDTO);
                }
            });
        }

        res.json(rtn);
    });
}
