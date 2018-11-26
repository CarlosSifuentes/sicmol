<?php
/**
 * Created by PhpStorm.
 * User: carlo
 * Date: 29/10/2018
 * Time: 9:52 PM
 */

require_once 'funciones/global.php';
?>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Área Restringida</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/Site.css" rel="stylesheet">

    <style>
        body {
            height: 100%;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-align: center;
            align-items: center;
            background-image:url(images/gradient_red.png);
            background-repeat:repeat-x;
        }

        .form-signin {
            margin: auto;
            border: solid 1px #EEEEEE;
            padding: 20px;
            background-color: #FFF;
        }

        .form-signin .form-control {
            position: relative;
            box-sizing: border-box;
            height: auto;
            padding: 10px;
            font-size: 12px;
            margin: 0;
        }
        .form-signin .form-control:focus {
            z-index: 2;
        }
        .aviso {
            border: solid 1px #ffa0a0;
        }

    </style>
</head>

<body class="text-center">
<div class="form-signin rounded">
    <img class="mb-5" src="images/logo_mini.fw.png">
    <div class="text-danger">
        <h5>
            <i class="fa fa-user-lock fa-3x" data-fa-transform="up-3"></i>
            <br>
            Área restringida
        </h5>
    </div>
    <div class="text-warning mb-0">
        No tienes suficientes privilegios para acceder a esta zona
    </div>
    <div class="text-muted mb-3"><small>Ruta: <?php echo $_GET['path'].'<br>Permiso requerido: '.$_GET['auth'] ?></small></div>
    <div class="btn-group" role="group" aria-label="Basic example">
        <button type="button" class="btn btn-secondary font-size-12" onclick="location.href='<?php echo $_SERVER['HTTP_REFERER'] ?>'"><i class="fa fa-arrow-left"></i> Regresar</button>
        <button type="button" class="btn btn-primary font-size-12" onclick="location.href='index.php'"><i class="fa fa-home"></i> Ir a inicio</button>
        <button type="button" class="btn btn-warning font-size-12" onclick="location.href='login.php?accesscheck=<?php echo urlencode($_GET['path']) ?>'"><i class="fa fa-redo-alt"></i> Reintentar</button>
        <button type="button" class="btn btn-danger font-size-12" onclick="location.href='?doLogout=true'" title="Cerrar sesión"><i class="fa fa-sign-out-alt"></i></button>
    </div>
    <div class="padding-b5" style="padding-top: 10px">
        <small class="text-muted">&copy; 2016-2018</small>
    </div>
</div>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/all.min.js"></script>
<script>
    function text() {
        var a=document.getElementById('password');
        var b=document.getElementById('button');
        if (a.type=="password"){
            a.type = "text";
            $('#button').removeClass('fa-eye');
            $('#button').addClass('fa-eye-slash');
        }
        else {
            a.type = "password";
            $('#button').removeClass('fa-eye-slash');
            $('#button').addClass('fa-eye');
        }
    }
</script>
</body>
</html>