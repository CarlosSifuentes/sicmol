<?php
require_once '../../funciones/global.php';
/**
 * Created by PhpStorm.
 * User: carlo
 * Date: 30/10/2018
 * Time: 12:24 AM
 */
$op = $_POST['op'];


if ($op === 'Perfil') {
    $table = 'perfiles';
    $ajax = 'perfilesAjax.php';
}

if (isset($_POST['val'])){
    $query_val = 'SELECT id FROM '.$table.' WHERE nombre='.$nombre;
    $val = $mysqli->query($query_val);
    if ($val->num_rows>0){
        echo 1;
    } else {
        echo 0;
    }
    exit();
}
elseif (isset($_POST['del'])){
    $id = $_POST['id'];
    $del = $_POST['del'];
    if (in_array($del, array(0,1))){
        $disable = 'UPDATE '.$table.' SET estado='.$del.' WHERE id='.$id;
        $mysqli->query($disable) or die ($mysqli->error);
        $msg = $op.' actualizado correctamente';
    } else if ($del==2){
        $disable = 'DELETE FROM '.$table.' WHERE id='.$id;
        $mysqli->query($disable) or die ($mysqli->error);
        $msg = $op.' elimnado correctamente';
    }
    $result = array($msg, $table, $ajax);
    echo json_encode($result);
    exit();
}
else {
    $nombre = "'".$_POST['nombre']."'";
    $insert = 'INSERT INTO '.$table.' SET nombre='.$nombre;
    if (!$mysqli->query($insert)) {
        printf("Error: %s\n", $mysqli->error);
    } else {
        $result = array($op, $table, $ajax);
        echo json_encode($result);
        exit();
    }
}
