angular.module('app')  
.controller('programasLegalizadosEstadoAcademicoController', function ($scope, $rootScope, $location, Auth, $uibModal, utilityService, $routeParams, $uibModalInstance, data) {

    var estadoAcademicoController = this;
    estadoAcademicoController.estadoAcademicoData;
    estadoAcademicoController.legajo = data.legajo;
    estadoAcademicoController.aniosMaterias = [];
    estadoAcademicoController.idPantalla = data.idPantalla;
    estadoAcademicoController.data = data;
    

    estadoAcademicoController.paises =
                        [{ name: 'Alaska', code: 1907 },
                        { name: 'Albania', code: 355 },
                        { name: 'Alemania', code: 49 },
                        { name: 'Andorra', code: 376 },
                        { name: 'Angola', code: 244 },
                        { name: 'Arabia Saudí', code: 966 },
                        { name: 'Argelia', code: 213 },
                        { name: 'Argentina', code: 54 },
                        { name: 'Armenia', code: 374 },
                        { name: 'Australia', code: 61 },
                        { name: 'Austria', code: 43 },
                        { name: 'Bahreim', code: 973 },
                        { name: 'Bangladesh', code: 880 },
                        { name: 'Bélgica', code: 32 },
                        { name: 'Bolivia', code: 591 },
                        { name: 'Bosnia', code: 387 },
                        { name: 'Brasil', code: 55 },
                        { name: 'Bulgaria', code: 359 },
                        { name: 'Cabo Verde', code: 238 },
                        { name: 'Camboya', code: 855 },
                        { name: 'Camerún', code: 237 },
                        { name: 'Canadá', code: 1 },
                        { name: 'Centroafricana, Rep.', code: 236 },
                        { name: 'Checa, Rep.', code: 420 },
                        { name: 'Chile', code: 56 },
                        { name: 'China', code: 86 },
                        { name: 'Chipre', code: 357 },
                        { name: 'Colombia', code: 57 },
                        { name: 'Congo, Rep. del', code: 242 },
                        { name: 'Congo, Rep. Democ.', code: 243 },
                        { name: 'Corea, Rep.', code: 82 },
                        { name: 'Corea, Rep. Democ.', code: 850 },
                        { name: 'Costa de Marfil', code: 225 },
                        { name: 'Costa Rica', code: 506 },
                        { name: 'Croacia', code: 385 },
                        { name: 'Cuba', code: 53 },
                        { name: 'Dinamarca', code: 45 },
                        { name: 'Dominicana, Rep.', code: 1809 },
                        { name: 'Ecuador', code: 593 },
                        { name: 'Egipto', code: 20 },
                        { name: 'El Salvador', code: 503 },
                        { name: 'Emiratos Árabes Unidos', code: 971 },
                        { name: 'Eslovaca, Rep.', code: 421 },
                        { name: 'Eslovenia', code: 386 },
                        { name: 'España', code: 34 },
                        { name: 'Estados Unidos', code: 1 },
                        { name: 'Estonia', code: 372 },
                        { name: 'Etiopía', code: 251 },
                        { name: 'Filipinas', code: 63 },
                        { name: 'Finlandia', code: 358 },
                        { name: 'Francia', code: 33 },
                        { name: 'Gibraltar', code: 9567 },
                        { name: 'Grecia', code: 30 },
                        { name: 'Groenlandia', code: 299 },
                        { name: 'Guatemala', code: 502 },
                        { name: 'Guinea Ecuatorial', code: 240 },
                        { name: 'Haití', code: 509 },
                        { name: 'Hawai', code: 1808 },
                        { name: 'Honduras', code: 504 },
                        { name: 'Hong Kong', code: 852 },
                        { name: 'Hungría', code: 36 },
                        { name: 'India', code: 91 },
                        { name: 'Indonesia', code: 62 },
                        { name: 'Irak', code: 964 },
                        { name: 'Irán', code: 98 },
                        { name: 'Irlanda', code: 353 },
                        { name: 'Islandia', code: 354 },
                        { name: 'Israel', code: 972 },
                        { name: 'Italia', code: 39 },
                        { name: 'Jamaica', code: 1876 },
                        { name: 'Japón', code: 81 },
                        { name: 'Jordania', code: 962 },
                        { name: 'Kenia', code: 254 },
                        { name: 'Kuwait', code: 965 },
                        { name: 'Laos', code: 856 },
                        { name: 'Letonia', code: 371 },
                        { name: 'Líbano', code: 961 },
                        { name: 'Liberia', code: 231 },
                        { name: 'Libia', code: 218 },
                        { name: 'Liechtenstein', code: 41 },
                        { name: 'Lituania', code: 370 },
                        { name: 'Luxemburgo', code: 352 },
                        { name: 'Madagascar', code: 261 },
                        { name: 'Malasia', code: 60 },
                        { name: 'Malta', code: 356 },
                        { name: 'Marruecos', code: 212 },
                        { name: 'Martinica', code: 596 },
                        { name: 'Mauritania', code: 222 },
                        { name: 'México', code: 52 },
                        { name: 'Moldavia', code: 373 },
                        { name: 'Mónaco', code: 377 },
                        { name: 'Mongolia', code: 976 },
                        { name: 'Mozambique', code: 258 },
                        { name: 'Namibia', code: 264 },
                        { name: 'Nepal', code: 977 },
                        { name: 'Nicaragua', code: 505 },
                        { name: 'Nigeria', code: 234 },
                        { name: 'Noruega', code: 47 },
                        { name: 'Nueva Zelanda', code: 64 },
                        { name: 'Países Bajos', code: 31 },
                        { name: 'Pakistán', code: 92 },
                        { name: 'Panamá', code: 507 },
                        { name: 'Paraguay', code: 595 },
                        { name: 'Perú', code: 51 },
                        { name: 'Polonia', code: 48 },
                        { name: 'Portugal', code: 351 },
                        { name: 'Puerto Rico', code: 1787 },
                        { name: 'Qatar', code: 974 },
                        { name: 'Reino Unido', code: 44 },
                        { name: 'Rumania', code: 40 },
                        { name: 'Rusia', code: 7 },
                        { name: 'San Marino', code: 378 },
                        { name: 'Senegal', code: 221 },
                        { name: 'Singapur', code: 65 },
                        { name: 'Siria', code: 963 },
                        { name: 'Somalia', code: 252 },
                        { name: 'Sri-Lanka', code: 94 },
                        { name: 'Sudáfrica', code: 27 },
                        { name: 'Sudán', code: 249 },
                        { name: 'Suecia', code: 46 },
                        { name: 'Suiza', code: 41 },
                        { name: 'Tailandia', code: 66 },
                        { name: 'Taiwan', code: 886 },
                        { name: 'Tanzania', code: 255 },
                        { name: 'Túnez', code: 216 },
                        { name: 'Turquía', code: 90 },
                        { name: 'Ucrania', code: 380 },
                        { name: 'Uganda', code: 256 },
                        { name: 'Uruguay', code: 598 },
                        { name: 'Vaticano', code: 39 },
                        { name: 'Venezuela', code: 58 },
                        { name: 'Vietnam', code: 84 },
                        { name: 'Yemen', code: 967 },
                        { name: 'Yugoslavia', code: 381 },
                        { name: 'Zambia', code: 260 },
                        { name: 'Zimbawe', code: 263}]

    estadoAcademicoController.selectedCountry = null;
    estadoAcademicoController.chkForeign = false;
    estadoAcademicoController.foreignInstitution = '';

    estadoAcademicoController.init = function () {

        Auth.tokenCookieExists();        
        
        estadoAcademicoController.getMateriasAprobadasByLegajo(data.legajo);
    };

    estadoAcademicoController.foreignKeyUp = function(value) {
        estadoAcademicoController.foreignInstitution = estadoAcademicoController.foreignInstitution.replace(/[^a-z\dA-Z ]/, '');
    }

    estadoAcademicoController.next = function () {
        var selectedItems = $('#estadoAcademico_ResultTable').bootstrapTable('getSelections');
        var materiasList = [];

        selectedItems.forEach(function (item) {
            if(item.Recono != 'T'){
                materiasList.push(item);
            }
        });
        estadoAcademicoController.data.presentaExterior = estadoAcademicoController.chkForeign;
        estadoAcademicoController.data.paisExterior = estadoAcademicoController.selectedCountry;
        estadoAcademicoController.data.institucionExterior = estadoAcademicoController.chkForeign ? estadoAcademicoController.foreignInstitution : null;
        estadoAcademicoController.data.materiasList = materiasList;
        if (materiasList.length > 0) {
            var modalInstance = $uibModal.open({
                animation: $scope.animationsEnabled,
                templateUrl: 'app/components/gestionDeTramites/modal/programasLegalizadosEstadoAdministrativo.html',
                controller: 'programasLegalizadosEstadoAdministrativoController as vm',
                size: 'lg',
                backdrop: 'static',
                keyboard: false,
                resolve: {
                    data: function () {
                        return estadoAcademicoController.data;
                    }
                }
            });

            modalInstance.result.then(
                function (result) { },
                function (result) {
                    if (result == 'cancel') {
                        $uibModalInstance.dismiss('cancel');
                        return false;
                    }
                    if (result == 'finish') {
                        $uibModalInstance.dismiss('finish');
                        return false;
                    }
                });
        }
        else {
            var data = {
                messageType: 2,
                messageTitle: 'Error',
                message: 'Debe seleccionar al menos un item de la lista de materias.'
            };

            utilityService.showMessage(data);
        }
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
                if (!string)
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
                    if (!materia.FechaReal) {
                        listaMateriasFinal.push({Materia:"Reconocimientos", Fecha:" ", Nota:" ", Folio:" ", LibroActa:" ", Recono:"T", FechaReal: materia.FechaReal});
                    } else {
                        listaMateriasFinal.push({Materia:"Año " + year, Fecha:" ", Nota:" ", Folio:" ", LibroActa:" ", Recono:"T", FechaReal: materia.FechaReal});
                    }
                }
                materia.typeStyle = typeStyle;
                listaMateriasFinal.push(materia);
            });

            for (i = 0; i < listaMateriasFinal.length; i++) {
                listaMateriasFinal[i].index = i;
            }

            $('#estadoAcademico_ResultTable').bootstrapTable({
                data: listaMateriasFinal
            });

            $('#estadoAcademico_ResultTable').on('check.bs.table', function ($element, row) {
                if(row.Recono == "T"){
                    var stringToDate = function (string) {
                        if (!string)
                            return fechaR;
                        else {
                            var parts = string.split('/');
                            return new Date(parts[2], parts[1] - 1, parts[0]);
                        }
                    }

                    var listaMateriasFinal = estadoAcademicoController.estadoAcademicoData.Materias;
                    year = stringToDate(row.FechaReal).getFullYear();
                    for (i in listaMateriasFinal) {
                        if(listaMateriasFinal[i].Recono != "T" && stringToDate(listaMateriasFinal[i].FechaReal).getFullYear() == year) {
                            $('#estadoAcademico_ResultTable').bootstrapTable('check', i);
                        }
                    }
                    $('#estadoAcademico_ResultTable').bootstrapTable('load', listaMateriasFinal);

                    for (i = 0; i < listaMateriasFinal.length; i++) {
                        if (listaMateriasFinal[i].Recono == "T") {
                            //var string = '<td class="bs-checkbox " style="background-color: #dddddd;"><input data-index="' + i + '" name="btSelectItem" type="checkbox"></td> <td style="background-color: #dddddd; font-weight: bold; " colspan="7">' + listaMateriasFinal[i].Materia + '</td>'
                            //$('#estadoAcademico_ResultTable').children('tbody').children(0)[i].innerHTML = '<td style="background-color: #dddddd; font-weight: bold;" colspan="7">' + listaMateriasFinal[i].Materia + '</td>'
                            //$('#estadoAcademico_ResultTable').children('tbody').children(0)[i].innerHTML = string;
                            var options = {
                                index: i,
                                field: 'Materia',
                                colspan: 6
                            };
                            $('#estadoAcademico_ResultTable').bootstrapTable('mergeCells', options);
                            $("input[data-index=" + i + "]:last").parents("td").attr('style', "background-color: #dddddd;")
                        }
                    }
                }
            });

            $('#estadoAcademico_ResultTable').on('uncheck.bs.table', function ($element, row) {
                if(row.Recono == "T"){
                    var stringToDate = function (string) {
                        if (!string)
                            return fechaR;
                        else {
                            var parts = string.split('/');
                            return new Date(parts[2], parts[1] - 1, parts[0]);
                        }
                    }

                    var listaMateriasFinal = estadoAcademicoController.estadoAcademicoData.Materias;
                    year = stringToDate(row.FechaReal).getFullYear();
                    for (i in listaMateriasFinal) {
                        if(listaMateriasFinal[i].Recono != "T" && stringToDate(listaMateriasFinal[i].FechaReal).getFullYear() == year) {
                            $('#estadoAcademico_ResultTable').bootstrapTable('uncheck', i);
                        }
                    }
                    $('#estadoAcademico_ResultTable').bootstrapTable('load', listaMateriasFinal);

                    for (i = 0; i < listaMateriasFinal.length; i++) {
                        if (listaMateriasFinal[i].Recono == "T") {
                            var options = {
                                index: i,
                                field: 'Materia',
                                colspan: 6
                            };
                            $('#estadoAcademico_ResultTable').bootstrapTable('mergeCells', options);
                            $("input[data-index=" + i + "]:last").parents("td").attr('style', "background-color: #dddddd;")
                        }
                    }
                }
            });

            $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').focus()
            })

            for (i = 0; i < listaMateriasFinal.length; i++) {
                if (listaMateriasFinal[i].Recono == "T") {
                    var options = {
                        index: i,
                        field: 'Materia',
                        colspan: 6
                    };
                    $('#estadoAcademico_ResultTable').bootstrapTable('mergeCells', options);
                    $("input[data-index=" + i + "]:last").parents("td").attr('style', "background-color: #dddddd;")
                }
            }

            estadoAcademicoController.estadoAcademicoData.Materias = listaMateriasFinal;
        }
    };

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