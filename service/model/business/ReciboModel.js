var mysql = require('mysql');
var config = require('../../config/db.json')

var connection = mysql.createConnection(config);
connection.connect();

  exports.GetReciboList = function(legProvi, ames){
    console.log('Recibo/GetReciboList');
      return new Promise(function (res, rej) {
        connection.query(
          "select Cohade as CodigoConcepto, Tipo as TimpoDeConceptoLiquidacion, Descitm as DescripcionConcepto, Monto as Monto, Vo as ValorOriginal, Empresa as Empresa, Tipo, Inform, Orden from RLIQUID " +
          "where Codigo=" + legProvi + " AND Ames='" + ames + "' AND Peri='1' AND Inform='N' " +
          "union " +
          "select Cohade as CodigoConcepto, Tipo as TimpoDeConceptoLiquidacion, Descitm as DescripcionConcepto, Monto as Monto, Vo as ValorOriginal, Empresa as Empresa, Tipo, Inform, Orden from RLIQUID " +
          "where Codigo=" + legProvi + " AND Ames='" + ames + "' AND Peri='2' AND Inform='N' " +
          "union " +
          "select Cohade as CodigoConcepto, Tipo as TimpoDeConceptoLiquidacion, Descitm as DescripcionConcepto, Monto as Monto, Vo as ValorOriginal, Empresa as Empresa, Tipo, Inform, Orden from RLIQUID " +
          "where Codigo=" + legProvi + " AND Ames='" + ames + "' AND Peri='3' AND Inform='N' " +
          "union " +
          "select Cohade as CodigoConcepto, Tipo as TimpoDeConceptoLiquidacion, Descitm as DescripcionConcepto, Monto as Monto, Vo as ValorOriginal, Empresa as Empresa, Tipo, Inform, Orden from RLIQUID " +
          "where Codigo=" + legProvi + " AND Ames='" + ames + "' AND Peri='4'  AND Inform='N' " +
          "union " +
          "select Cohade as CodigoConcepto, Tipo as TimpoDeConceptoLiquidacion, Descitm as DescripcionConcepto, Monto as Monto, Vo as ValorOriginal, Empresa as Empresa, Tipo, Inform, Orden from RLIQUID " +
          "where Codigo=" + legProvi + " AND Ames='" + ames + "' AND Peri='5' AND Inform='N' " +
          "union " +
          "select Cohade as CodigoConcepto, Tipo as TimpoDeConceptoLiquidacion, Descitm as DescripcionConcepto, Monto as Monto, Vo as ValorOriginal, Empresa as Empresa, Tipo, Inform, Orden from RLIQUID " +
          "where Codigo=" + legProvi + " AND Ames='" + ames + "' AND Peri='6' AND Inform='N' " +
          "union " +
          "select Cohade as CodigoConcepto, Tipo as TimpoDeConceptoLiquidacion, Descitm as DescripcionConcepto, Monto as Monto, Vo as ValorOriginal, Empresa as Empresa, Tipo, Inform, Orden from RLIQUID " +
          "where Codigo=" + legProvi + " AND Ames='" + ames + "' AND Peri='7' AND Inform='N' " +
          "order by orden",
          function (error, results, fields) {
            res(results);
          });
      });
    }