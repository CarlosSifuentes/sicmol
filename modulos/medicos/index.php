<?php
require_once '../../funciones/global.php';
//Validar permiso para acceder
acceso('ASS', $s_app, $ruta_actual);

//Título de página
$nombre_app = 'Médicos';

if ($nombre_app == ''){
    $titulo_pag = 'SICMOL - Control de Citas On Line';
} else {
    $titulo_pag = $nombre_app.' - SICMOL';
}

//Escribir cookie con ruta actual
setcookie('ruta', $ruta_actual,0,'/');
?>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="expires" content="43200"/>
    <title><?php echo $titulo_pag ?></title>
    <link rel="shortcut icon" type="image/x-icon" href="../../favicon.ico">

    <!-- Bootstrap core CSS -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="../../css/bootstrap.chosen.min.css" rel="stylesheet">
    <link href="../../css/Site.css" rel="stylesheet">
    <link href="../../fontawesome/css/all.min.css" rel="stylesheet">
    <link href="../../css/jquery-ui.min.css" rel="stylesheet">
    <link href="../../css/jquery.fancybox.min.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>

<!--Top header inicio-->
<?php include '../../header-app.php' ?>
<div class="modal left fade" id="menu-lateral-Modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="nav flex-sm-column flex-row">
                    <?php
                    include '../../menu_left.php';
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>
<!--fin Top header-->

<!--inicio Contenido principal-->
<div class="container" id="mainContainer">
    <div class="card">
        <h5 class=" card-header text-app">Inicio</h5>
        <div class="card-body">

                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active font-weight-bold text-app" id="usuarios-tab" data-toggle="tab" href="#usuario" role="tab" aria-controls="usuario" aria-selected="true">Usuarios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bold text-app" id="modulos-tab" data-toggle="tab" href="#modulo" role="tab" aria-controls="modulo" aria-selected="false">Módulos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bold text-app" id="sedes-tab" data-toggle="tab" href="#sede" role="tab" aria-controls="sede" aria-selected="false">Sedes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bold text-app" id="especialidades-tab" data-toggle="tab" href="#especialidad" role="tab" aria-controls="especialidad" aria-selected="false">Especialidades</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bold text-app" id="perfiles-tab" data-toggle="tab" href="#perfil" role="tab" aria-controls="perfil" aria-selected="false">Perfiles</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bold text-app" id="documento-tab" data-toggle="tab" href="#documento" role="tab" aria-controls="documento" aria-selected="false">Tipo Documentos</a>
                    </li>
                </ul>
                <div class="border-left border-bottom rounded-bottom border-right p-2">
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="usuario" role="tabpanel" aria-labelledby="home-tab">
                        <div class="row">
                            <div class="col-6 text-left mb-2">
                                <h5>Lista de usuarios</h5>
                            </div>
                            <div class="col text-right">
                                <a href="javascript:void(0)" id="newusuario-btn" class="btn btn-primary btn-sm text-white btn-new">Nuevo usuario</a>
                            </div>
                        </div>
                        <div id="empleados"></div>
                    </div>

                    <div class="tab-pane fade" id="modulo" role="tabpanel" aria-labelledby="profile-tab">
                        <div class="row">
                            <div class="col-6 text-left mb-2">
                                <h5>Lista de módulos</h5>
                            </div>
                            <div class="col text-right">
                                <a href="javascript:void(0)" id="newmodulo-btn" class="btn btn-primary btn-sm text-white btn-new">Nuevo módulo</a>
                            </div>
                        </div>
                        <div id="modulos">
                        </div>
                    </div>

                    <div class="tab-pane fade" id="sede" role="tabpanel" aria-labelledby="contact-tab">
                        <div class="row">
                            <div class="col-6 text-left mb-2">
                                <h5>Lista de sedes</h5>
                            </div>
                            <div class="col text-right">
                                <a href="javascript:void(0)" id="newsede-btn" class="btn btn-primary btn-sm text-white btn-new">Nueva Sede</a>
                            </div>
                        </div>
                        <div id="sedes"></div>
                    </div>

                    <div class="tab-pane fade" id="especialidad" role="tabpanel" aria-labelledby="contact-tab">
                        <div class="row">
                            <div class="col-6 text-left mb-2">
                                <h5>Lista de Especialidades</h5>
                            </div>
                            <div class="col text-right">
                                <a href="javascript:void(0)" id="newespecialidad-btn" class="btn btn-primary btn-sm text-white btn-new">Nueva especialidad</a>
                            </div>
                        </div>
                        <div id="especialidades"></div>
                    </div>

                    <div class="tab-pane fade" id="perfil" role="tabpanel" aria-labelledby="contact-tab">
                        <div class="row">
                            <div class="col-6 text-left mb-2">
                                <h5>Lista de perfiles</h5>
                            </div>
                            <div class="col text-right">
                                <a href="javascript:void(0)" id="newperfil-btn" class="btn btn-primary btn-sm text-white btn-new">Nuevo perfil</a>
                            </div>
                        </div>
                        <div id="perfiles"></div>
                    </div>

                    <div class="tab-pane fade" id="documento" role="tabpanel" aria-labelledby="contact-tab">
                        <div class="row">
                            <div class="col-6 text-left mb-2">
                                <h5>Lista de Tipos de documentos</h5>
                            </div>
                            <div class="col text-right">
                                <a href="javascript:void(0)" id="newdocumento-btn" class="btn btn-primary btn-sm text-white btn-new">Nuevo tipo de documento</a>
                            </div>
                        </div>
                        <div id="documentos"></div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!--fin Contenido principal-->
