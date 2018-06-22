var fs = require('fs');
var pdf = require('html-pdf');
var html = fs.readFileSync('businesscard.html', 'utf8');
var filepath = './businesscard.pdf';
var options =
    {
        height: "10.5in",        // allowed units: mm, cm, in, px
        width: "8in",            // allowed units: mm, cm, in, px

        border: "0",     

        paginationOffset: 1,       // Override the initial pagination number
        header: {
            height: "45mm",
            contents: '<title>Factura</title><link rel="stylesheet" href="factura.css" ></head><body><h1>Factura</h1><table><tr><th>Producto</th><th>Precio</th><th>Cantidad</th><th>Total</th></tr><tr><td>Tijeras</td><td>7</td><td>3</td><td>21</td></tr><tr>                <td>Tijeras</td>                <td>7</td>                <td>3</td>                <td>21</td>               </tr>               <tr>                <td>Bolígrafo</td>                <td>2</td>                <td>5</td>                <td>10</td>               </tr>               <tr>                <td>Grapadora</td>                <td>20</td>                <td>2</td>                <td>40</td>               </tr>               <tr>                <td>Carpeta</td>                <td>5</td>                <td>40</td>                <td>200</td>               </tr>               <tr>                <td colspan="3">Subtotal</td>                <td>250</td>               </tr>                <tr>                <td colspan="3">Gastos de envío</td>                <td>5</td>               </tr>                <tr>                <td colspan="3">Precio total</td>                <td>255</td>               </tr>               </table>             '        
        },
        footer: {
            height: "28mm",
            contents: '{{hola}}<span style="background: red;">{{page}}</span>/<span>{{pages}}</span>'+
                    '<script> ' +
                    'var app = angular.module("myFileApp", []); ' +
                    'app.controller("myFileCtrl", function($scope) { ' +
                    ' $scope.hola = "John Doe"; ' +
                    '}); ' +
                    '</script>'
        },
        hola: "AAAAAAAAAAAAAAA"
    };

module.exports.PDFGenerate = function (req, res) {

    if(req.body){

        pdf.create(html, options).toFile(filepath, function (err, response) {
            res.json(response.filename);
        });
        
    }
}

/*
pdf.create(html).toStream(function (err, stream) {
    stream.pipe(fs.createWriteStream('./foo.pdf'));
});

pdf.create(html).toBuffer(function (err, buffer) {
    console.log('This is a buffer:', Buffer.isBuffer(buffer));
});
*/

pdf.create(html, options, function (err, buffer) { });