<?php
/**
 * Created by PhpStorm.
 * User: carlo
 * Date: 29/10/2018
 * Time: 11:58 PM
 */

include '../../funciones/global.php';

$op = $_GET['op'];

if ($op === 'Perfil') {
    $table = 'perfiles';
    $ajax = 'perfilesAjax.php';
} else if ($op === 'Área') {
    $table = 'areas';
    $ajax = 'areasAjax.php';
} else if ($op === 'Sede') {
    $table = 'sedes';
    $ajax = 'sedesAjax.php';
}

$query_perfiles = '
SELECT
id,
nombre,
estado
FROM
'.$table.'
ORDER BY 
nombre
';
$perfiles = $mysqli->query($query_perfiles) or die($mysqli->error.error_mysql($query_perfiles));
?>

<table class="table table-striped table-bordered table-sm">
    <thead>
    <tr class="th_all text-center">
        <th>ID</th>
        <th>Nombre</th>
        <th>Estado</th>
        <th>Opción</th>
    </tr>
    </thead>
    <tbody>
    <?php
    while ($row_perfiles = $perfiles->fetch_row()){
        list($id, $nombre, $estado) = $row_perfiles;
        ?>
    <tr class="text-center">
        <td><?php echo $id ?></td>
        <td><?php echo $nombre ?></td>
        <td><?php echo disponible($estado) ?></td>
        <td>
            <?php if ($estado==1){ ?>
            <a href="javascript:void(0)" title="Deshabilitar" class="text-warning" onclick="deshabilitar('<?php echo $op ?>', <?php echo $id ?>, 0)"><i class="fa fa-ban"></i></a>
            <?php }
            else if ($estado==0){ ?>
                <a href="javascript:void(0)" title="Habilitar" class="text-success" onclick="deshabilitar('<?php echo $op ?>', <?php echo $id ?>, 1)"><i class="fa fa-check"></i></a>
            <?php } ?>
            <a href="javascript:void(0)" title="Eliminar" class="text-danger" onclick="deshabilitar('<?php echo $op ?>', <?php echo $id ?>, 2)"><i class="fa fa-trash-alt"></i></a>
        </td>
    </tr>
    <?php } ?>
    </tbody>
</table>
<div class="text-muted">Sólo es posible eliminar registros que no se hayan usado en la generación de usuarios...</div>