<!--Inicio footer-->
<?php include '../../footer-app.php' ?>
<!--Fin footer-->

<!--Modal nuevoUsuario.php-->
<form id="form-nuevoUsuario" name="form-nuevoUsuario" method="post">
    <input type="hidden" id="accion_usuario">
    <input type="hidden" id="id" name="id">
<div class="modal fade" id="modalAgregar" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header pb-2 pt-2">
                <h5 class="modal-title text-app">Nuevo usuario</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="modalAgregar-Contenido">
                Cargando formulario...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger btn-sm btn-close" data-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-success btn-sm btn-save" id="save-usuario-btn">Guardar cambios</button>
            </div>
        </div>
    </div>
</div>
</form>
<!--fin Modal nuevoUsuario.php-->

<!--Modal nuevoModulo.php-->
<div class="modal fade" id="modalAgregarModulo" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header pb-2 pt-2">
                <h5 class="modal-title text-app">Nuevo módulo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="modalAgregarModulo-Contenido">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger btn-sm btn-close" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-success btn-sm btn-save" id="save-modulo-btn">Guardar cambios</button>
            </div>
        </div>
    </div>
</div>
<!--fin Modal nuevoModulo.php-->

<!--Modal newSedeAreaPerfil-->
<input type="hidden" id="op">
<div class="modal fade" id="modalSedeAreaPerfil" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header pb-2 pt-2">
                <h5 class="modal-title text-app" id="modalSedeAreaPerfil-Titulo"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="modalSedeAreaPerfil-Contenido">
                <div class="row">
                    <div class="form-group col">
                        <label for="nombre_sap">Nombre</label>
                        <input type="text" class="form-control form-control-sm" id="nombre_sap" name="nombre_sap">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger btn-sm btn-close" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-success btn-sm btn-save" id="save-sap-btn">Guardar cambios</button>
            </div>
        </div>
    </div>
</div>
<!--fin Modal newSedeAreaPerfil-->

