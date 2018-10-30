<?php
include '../../funciones/global.php';
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
    <meta http-equiv="expires" content="43200"/>
    <title><?php echo $titulo_pag ?></title>
    <link rel="shortcut icon" type="image/x-icon" href="../../favicon.ico">

    <!-- Bootstrap core CSS -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="../../css/Site.css" rel="stylesheet">
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
<div class="container" id="mainContainer">
    <div class="card">
        <div class="card-header p-2">
            <div class="float-left p-0 m-0">
                <h5 class="text-app pl-1">Inicio</h5>
            </div>
        </div>
        <div class="card-body">
        </div>
    </div>
</div>

<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../js/all.min.js"></script>
<script type="text/javascript" src="../../js/global.js"></script>
<?php include '../../js/current_time.js' ?>
</body>
</html>