angular.module('app')  
.controller('rectificacionDatosEstadoAcademicoController', function ($scope, $rootScope, $location, Auth, $uibModal, utilityService, $routeParams, $uibModalInstance, data, workflowService) {

    var estadoAcademicoController = this;
    estadoAcademicoController.estadoAcademicoData;
    estadoAcademicoController.legajo = data.legajo;
    estadoAcademicoController.aniosMaterias = [];
    estadoAcademicoController.confirmed = false;
    estadoAcademicoController.listaMaterias = [];
    estadoAcademicoController.data = data;
    
    estadoAcademicoController.init = function () {

        Auth.tokenCookieExists();        
        
        estadoAcademicoController.getMateriasAprobadasByLegajo(data.legajo);
    };

    estadoAcademicoController.next = function () {
        var data = {
            messageType: 1,
            messageTitle: 'Finalizar',
            message: 'Tu solicitud de Trámite ha sido registrada exitosamente.\nNro. de Trámite xxxxxxxxxx\nPodrás realizar el seguimiento desde la aplicación de Gestión de Trámites, telefónicamente al 0800xxxxxxx o vía email a admin@kennedy.edu.ar.',
        };
        var modal = utilityService.showMessage(data);

        modal.result.then(
            function (result) { },
            function (result) {
                var auxDate = new Date();
                var fechaFin = new Date(auxDate.getFullYear(), auxDate.getMonth(), auxDate.getDate(),
                    (auxDate.getHours() - 3), auxDate.getMinutes(), auxDate.getSeconds(), auxDate.getMilliseconds());

                var estadoInstanciaData = estadoAcademicoController.data;

                estadoInstanciaData.EstadoEstado = 2;

                estadoInstanciaData.FechaFin = fechaFin;
                success_updateEstadoInstancia_Request = function (response) {
                    workflowService.getNextEstadoByIdEstadoActual(estadoAcademicoController.data.IdEstadoDefinicion, true, estadoAcademicoController.data);

                    var data = {
                        messageType: 1,
                        messageTitle: 'Confirmar y Finalizar',
                        message: 'Tu solicitud de Trámite ha sido registrada exitosamente.\nNro. de Trámite ' + estadoAcademicoController.data.IdInstanciaTramite + '\nPodrás realizar el seguimiento desde la aplicación de Gestión de Trámites, telefónicamente al 0800xxxxxxx o vía email a admin@kennedy.edu.ar.',
                    };
                    var modal = utilityService.showMessage(data);

                    modal.result.then(
                        function (result) { },
                        function (result) {
                            $uibModalInstance.dismiss('finish');
                            return false;
                        });
                }
            });
    }

    estadoAcademicoController.getMateriasAprobadasByLegajo = function(){
        utilityService.callSecureHttp({
            method: "GET", 
            url: "secure-api/UniMateria/GetMateriasAprobadasByLegajo/" + estadoAcademicoController.legajo,
            callbackSuccess: estadoAcademicoController.getMateriasAprobadasByLegajoCallback
        });
    };
    
    estadoAcademicoController.getMateriasAprobadasByLegajoCallback = function(response){
        if(response){
            var fechaR = new Date();
            estadoAcademicoController.estadoAcademicoData = response.data;
            var stringToDate = function (string) {
                if (string == "")
                    return fechaR;
                else {
                    var parts = string.split('/');
                    return new Date(parts[2], parts[1] - 1, parts[0]);
                }
            }
            estadoAcademicoController.estadoAcademicoData.Materias.sort(function(a, b) {

                return stringToDate(a.FechaReal).getTime() - stringToDate(b.FechaReal).getTime();
            });

            var year;
            var typeStyle = 1;
            var listaMateriasFinal = [];
            estadoAcademicoController.estadoAcademicoData.Materias.forEach(function (materia) {
                if (stringToDate(materia.FechaReal).getFullYear() != year) {
                    year = stringToDate(materia.FechaReal).getFullYear();
                    if (typeStyle == 1) {
                        typeStyle = 2;
                    } else {
                        typeStyle = 1;
                    }
                    if (materia.FechaReal == "") {
                        listaMateriasFinal.push({Materia:"Reconocimientos", Fecha:" ", Nota:" ", Folio:" ", LibroActa:" ", Recono:"T"});
                    } else {
                        listaMateriasFinal.push({Materia:"Año " + year, Fecha:" ", Nota:" ", Folio:" ", LibroActa:" ", Recono:"T"});
                    }
                }
                materia.typeStyle = typeStyle;
                listaMateriasFinal.push(materia);
            });

            estadoAcademicoController.listaMaterias = listaMateriasFinal;

            $('#estadoAcademico_ResultTable').bootstrapTable({
                data: estadoAcademicoController.listaMaterias
            });
            
    
            $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').focus()
            })
        }
    };

    attach = function (index) {
        console.log('index:' + index);
        console.log(estadoAcademicoController.listaMaterias);
        var inputFile = $('#file-input' + index).first();

        inputFile.change(function (e) {
            var file = this.files && this.files[0] ? this.files[0] : false;
            if (file) {
                if (file.type.search("image") === 0) {
                    var index = e.currentTarget.id.slice('file-input'.length, e.currentTarget.id.length);
                    estadoAcademicoController.listaMaterias[index].file = file;
                    $('#estadoAcademico_ResultTable').bootstrapTable('load', estadoAcademicoController.listaMaterias);
                    console.log(file.type);
                }
                else {
                    var data = {
                        messageTitle:'Error',
                        message: 'El archivo ingresado no es un tipo de imagen compatible.',
                        messageType: 2
                    };
            
                    utilityService.showMessage(data);
                }
            }
        });
        inputFile.click();
    }

    estadoAcademicoController.cancel = function () {
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

    estadoAcademicoController.back = function () {
        $uibModalInstance.dismiss('back');
        return false;
    }

    changeSelect = function (index) {
        var valueSelected = $('#selectRevisar' + index)[0].value;
        estadoAcademicoController.listaMaterias[index].valorRevisar = valueSelected;

        if(valueSelected === "0")
            estadoAcademicoController.listaMaterias[index].file = undefined;
        
        $('#estadoAcademico_ResultTable').bootstrapTable('load', estadoAcademicoController.listaMaterias);
    }
});

