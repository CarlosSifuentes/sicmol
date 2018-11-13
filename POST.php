<?php
/**
 * Created by PhpStorm.
 * User: carlo
 * Date: 9/11/2018
 * Time: 5:48 AM
 */

require_once 'funciones/global.php';

$option = $_POST['option'];
$op = $_POST['op'];

if ($option === 'Pausa'){

    if ($op==0){
        $obs = $_POST['obs'];
        $motivo = $_POST['motivo'];
        $eid = $s_id;
        $enombres = $s_nombre_1;
        $_SESSION['pausa'] = 1;
        $alert_msg = $enombres.", te has puesto en pausa";
        $ruta_ant = $_POST['ruta'];
        setcookie('ruta_anterior',$ruta_ant,0,'/');
        //die($ruta_ant);

        if (isset($_GET['id'])){
            $eid = $_GET['id'];
            $enombres = $_GET['nom'];
            $_SESSION['pausa'] = 0;
            $alert_msg = "Has puesto en pausa a ".$enombres;
        }
        $insert_ausencia = "INSERT INTO emp_estados SET inicio=NOW(), fecha=CURDATE(), motivo=$motivo, usuario=$eid, obs='$obs'";

        $mysqli->query('UPDATE empleados SET pausa=1, ult_pausa=NOW() WHERE id='.$eid);

    } elseif ($op=="1"){
        $insert_ausencia = "UPDATE emp_estados SET fin=NOW(), tiempo=TIME_TO_SEC(TIMEDIFF(NOW(),inicio)) WHERE usuario=$s_id AND fin IS NULL";
        $_SESSION['pausa'] = 0;
        $alert_msg = "Bienvenido nuevamente ".$s_nombres;
        $mysqli->query('UPDATE empleados SET pausa=0, ult_pausa=NOW() WHERE id='.$s_id);
    }
    $mysqli->query($insert_ausencia) or die ($mysqli->error.error_mysql($insert_ausencia));
    echo $alert_msg;
}