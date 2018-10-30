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
                        <a class="btn btn-primary btn-sm text-white"><i class="fa fa-plus"></i> Nuevo usuario</a>
                    </div>
                    <div class="tab-pane fade" id="modulo" role="tabpanel" aria-labelledby="profile-tab">
                        <a class="btn btn-primary btn-sm text-white"><i class="fa fa-plus"></i> Nuevo módulo</a>
                    </div>
                    <div class="tab-pane fade" id="sede" role="tabpanel" aria-labelledby="contact-tab">
                        <a class="btn btn-primary btn-sm text-white"><i class="fa fa-plus"></i> Nueva sede</a>
                    </div>
                    <div class="tab-pane fade" id="area" role="tabpanel" aria-labelledby="contact-tab">
                        <a class="btn btn-primary btn-sm text-white"><i class="fa fa-plus"></i> Nueva área</a>
                    </div>
                    <div class="tab-pane fade" id="perfil" role="tabpanel" aria-labelledby="contact-tab">
                        <div class="row">
                            <div class="col-6 text-left mb-2">
                                <h5>Lista de perfiles</h5>
                            </div>
                            <div class="col text-right">
                                <a href="javascript:void(0)" id="newperfil-btn" class="btn btn-primary btn-sm text-white"><i class="fa fa-plus"></i> Nuevo perfil</a>
                            </div>
                        </div>

                        <div id="perfiles">
                        </div>
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
<div class="modal fade" id="modalAgregar" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
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
                <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="far fa-window-close"></i> Cerrar</button>
                <button type="button" class="btn btn-success"><i class="fa fa-save"></i> Guardar cambios</button>
            </div>
        </div>
    </div>
</div>
<!--fin Modal nuevoUsuario.php-->

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
                <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="far fa-window-close"></i> Cerrar</button>
                <button type="button" class="btn btn-success" id="save-sap-btn"><i class="fa fa-save"></i> Guardar cambios</button>
            </div>
        </div>
    </div>
</div>
<!--fin Modal newSedeAreaPerfil-->

<!--Scripts javascript-->
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../../js/all.min.js"></script>
<script type="text/javascript" src="../../js/global.js"></script>
<script type="text/javascript" src="../../js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="../../js/sweetalert2.all.min.js"></script>
<?php include '../../js/current_time.js' ?>
<!--Scripts-->
<script>
    var $perfiles_tab = $('#perfiles-tab');
    var $perfiles = $('#perfiles');
    $(function () {
        $perfiles_tab.click(function () {
            $perfiles.load('perfilesAjax.php');
        })

        $('#newperfil-btn').click(function () {
            $('#modalSedeAreaPerfil-Titulo').html('Nuevo perfil');
            $('#op').val('Perfil');
            $('#modalSedeAreaPerfil').modal({
                backdrop:'static',
                keyboard:false
            });
        })

        $('#nombre_sap').change(function () {
            validar_sap();
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
                $('#'+data[1]).load(data[2]);
            }
        })
    })

    function nuevoUsuario() {
        $('#modalAgregar').modal({
            backdrop:'static',
            keyboard:false
        });
        $('#modalAgregar-Contenido').load('nuevoUsuario.php')

    }

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

    function deshabilitar(op, id, del) {
        $.ajax({
            url: 'newSedeAreaPerfil.php',
            type: 'POST',
            data:{
                'op':op,'del':del,'id':id
            },
            dataType:'json',
            success: function(data){
                swal_ok(data[0]);
                $('#'+data[1]).load(data[2]);
            }
        });
    }
</script>
</body>
</html>