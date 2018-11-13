<?php
include 'funciones/global.php';
//Validar permiso para acceder
//acceso('HFC', $s_app, $_SERVER['PHP_SELF'].'?'.$_SERVER['QUERY_STRING']);

//Título de página
$nombre_app = '';

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
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/bootstrap.chosen.min.css" rel="stylesheet">
    <link href="css/Site.css" rel="stylesheet">
    <link href="fontawesome/css/all.min.css" rel="stylesheet">
    <link href="css/jquery-ui.min.css" rel="stylesheet">
    <link href="css/jquery.fancybox.min.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>

<!--Top header inicio-->
<?php include 'header-app.php' ?>
<div class="modal left fade" id="menu-lateral-Modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="nav flex-sm-column flex-row">
                    <?php
                    include 'menu_left.php';
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

<!--Inicio footer-->
<?php include 'footer-app.php' ?>
<!--Fin footer-->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="js/sweetalert2.all.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="fontawesome/js/all.min.js"></script>
<script type="text/javascript" src="js/js.cookie.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<?php include 'js/current_time.js' ?>
<script>

</script>
</body>
</html>