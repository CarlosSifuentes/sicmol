<?php
require_once 'Connections/dbc.php';
error_reporting(E_ALL);  ini_set("display_errors", 1);

if (isset($_POST['option'])){
    $option = $_POST['option'];
    $op = $_POST['op'];
    if ($option === 'Login'){
        $username = $_POST['username'];
        if ($op === '1'){
            $query_username = "SELECT id FROM empleados WHERE usuario='".$username."'";
            $result_username = $mysqli->query($query_username);
            $existe = $result_username->num_rows;
            if ($existe>0){
                echo 'ok';
            } else {
                echo 'error';
            }
            die();
        } else if ($op === '2'){
            $password = $_POST['password'];
            $query_login = "SELECT id FROM empleados WHERE BINARY  usuario='".$username."' AND BINARY clave='".$password."'";
            $result_login = $mysqli->query($query_login);
            $existe = $result_login->num_rows;
            //die ($existeL);
            if ($existe>0){
                echo 'ok';
            } else {
                echo 'error';
            }
            die();
        }
    }
}

$ruta = $_SERVER['SCRIPT_NAME'];
$ip = $_SERVER['REMOTE_ADDR'];

// *** Validate request to login to this site.
if (!isset($_SESSION)) {
    session_start();
}

$loginFormAction = $_SERVER['PHP_SELF'];
if (isset($_GET['accesscheck'])) {
    $_SESSION['PrevUrl'] = $_GET['accesscheck'];
}

function elimina_espacios($cadena){
    //Eliminar espacios dentro de una frase
    return preg_replace('/( ){2,}/u',' ',$cadena);
}

