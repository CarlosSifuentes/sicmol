<?php
require_once '../funciones/global.php';
/**
 * Created by PhpStorm.
 * User: carlo
 * Date: 30/10/2018
 * Time: 12:24 AM
 */
$op = $_POST['op'];


if ($op === 'Perfil') {
    $table = 'perfiles';
    $div = 'perfiles';
} else if ($op === 'Área') {
    $table = 'areas';
    $div = 'areas';
} else if ($op === 'Especialidad') {
    $table = 'especialidades';
    $div = 'especialidades';
} else if ($op === 'Sede') {
    $table = 'sedes';
    $div = 'sedes';
 } else if ($op === 'Módulo') {
    $table = 'modulos';
    $div = 'modulos';
} else if ($op === 'Usuario') {
    $table = 'empleados';
    $div = 'empleados';
} else if ($op === 'Documento') {
    $table = 'tipo_documento';
    $div = 'documentos';
}

if (isset($_POST['val'])){
    $nombre = "'".$_POST['nombre']."'";
    $query_val = 'SELECT id FROM '.$table.' WHERE nombre='.$nombre;
    $val = $mysqli->query($query_val);
    if ($val->num_rows>0){
        echo 1;
    } else {
        echo 0;
    }
    exit();
}
else if (isset($_POST['del'])){
    $id = $_POST['id'];
    $del = $_POST['del'];
    if (in_array($del, array(0,1))){
        $disable = 'UPDATE '.$table.' SET estado='.$del.' WHERE id='.$id;
        $msg = 'Estado de '.$op.' actualizado correctamente';
    } else if ($del==2){
        $disable = 'DELETE FROM '.$table.' WHERE id='.$id;
        $msg = $op.' eliminado correctamente';
    }
    $mysqli->query($disable) or die ($mysqli->error);
    $result = array($msg, $table, $op, $div);
    echo json_encode($result);
    exit();
}
else {

    if ($op=='Módulo'){
        $app        = "'" . $_POST['app'] . "'";
        $tclientes  = "'" . $_POST['tclientes'] . "'";
        $tgestiones = "'" . $_POST['tgestiones'] . "'";
        $tventas    = "'" . $_POST['tventas'] . "'";
        $insert     = 'INSERT INTO '.$table .' SET app='.$app .', tclientes='. $tclientes.', tgestiones='. $tgestiones .', tventas='. $tventas;
        if (!$mysqli->query($insert)) {
           printf("Error: %s\n", $mysqli->error);
        } else {
            echo $op.' agregado correctamente';
            exit();
        }

    } else {
        $nombre = "'".$_POST['nombre']."'";
        if ($op === 'Documento'){$nombre = strtoupper($nombre);}
        $insert = 'INSERT INTO '.$table.' SET nombre='.$nombre;
        if (!$mysqli->query($insert)) {
            printf("Error: %s\n", $mysqli->error.error_mysql($insert));
        } else {
            $result = array($op, $table, $div);

            echo json_encode($result);

            exit();
        }
    }
}