function reconoFormatter(value, row, index, field) {
    if (value) {
        if (value == "T")
            return ' ';
        else
            return 'R';
    } else {
        return '-';
    }
}  

function adjuntadoFormatter(value, row, index, field) {
    var rtn;
    if (row.Recono == "T")
        rtn = ' ';
    else if (row.valorRevisar && row.valorRevisar != '0')
        rtn = '<i class="fa fa-arrow-circle-up bootstrap-data-detail" title="Subir archivo" onclick="attach(' + index + ')" style="margin-right: 0px;"></i>' +
            '<input id="file-input' + index + '" type="file" accept="" style="display:none;" />';
    else
        rtn = '<i class="fa fa-arrow-circle-up bootstrap-data-detail-disabled" title="Subir archivo" style="margin-right: 0px;"></i>';
    if(row.file)
        rtn += '<i class="fa fa-paperclip bootstrap-data-detail" title="'+ row.file.name +'" style="margin-right: 0px;"></i>';
    return rtn;
}  

function revisarFormatter(value, row, index, field) {
    var selectByValue = function(option,value) {
        if(option == value)
            return 'selected'
        else
            return '';
    }
    
    if (row.Recono == "T")
        return ' ';
    else
        return '<select id="selectRevisar' + index + '" class="input-large form-control" onchange="changeSelect(' + index + ')">' +
            '<option value=0 '+ selectByValue(0,row.valorRevisar) +'>----</option>' +
            '<option value=1 '+ selectByValue(1,row.valorRevisar) +'>Fecha</option>' +
            '<option value=2 '+ selectByValue(2,row.valorRevisar) +'>Nota</option>' +
            '<option value=3 '+ selectByValue(3,row.valorRevisar) +'>Folio</option>' +
            '<option value=4 '+ selectByValue(4,row.valorRevisar) +'>Lib/Acta</option>' +
            '<option value=5 '+ selectByValue(5,row.valorRevisar) +'>Recono</option>' +
            '<option value=6 '+ selectByValue(6,row.valorRevisar) +'>Todo</option>' +
            '</select>';
}

function rowStyle(row, index) {
    if (row.typeStyle == 1) {
        return {
            css: { "background-color": "#eee" }
        };
    } else if (row.typeStyle == 2) {
        return {
            
        };
    } else return {
        css: { "background-color": "#dddddd", "font-weight": "bold" }
    };
}