if (isset($_POST['username'])) {
    $loginUsername=$_POST['username'];
    $password=$_POST['password'];
    $MM_fldUserAuthorization = "";
    $MM_redirectLoginSuccess = "index.php";
    $MM_redirectLoginFailed = "login.php";
    $MM_redirecttoReferrer = true;

    $LoginRS__query = '
    SELECT
    e.id,
    e.nombre_1,
    e.nombre_2,
    e.apellido_paterno,
    e.apellido_materno,
    e.dni,
    e.fecha_nac,
    e.usuario,
    e.clave,
    e.correo,
    e.telf1,
    e.telf2,
    e.direccion,
    e.area,
    e.perfil,
    e.extension,
    e.sede,
    e.nivel,
    e.app,
    e.fecha_ingreso,
    s.nombre s_sede,
    a.nombre s_area
    FROM (empleados e
    LEFT JOIN sedes s 
    ON e.sede = s.id)
    LEFT JOIN areas a
    ON e.area = a.id
    WHERE e.usuario = \''.$loginUsername.'\'
    AND e.clave = \''.$password.'\'
    AND e.estado = 1';

    $LoginRS = $mysqli->query($LoginRS__query) or die ($mysqli->error);
    $loginFoundUser = $LoginRS->num_rows;
    $row_user = $LoginRS->fetch_assoc();

    if ($loginFoundUser) {
        $loginStrGroup = "";

        if (PHP_VERSION >= 5.1) {session_regenerate_id(true);} else {session_regenerate_id();}
        //declare two session variables and assign them
        $_SESSION['MM_Username'] = $loginUsername;
        $_SESSION['MM_UserGroup'] = $loginStrGroup;
        $_SESSION['id'] = $row_user['id'];
        $_SESSION['sede'] = $row_user['sede'];
        $_SESSION['nombres'] = elimina_espacios($row_user['nombre_1'].' '.$row_user['nombre_2']);
        $_SESSION['apellidos'] = $row_user['apellido_paterno'].' '.$row_user['apellido_materno'];
        $_SESSION['nombre_1'] = $row_user['nombre_1'];
        $_SESSION['nombre_2'] = $row_user['nombre_2'];
        $_SESSION['nombre_completo'] = elimina_espacios($row_user['nombre_1'].' '.$row_user['nombre_2'].' '.$row_user['apellido_paterno'].' '.$row_user['apellido_materno']);
        $_SESSION['area'] = $row_user['area'];
        $_SESSION['app'] = $row_user['app'];
        $_SESSION['perfil'] = $row_user['perfil'];
        $_SESSION['nivel'] = $row_user['nivel'];
        $_SESSION['ext'] = $row_user['extension'];
        $_SESSION['mail'] = $row_user['correo'];
        $_SESSION['sede_nom'] = $row_user['s_sede'];
        $_SESSION['area_nom'] = $row_user['s_area'];

        mysqli_query($mysqli,'UPDATE empleados SET ult_pausa=NOW() WHERE id='.$_SESSION['id']);

        $query_anexos = "SELECT id FROM extensiones WHERE numero=".$_SESSION['ext']." AND usuario=".$_SESSION['id']." AND fecha=CURDATE()";
        $anexos = $mysqli->query($query_anexos) or die ($mysqli->error);

        if ($anexos->num_rows==0){
            mysqli_query($mysqli,"INSErT INTO extensiones SET usuario=".$_SESSION['id'].", fecha=CURDATE(), numero=".$_SESSION['ext']) or die (mysqli_error($mysqli));
        }

        if (isset($_SESSION['PrevUrl']) && true) {
            $MM_redirectLoginSuccess = $_SESSION['PrevUrl'];
        }
        header("Location: " . $MM_redirectLoginSuccess );
    }
    else {$quser = mysqli_query($mysqli,"SELECT usuario FROM empleados WHERE usuario='$loginUsername'") or die (mysqli_error($mysqli));
        if ($quser->num_rows>0){$userror = "?u=1";} else {$userror = "?u=0";}

        header("Location: ". $MM_redirectLoginFailed.$userror);
        die('ok');
    }
}
?>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Ingresar</title>
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
            background-image:url(images/gradient_tlmk.png);
            background-repeat:repeat-x;
        }

        .form-signin {
            width: 100%;
            max-width: 330px;
            padding: 12px;
            margin: auto;
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

    </style>
</head>

<body class="text-center">
<form id="formLogin" method="POST" action="" class="form-signin" style="background-color: #FFF; border-radius: 4px; padding-top: 20px">
    <img class="mb-4" src="images/logo_mini.fw.png">
    <h5 class="h5 mb-3 font-weight-normal text-info">Iniciar sesión</h5>
    <div class="input-group">
        <div class="input-group mb-1">
            <div class="input-group-prepend">
                <div class="input-group-text"><i class="fa fa-user fa-fw"></i></div>
            </div>
            <input type="text" class="form-control" id="username" name="username" placeholder="Usuario">
        </div>
    </div>

    <div class="input-group mb-1" style="display: none" id="div-password">
        <div class="input-group-prepend">
            <span class="input-group-text"><i class="fa fa-key fa-fw"></i></span>
        </div>
        <input type="password" id="password" name="password" class="form-control" placeholder="Contraseña">
        <div class="input-group-append">
            <span class="input-group-text"><a href="javascript:void(0)" class="text-muted"><i class="far fa-eye fa-fw" id="button" onclick="text()"></i></a></span>
        </div>
    </div>

    <button class="btn btn-lg btn-info btn-block font-size-12" type="submit" style="display: none" id="btn-save-login"><i class="fa fa-sign-in-alt"></i> Ingresar</button>
    <div class="padding-b5" style="padding-top: 10px">
        <small class="text-muted">&copy; 2016-2018</small>
    </div>
</form>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/all.min.js"></script>
<script type="text/javascript" src="js/sweetalert2.all.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="js/global.js"></script>
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

    $('#username').blur(function () {
        let username = $('#username').val();
        $.ajax({
            url:'login.php',
            type:'POST',
            data:{
                'option':'Login',
                'op':1,
                'username':username
            },
            success(data){
                if (data==='error'){
                    $('#username').focus();
                    $('#div-password, #btn-save-login').hide();
                    swal_validar('El nombre de usuario ingresado no existe o no está activo')
                } else {
                    $('#div-password, #btn-save-login').show();
                }
            }
        })
    })

    $('#btn-save-login').click(function (e) {
        let username = $('#username').val();
        let password = $('#password').val();
        e.preventDefault();
        $.ajax({
            url:'login.php',
            type:'POST',
            data:{
                'option':'Login',
                'op':2,
                'username':username,
                'password':password
            },
            success(data){
                if (data=='error'){
                    $('#password').focus();
                    swal_validar('Contraseña incorrecta, intente nuevamente');
                } else {
                    $('#formLogin').submit()
                }
            }
        })
    })
</script>
</body>
</html>