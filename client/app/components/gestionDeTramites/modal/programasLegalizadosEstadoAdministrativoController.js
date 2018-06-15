﻿angular.module('app')
    .controller('programasLegalizadosEstadoAdministrativoController', function ($scope, $rootScope, $location, Auth, $uibModal, utilityService, $routeParams, $uibModalInstance, data, idListPrecios, workflowService) {

        var  estadoAdministrativoController = this;
         estadoAdministrativoController.materiasList = data.materiasList;
         estadoAdministrativoController.idPantalla = data.idPantalla;
         estadoAdministrativoController.legajo = data.legajo;
         estadoAdministrativoController.materiaPrice = 70;
         estadoAdministrativoController.total;
         estadoAdministrativoController.saldoString;
         estadoAdministrativoController.data = data;

         estadoAdministrativoController.alumnoData =
        {
            Saldo: -250
        };

         estadoAdministrativoController.fillTableItemPrecio = function (response) {
             estadoAdministrativoController.materiaPrice = response.data[0].Valor;
var calculoTotal =  estadoAdministrativoController.materiasList.length *  estadoAdministrativoController.materiaPrice;
             estadoAdministrativoController.total =  estadoAdministrativoController.alumnoData.Saldo < 0 ? estadoAdministrativoController.alumnoData.Saldo + calculoTotal : calculoTotal;

             estadoAdministrativoController.saldoString = "$ ";

            if ( estadoAdministrativoController.alumnoData.Saldo < 0) {
                 estadoAdministrativoController.saldoString += "-";
                 estadoAdministrativoController.saldoString += ( estadoAdministrativoController.alumnoData.Saldo * -1);
            }
            else {
                 estadoAdministrativoController.saldoString +=  estadoAdministrativoController.alumnoData.Saldo;
            }
        }

         estadoAdministrativoController.init = function () {

            Auth.tokenCookieExists();

            utilityService.callSecureHttp({
                method: "GET",
                url: "secure-api/UniCtaCteEstado/GetSaldoByLegajo/" +  estadoAdministrativoController.legajo,
                callbackSuccess: function(response) {
                     estadoAdministrativoController.alumnoData = response.data;

                    utilityService.callSecureHttp({
                        method: "GET",
                        url: "secure-api/TraPrecioItem/GetByPrecioItemByIdPantalla/" + idListPrecios.base + "&" +  estadoAdministrativoController.idPantalla,
                        callbackSuccess:  estadoAdministrativoController.fillTableItemPrecio
                    });
                }
            });
        };

         estadoAdministrativoController.confirmSave = function () {
            var data = {
                messageType: 3,
                messageTitle: 'Confirmar y guardar',
                message: 'Al presionar Aceptar se generará el movimiento de cobro por Trámite de Analítico Final en tu cuenta corriente. ¿Deseas continuar?',
                messageYes: 'Aceptar',
                messageNo: 'Cancelar'
            };
            var modal = utilityService.showMessage(data);
            
            modal.result.then(
                function (result) { },
                function (result) {
                    if (result == 'ok') {
                        //terminar tramite?
                    }
                    if (result == 'cancel') {
                        console.log("CANCEL!")
                    }
                });
        }
        
         estadoAdministrativoController.showCtaCte = function () {
            window.open('https://miportal.kennedy.edu.ar/', '_blank');
        }

         estadoAdministrativoController.payMethod = function () {
            //agregar llamada para hacer el pago
            return true;
        }

        estadoAdministrativoController.payContinue = function () {
            if (estadoAdministrativoController.payMethod()) {
                var auxDate = new Date();
                var fechaFin = new Date(auxDate.getFullYear(), auxDate.getMonth(), auxDate.getDate(),
                    (auxDate.getHours() - 3), auxDate.getMinutes(), auxDate.getSeconds(), auxDate.getMilliseconds());

                var estadoInstanciaData = estadoAdministrativoController.data;

                estadoInstanciaData.EstadoEstado = 2;

                var valoresSalida = estadoInstanciaData.ValoresSalida != '' ? JSON.parse(estadoInstanciaData.ValoresSalida) : {};

                valoresSalida.materiasList = estadoAdministrativoController.materiasListNames();
                valoresSalida.presentaExterior = estadoAdministrativoController.data.presentaExterior;
                valoresSalida.paisExterior = estadoAdministrativoController.data.paisExterior;
                valoresSalida.institucionExterior = estadoAdministrativoController.data.institucionExterior;
                
                estadoInstanciaData.ValoresSalida = JSON.stringify( valoresSalida );

                estadoInstanciaData.FechaFin = fechaFin;
                success_updateEstadoInstancia_Request = function (response) {
                    workflowService.getNextEstadoByIdEstadoActual(estadoAdministrativoController.data.IdEstadoDefinicion, true, estadoAdministrativoController.data);

                    var data = {
                        messageType: 1,
                        messageTitle: 'Pagar Online y Finalizar',
                        message: 'Tu solicitud de Trámite ha sido registrada exitosamente.\nNro. de Trámite '+estadoAdministrativoController.data.IdInstanciaTramite+'\nPodrás realizar el seguimiento desde la aplicación de Gestión de Trámites, telefónicamente al 0800xxxxxxx o vía email a admin@kennedy.edu.ar.',
                    };
                    var modal = utilityService.showMessage(data);

                    modal.result.then(
                        function (result) { },
                        function (result) {
                            $uibModalInstance.dismiss('finish');
                            return false;
                        });
                }

                // LLAMADA AL UPDATE
                utilityService.callSecureHttp({
                    method: "POST",
                    url: "secure-api/TraEstadoInstancia/Update",
                    data: estadoInstanciaData,
                    callbackSuccess: success_updateEstadoInstancia_Request,
                    callbackError: success_updateEstadoInstancia_Request
                });

            }
            else {
                var data = {
                    messageType: 2,
                    messageTitle: 'Pagar Online y Finalizar',
                    message: 'Lamentablemente su pago no se ha podido realizar.',
                };
                utilityService.showMessage(data)
            }
        }

         estadoAdministrativoController.cancel = function () {
            var data = {
                messageTitle:'¿Desea salir?',
                message: '¿Estás seguro que deseas cancelar el trámite?',
                messageType: 3
            };
    
            var modal = utilityService.showMessage(data);
    
            modal.result.then(
                function (result) { },
                function (result) {
                    if (result == 'ok') {
                        $uibModalInstance.dismiss('cancel');
                        return false;
                    }
                    if (result == 'cancel') {
                        console.log("CANCEL!")
                    }
                });
        }

         estadoAdministrativoController.back = function () {
            $uibModalInstance.dismiss('back');
            return false;
        }

        estadoAdministrativoController.materiasListNames = function () {
            var list = estadoAdministrativoController.data.materiasList;
            var rtn = [];
            list.forEach(element => {
                rtn.push(element.Materia);
            });

            return rtn;
        }

        estadoAdministrativoController.confirmContinue = function () {
            if (estadoAdministrativoController.payMethod()) {
                var auxDate = new Date();
                var fechaFin = new Date(auxDate.getFullYear(), auxDate.getMonth(), auxDate.getDate(),
                    (auxDate.getHours() - 3), auxDate.getMinutes(), auxDate.getSeconds(), auxDate.getMilliseconds());

                var estadoInstanciaData = estadoAdministrativoController.data;

                estadoInstanciaData.EstadoEstado = 2;

                var valoresSalida = estadoInstanciaData.ValoresSalida != '' ? JSON.parse(estadoInstanciaData.ValoresSalida) : {};

                valoresSalida.materiasList = estadoAdministrativoController.materiasListNames();
                valoresSalida.presentaExterior = estadoAdministrativoController.data.presentaExterior;
                valoresSalida.paisExterior = estadoAdministrativoController.data.paisExterior;
                valoresSalida.institucionExterior = estadoAdministrativoController.data.institucionExterior

                estadoInstanciaData.ValoresSalida = JSON.stringify( valoresSalida );

                estadoInstanciaData.FechaFin = fechaFin;
                success_updateEstadoInstancia_Request = function (response) {
                    workflowService.getNextEstadoByIdEstadoActual(estadoAdministrativoController.data.IdEstadoDefinicion, true, estadoAdministrativoController.data);

                    var data = {
                        messageType: 1,
                        messageTitle: 'Confirmar y Finalizar',
                        message: 'Tu solicitud de Trámite ha sido registrada exitosamente.\nNro. de Trámite ' + estadoAdministrativoController.data.IdInstanciaTramite + '\nPodrás realizar el seguimiento desde la aplicación de Gestión de Trámites, telefónicamente al 0800xxxxxxx o vía email a admin@kennedy.edu.ar.',
                    };
                    var modal = utilityService.showMessage(data);

                    modal.result.then(
                        function (result) { },
                        function (result) {
                            $uibModalInstance.dismiss('finish');
                            return false;
                        });
                }

                // LLAMADA AL UPDATE
                utilityService.callSecureHttp({
                    method: "POST",
                    url: "secure-api/TraEstadoInstancia/Update",
                    data: estadoInstanciaData,
                    callbackSuccess: success_updateEstadoInstancia_Request,
                    callbackError: success_updateEstadoInstancia_Request
                });
            }
            else {
                var data = {
                    messageType: 2,
                    messageTitle: 'Confirmar y Finalizar',
                    message: 'Lamentablemente su pago no se ha podido realizar.',
                };
                utilityService.showMessage(data)
            }
        }
    })