<?php
require_once '../../funciones/global.php';
//Validar permiso para acceder
//acceso('HFC', $s_app, $ruta_actual);

//Título de página
$nombre_app = 'Usuarios';

if ($nombre_app == ''){
    $titulo_pag = 'SICMOL - Control de Citas On Line';
} else {
    $titulo_pag = $nombre_app.' - SICMOL';
}

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
                        <a class="nav-link font-weight-bold text-app" id="areas-tab" data-toggle="tab" href="#area" role="tab" aria-controls="area" aria-selected="false">Áreas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bold text-app" id="perfiles-tab" data-toggle="tab" href="#perfil" role="tab" aria-controls="perfil" aria-selected="false">Perfiles</a>
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
                        <div id="usuarios"></div>
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
                    <div class="tab-pane fade" id="area" role="tabpanel" aria-labelledby="contact-tab">
                        <div class="row">
                            <div class="col-6 text-left mb-2">
                                <h5>Lista de áreas</h5>
                            </div>
                            <div class="col text-right">
                                <a href="javascript:void(0)" id="newarea-btn" class="btn btn-primary btn-sm text-white btn-new">Nueva área</a>
                            </div>
                        </div>
                        <div id="areas"></div>
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
<form id="form-nuevoUsuario">
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
                ...
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
<?php include '../../js/current_time.js' ?>
<!--Scripts-->
<script>

    var $perfiles_tab = $('#perfiles-tab');
    var $perfiles = $('#perfiles');

    var $areas_tab = $('#areas-tab');
    var $areas = $('#areas');

    var $sedes_tab = $('#sedes-tab');
    var $sedes = $('#sedes');

    var $modulos_tab = $('#modulos-tab');
    var $modulos = $('#modulos');

    $(function () {
        $perfiles_tab.click(function () {
            $perfiles.load('SAP-Ajax.php?op=Perfil');
        })

        $areas_tab.click(function () {
            $areas.load('SAP-Ajax.php?op=Área');
        })

        $sedes_tab.click(function () {
            $sedes.load('SAP-Ajax.php?op=Sede');
        })

        $modulos_tab.click(function () {
            $modulos.load('modulosAjax.php');
        })

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

        $('#newarea-btn').click(function () {
            $('#modalSedeAreaPerfil-Titulo').html('Nueva área');
            $('#op').val('Área');
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
            url:'newSedeAreaPerfil.php',
            type: 'POST',
            data:formdata,
            cache: false,
            dataType:'json',
            success: function (data) {
                swal_ok(data[0]+' agregado/a correctamente');
                $nombre.val('');
                $('#modalSedeAreaPerfil').modal('hide');
                $('#'+data[1]).load('SAP-Ajax.php?op='+data[0]);
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
            url:'newSedeAreaPerfil.php',
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


        let nombre_1Eval = validate_input(2, 20, $nombre_1Val);
        if (nombre_1Eval !== ''){
            validate_error($nombre_1, nombre_1Eval, 'Nombre 1');
            return false
        } else {
            $($nombre_1).removeClass('validate_red');
        }

        let apellido_1Eval = validate_input(2, 20, $apellido_1Val);
        if (apellido_1Eval !== ''){
            validate_error($apellido_1, apellido_1Eval, 'Apellido paterno');
            return false
        } else {
            $($apellido_1).removeClass('validate_red');
        }

        /*validate($apellido_1, 2, 20, $apellido_1Val);
        validate($apellido_2, 2, 20, $apellido_2Val);
        validate($dni, 8, 8, $dniVal);
        validate($fecha_nac, 10, 10, $fecha_nacVal);*/

        e.preventDefault()

    })

    function validar_sap(){
        var nombre = $("#nombre_sap").val();
        let op = $('#op').val();
        $.ajax({
            url: 'newSedeAreaPerfil.php',
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
            url: 'newSedeAreaPerfil.php',
            type: 'POST',
            data:{
                'op':op,'del':del,'id':id
            },
            dataType:'json',
            success: function(data){
                let url = 'SAP-Ajax.php?op='+data[2];
                if (op==='Módulo'){
                    url = 'modulosAjax.php';
                }
                swal_ok(data[0]);
                $('#'+data[1]).load(url);
            },
            error: function () {
                swal_validar('No es posible eliminar este registro');
            }
        });
    }
</script>
</body>
</html>