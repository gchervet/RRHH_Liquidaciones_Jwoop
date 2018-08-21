var ReciboModel = require('../../model/business/ReciboModel.js');

module.exports.GetReciboList = function (req, res) {

    return ReciboModel.GetReciboList(req.params.legProvi, req.params.ames).then(function (result, $filter) {

        var rtn = [];
        if (result) {
            result.forEach(element => {

                if (element) {
                    // Se arma el DTO
                    var resultDTO = {
                        CodigoConcepto: element.CodigoConcepto,
                        TimpoDeConceptoLiquidacion: element.TimpoDeConceptoLiquidacion,
                        DescripcionConcepto: element.DescripcionConcepto,
                        Monto: element.Monto,
                        ValorOriginal: element.ValorOriginal,
                        Empresa: element.Empresa,
                        Tipo: element.Tipo,
                        Inform: element.Inform
                    }
                    rtn.push(resultDTO);
                }
            });
        }

        res.json(rtn);
    });
}