<!--Scripts javascript-->
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../../fontawesome/js/all.min.js"></script>
<script type="text/javascript" src="../../js/global.js"></script>
<script type="text/javascript" src="../../js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="../../js/sweetalert2.all.min.js"></script>
<script type="text/javascript" src="../../js/jquery.numeric.js"></script>
<script type="text/javascript" src="../../js/jquery.fancybox.min.js"></script>
<?php include '../../js/current_time.js' ?>
<!--Scripts-->
<script>

    var $perfiles_tab = $('#perfiles-tab');
    var $perfiles = $('#perfiles');

    var $documento_tab = $('#documento-tab');
    var $documentos = $('#documentos');

    var $especialidades_tab = $('#especialidades-tab');
    var $especialidades = $('#especialidades');

    var $sedes_tab = $('#sedes-tab');
    var $sedes = $('#sedes');

    var $modulos_tab = $('#modulos-tab');
    var $modulos = $('#modulos');

    var $usuarios_tab = $('#usuarios-tab');
    var $usuario = $('#empleados');

    var $nombre_sap = $('#nombre_sap');

    $(function () {
        $usuario.load('usuariosAjax.php');

        $documento_tab.click(function () {
            $documentos.load('../SAP-Ajax.php?op=Documento');
        });

        $perfiles_tab.click(function () {
            $perfiles.load('../SAP-Ajax.php?op=Perfil');
        });

        $especialidades_tab.click(function () {
            $especialidades.load('../SAP-Ajax.php?op=Especialidad');
        });

        $sedes_tab.click(function () {
            $sedes.load('../SAP-Ajax.php?op=Sede');
        });

        $modulos_tab.click(function () {
            $modulos.load('modulosAjax.php');
        });

        $usuarios_tab.click(function () {
            $usuario.load('usuariosAjax.php');
        });

        $('#newsede-btn').click(function () {
            $('#modalSedeAreaPerfil-Titulo').html('Nueva sede');
            $('#op').val('Sede');
            $('#modalSedeAreaPerfil').modal({
                backdrop:'static',
                keyboard:false
            });
        })

        $('#newperfil-btn').click(function () {
            $('#modalSedeAreaPerfil-Titulo').html('Nuevo perfil');
            $('#op').val('Perfil');
            $('#modalSedeAreaPerfil').modal({
                backdrop:'static',
                keyboard:false
            });
        })

        $('#newdocumento-btn').click(function () {
            $('#modalSedeAreaPerfil-Titulo').html('Nuevo tipo de documento');
            $('#op').val('Documento');
            $('#modalSedeAreaPerfil').modal({
                backdrop:'static',
                keyboard:false
            });
            $('#modalSedeAreaPerfil').on('shown.bs.modal', function() {
                $nombre_sap.focus()
            });
        });

        /*$nombre_sap.keyup(function () {
            mayuscula($nombre_sap);
        })*/

        $('#newespecialidad-btn').click(function () {
            $('#modalSedeAreaPerfil-Titulo').html('Nueva especialidad');
            $('#op').val('Especialidad');
            $('#modalSedeAreaPerfil').modal({
                backdrop:'static',
                keyboard:false
            });
        })

        $('#nombre_sap').change(function () {
            validar_sap();
        })

    })

    $('#newmodulo-btn').click(function () {
        $('#modalAgregarModulo-Contenido').load('nuevoModulo.php');
        $('#modalAgregarModulo').modal({
            backdrop: 'static',
            keyboard: false
        })
    })

    $('#newusuario-btn').click(function () {
        $('#save-usuario-btn').show();
        $('#accion_usuario').val('new');
        $('#modalAgregar-Contenido').load('nuevoUsuario.php');
        $('#modalAgregar').modal({
            backdrop: 'static',
            keyboard: false
        })
    })

    $('#save-sap-btn').click(function (e) {
        var $nombre = $('#nombre_sap');
        if ($nombre.val().length<2){
            $nombre.focus();
            swal_validar('Debes ingresar un nombre');
            return false;
        }
        e.preventDefault();

        let op = $('#op').val();
        let formdata = 'nombre='+$nombre.val()+'&op='+op;
        $.ajax({
            url:'../newSedeAreaPerfil.php',
            type: 'POST',
            data:formdata,
            cache: false,
            dataType:'json',
            success: function (data) {
                swal_ok(data[0]+' agregado/a correctamente');
                $nombre.val('');
                $('#modalSedeAreaPerfil').modal('hide');
                $('#'+data[2]).load('../SAP-Ajax.php?op='+data[0]);
            }
        })
    })

    $('#save-modulo-btn').click(function (e) {
        var $app = $('#app');
        var $tclientes = $('#tclientes');
        var $tgestiones = $('#tgestiones');
        var $tventas = $('#tventas');

        if ($app.val().length<3){
            $app.focus();
            swal_validar('El código de App debe ser al menos de 3 caracteres');
            return false;
        }
        e.preventDefault();

        let op = 'Módulo';
        let formdata = 'app='+$app.val()+'&tclientes='+$tclientes.val()+'&tgestiones='+$tgestiones.val()+'&tventas='+$tventas.val()+'&op='+op;
        $.ajax({
            url:'../newSedeAreaPerfil.php',
            type: 'POST',
            data:formdata,
            cache: false,
            success: function (data) {
                swal_ok(data);
                $app.val('');
                $tclientes.val('');
                $tgestiones.val('');
                $tventas.val('');
                $('#modalAgregarModulo').modal('hide');
                $modulos.load('modulosAjax.php');
            },
            error: function (data) {
                alert(data);
            }
        })
    })

    //Ingresar nuevo usuario
    $('#form-nuevoUsuario').submit(function(e){
        //Asignar variables a nombres de elementos del formulario
        var $nombre_1 = $('#txt-nombre_1');
        var $nombre_2 = $('#txt-nombre_2');
        var $apellido_1 = $('#txt-apellido_paterno');
        var $apellido_2 = $('#txt-apellido_materno');
        var $dni = $('#txt-dni');
        var $fecha_nac = $('#txt-fecha_nac');
        var $direccion = $('#txt-direccion');
        var $correo = $('#txt-correo');
        var $usuario = $('#txt-usuario');
        var $clave = $('#txt-clave');
        var $sede = $('#sel-sede');
        var $area = $('#sel-area');
        var $perfil = $('#sel-perfil');
        var $extension = $('#txt-extension');
        var $fecha_ingreso = $('#txt-fecha_ingreso');
        var $foto = $('#file-foto');
        var $permisos = $('#sel-permisos');

        //Variables de elementos con valor
        var $nombre_1Val = $nombre_1.val();
        var $nombre_2Val = $nombre_2.val();
        var $apellido_1Val = $apellido_1.val();
        var $apellido_2Val = $apellido_2.val();
        var $dniVal = $dni.val();
        var $fecha_nacVal = $fecha_nac.val();
        var $direccionVal = $direccion.val();
        var $correoVal = $correo.val();
        var $usuarioVal = $usuario.val();
        var $claveVal = $clave.val();
        var $sedeVal = $sede.val();
        var $areaVal = $area.val();
        var $perfilVal = $perfil.val();
        var $extensionVal = $extension.val();
        var $fecha_ingresoVal = $fecha_ingreso.val();
        var $fotoVal = $foto.val();
        var $permisosVal = $permisos.val();

        let nombre_1Eval = validate_input(2, 90, $nombre_1Val);
        if (nombre_1Eval !== ''){
            validate_error($nombre_1, nombre_1Eval, 'Nombre 1');
            return false
        } else {
            $($nombre_1).removeClass('validate_red');
        }

        let apellido_1Eval = validate_input(2, 90, $apellido_1Val);
        if (apellido_1Eval !== ''){
            validate_error($apellido_1, apellido_1Eval, 'Apellido paterno');
            return false
        } else {
            $($apellido_1).removeClass('validate_red');
        }

        let apellido_2Eval = validate_input(2, 90, $apellido_2Val);
        if (apellido_2Eval !== ''){
            validate_error($apellido_2, apellido_2Eval, 'Apellido materno');
            return false
        } else {
            $($apellido_2).removeClass('validate_red');
        }

        let dniEval = validate_input(8, 8, $dniVal);
        if (dniEval !== ''){
            validate_error($dni, dniEval, 'DNI');
            return false
        } else {
            $($dni).removeClass('validate_red');
        }

        let fecha_nacEval = validate_input(10, 10, $fecha_nacVal);
        if (fecha_nacEval !== ''){
            validate_error($fecha_nac, fecha_nacEval, 'Fecha de nacimiento');
            return false
        } else {
            $($fecha_nac).removeClass('validate_red');
        }

        let usuarioEval = validate_input(4, 20, $usuarioVal);
        if (usuarioEval !== ''){
            validate_error($usuario, usuarioEval, 'Usuario');
            return false
        } else {
            $($usuario).removeClass('validate_red');
        }

        let claveEval = validate_input(6, 20, $claveVal);
        if (claveEval !== ''){
            validate_error($clave, claveEval, 'Contraseña');
            return false
        } else {
            $($clave).removeClass('validate_red');
        }

        let sedeEval = validate_select($sedeVal);
        if (sedeEval !== ''){
            validate_error($sede, sedeEval, 'Sede');
            return false
        } else {
            $($sede).removeClass('validate_red');
        }

        let areaEval = validate_select($areaVal);
        if (areaEval !== ''){
            validate_error($area, areaEval, 'Área');
            return false
        } else {
            $($area).removeClass('validate_red');
        }

        let perfilEval = validate_select($perfilVal);
        if (perfilEval !== ''){
            validate_error($perfil, perfilEval, 'Perfil');
            return false
        } else {
            $($perfil).removeClass('validate_red');
        }

        let extensionEval = validate_num(200, 9999, $extensionVal);
        if (extensionEval !== ''){
            validate_error($extension, extensionEval, 'Extensión');
            return false
        } else {
            $($extension).removeClass('validate_red');
        }

        let fecha_ingresoEval = validate_input(10, 10, $fecha_ingresoVal);
        if (fecha_ingresoEval !== ''){
            validate_error($fecha_ingreso, fecha_ingresoEval, 'Fecha de ingreso');
            return false
        } else {
            $($fecha_ingreso).removeClass('validate_red');
        }

        let persmisosEval = validate_select($permisosVal);
        if (persmisosEval !== ''){
            validate_error($permisos, persmisosEval, 'Permisos');
            return false
        } else {
            $($permisos).removeClass('validate_red');
        }

        let accion = $('#accion_usuario').val();
        e.preventDefault();
        let formData = new FormData(this);
        $.ajax({
            url: 'nuevoUsuario.php?'+accion,
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(data){
                swal_ok(data);
                $('#modalAgregar').modal('hide');
                $('#empleados').load('usuariosAjax.php');
            }
        });

    })

    function validar_sap(){
        var nombre = $("#nombre_sap").val();
        let op = $('#op').val();
        $.ajax({
            url: '../newSedeAreaPerfil.php',
            type: 'POST',
            data:{
                'nombre':nombre,'op':op,'val':1
            },
            success: function(data){
                if (data==1){
                    $("#save-sap-btn").prop("disabled", true);
                    $('#nombre_sap').focus();
                    swal_validar('El nombre ingresado ya existe');
                } else {
                    $("#save-sap-btn").prop("disabled", false);
                }
            }
        });
    }

    function validar_usuario(){
        var usuario = $('#txt-usuario').val();
        $.ajax({
            url: 'nuevoUsuario.php',
            type: 'POST',
            data:{
                'usuario':usuario,'val':1
            },
            success: function(data){
                if (data==1){
                    $("#save-usuario-btn").prop("disabled", true);
                    $('#txt-usuario').focus();
                    swal_validar('El nombre de usuario ingresado ya existe');
                } else {
                    $("#save-usuario-btn").prop("disabled", false);
                }
            }
        });
    }

    function deshabilitar(op, id, del) {
        $.ajax({
            url: '../newSedeAreaPerfil.php',
            type: 'POST',
            data:{
                'op':op,'del':del,'id':id
            },
            dataType:'json',
            success: function(data){
                let url = '../SAP-Ajax.php?op='+data[2];
                if (op==='Módulo'){
                    url = 'modulosAjax.php';
                } else if (op==='Usuario'){
                    url = 'usuariosAjax.php';
                }
                swal_ok(data[0]);
                $('#'+data[3]).load(url);
            },
            error: function () {
                swal_validar('No es posible eliminar este registro');
            }
        });
    }

    function mod_usuario(id) {
        $('#save-usuario-btn').show();
        $('#accion_usuario').val('mod');
        $('#id').val(id);
        $('#modalAgregar-Contenido').load('nuevoUsuario.php?id='+id);
        $('#modalAgregar').modal({
            backdrop: 'static',
            keyboard: false
        })
    }

    function ver_usuario(id) {
        $('#save-usuario-btn').hide();
        $('#accion_usuario').val('view');
        $('#id').val(id);
        $('#modalAgregar-Contenido').load('nuevoUsuario.php?view&id='+id);
        $('#modalAgregar').modal({
            backdrop: 'static',
            keyboard: false
        })
    }
</script>
</body>
</html>