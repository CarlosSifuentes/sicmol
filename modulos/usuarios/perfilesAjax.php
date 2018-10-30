<?php
/**
 * Created by PhpStorm.
 * User: carlo
 * Date: 29/10/2018
 * Time: 11:58 PM
 */

include '../../funciones/global.php';

$query_perfiles = '
SELECT
id,
nombre,
estado
FROM
perfiles
ORDER BY 
nombre
';
$perfiles = $mysqli->query($query_perfiles) or die($mysqli->error);
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
        <td></td>
    </tr>
    <?php } ?>
    </tbody>
</table>
