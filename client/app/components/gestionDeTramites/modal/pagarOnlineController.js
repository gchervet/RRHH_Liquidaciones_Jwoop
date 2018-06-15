angular.module('app')
    .controller('pagarOnlineController', function (idListPrecios, Auth, $scope, $rootScope, $uibModalInstance, utilityService, workflowService, data) {

        var pagarOnlineController = this;

        pagarOnlineController.mediosDePagoSelected = {};
        pagarOnlineController.mediosDePagoList = [];
        pagarOnlineController.inputMedioDePago = '';
        pagarOnlineController.inputMail = '';

        pagarOnlineController.data = data;
        pagarOnlineController.init = function () {

            Auth.tokenCookieExists();

            pagarOnlineController.getAlumnoSaldo();
            pagarOnlineController.getMediosDePagoList();
        };

        pagarOnlineController.getAlumnoSaldo = function () {

            var process_getAlumnoSaldo_request = function () {
                utilityService.callSecureHttp({
                    method: "GET",
                    url: "secure-api/UniCtaCteEstado/GetSaldoByLegajo/" + pagarOnlineController.data.LegajoProvisorio,
                    callbackSuccess: function (response) {

                        pagarOnlineController.monto = response.data;

                        utilityService.callSecureHttp({
                            method: "GET",
                            url: "secure-api/TraPrecioItem/GetByPrecioItemByIdPantalla/" + idListPrecios.base + "&" + 5,
                            callbackSuccess: pagarOnlineController.fillTableItemPrecio
                        });
                    }
                });
            };

            pagarOnlineController.fillTableItemPrecio = function (response) {
                if (response.data) {
                    pagarOnlineController.importe = response.data[0].Valor;
                    pagarOnlineController.importeAPagar = response.data[0].Valor;
                }
            };


            var success_getAlumnoSaldo_Request = function (response) {
                if (response.data) {
                    pagarOnlineController.mediosDePagoList = response.data;
                }
            };

            process_getAlumnoSaldo_request();

        }

        pagarOnlineController.getMediosDePagoList = function () {

            var process_getMediosDePagoList_request = function () {
                utilityService.callSecureHttp({
                    method: "GET",
                    url: "secure-api/CtaMediosPagoOnline/GetAll/",
                    callbackSuccess: success_getMediosDePagoList_Request,
                    callbackError: success_getMediosDePagoList_Request
                });
            };

            var success_getMediosDePagoList_Request = function (response) {
                if (response.data) {
                    pagarOnlineController.mediosDePagoList = response.data;
                }
            };

            process_getMediosDePagoList_request();
        }

        pagarOnlineController.pagarOnline = function () {
            var data = {
                messageTitle: 'Aceptar pago',
                message: '¿Realizar el pago por $' + pagarOnlineController.importeAPagar + '?',
                messageType: 3
            };

            var modal = utilityService.showMessage(data);

            modal.result.then(
                function (result) { },
                function (result) {
                    if (result == 'ok') {
                        pagarOnlineController.pagarOnlineProcess();
                        return false;
                    }
                    if (result == 'cancel') {
                        console.log("CANCEL!")
                    }
                });
        }

        pagarOnlineController.pagarOnlineProcess = function () {

            var process_pagarOnlineProcess_request = function () {

                // ARMAR JSON
                var data = {
                    "EntidadId": pagarOnlineController.data.IdEntidad,
                    "EntidadDescriptivo": "",
                    "Email": pagarOnlineController.inputMail,
                    "Importe": pagarOnlineController.importeAPagar,
                    "ImporteTotal": pagarOnlineController.importeAPagar,
                    "Recargo": 0.0,
                    "SinRecargo": true,
                    "MedioPagoOnlineTipoTransaccion": 1,
                    "MedioPagoOnlineId": 1,
                    "TipoPago": "I",
                    "CantidadCuotas": 1,
                    "NumeroPago": pagarOnlineController.inputMedioDePago
                }

                utilityService.callExternalHttp({
                    method: "POST",
                    host: "http://localhost:2497/Services",
                    url: "/CtaPagoOnlineService.svc/pagaronline",
                    callbackSuccess: success_pagarOnlineProcess_Request,
                    callbackError: success_pagarOnlineProcess_Request,
                    data: data
                });
            };

            var success_pagarOnlineProcess_Request = function (response) {
                if (response.data) {
                    pagarOnlineController.mediosDePagoList = response.data;
                }
            };

            process_pagarOnlineProcess_request();
        };

        pagarOnlineController.cancel = function () {
            var data = {
                messageTitle: '¿Desea salir?',
                message: '¿Estás seguro que deseas cancelar el trámite?',
                messageType: 3
            };

            var modal = utilityService.showMessage(data);

            modal.result.then(
                function (result) { },
                function (result) {
                    if (result == 'ok') {
                        $uibModalInstance.dismiss('finish');
                        return false;
                    }
                    if (result == 'cancel') {
                        console.log("CANCEL!")
                    }
                });
        }
    });