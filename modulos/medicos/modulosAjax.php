<?php
/**
 * Created by PhpStorm.
 * User: Carlos Sifuentes
 * Date: 30/10/2018
 * Time: 5:09 PM
 */

require_once '../../funciones/global.php';

$query_modulos =
    'SELECT 
    id,
    app,
    base,
    mes,
    orden,
    filtro,
    estado,
    tclientes,
    tgestiones,
    tventas,
    tacciones
    FROM
    modulos
    ORDER BY
    id';
$modulos = $mysqli->query($query_modulos) or die ($mysqli->error);
?>
<table class="table table-bordered table-striped table-sm table-responsive-lg">
    <thead>
    <tr class="th_all text-center">
        <th>ID</th>
        <th>App</th>
        <th>Base</th>
        <th>Orden</th>
        <th>Filtro</th>
        <th>T. Clientes</th>
        <th>T. Gestiones</th>
        <th>T. Ventas</th>
        <th>T. Acciones</th>
        <th>Estado</th>
        <th>Opción</th>
    </tr>
    </thead>
    <tbody>
    <?php
    while ($row_modulos = $modulos->fetch_row()){
        list(
            $id,
            $app,
            $base,
            $mes,
            $orden,
            $filtro,
            $estado,
            $tclientes,
            $tgestiones,
            $tventas,
            $tacciones
            ) = $row_modulos;
    ?>
    <tr class="text-center">
        <td><?php echo $id ?></td>
        <td><?php echo $app ?></td>
        <td><?php echo $base ?></td>
        <td><?php echo $orden ?></td>
        <td><?php echo $filtro ?></td>
        <td><?php echo $tclientes ?></td>
        <td><?php echo $tgestiones ?></td>
        <td><?php echo $tventas ?></td>
        <td><?php echo $tacciones ?></td>
        <td><?php echo disponible($estado) ?></td>
        <td>
            <?php if ($estado==1){ ?>
                <a href="javascript:void(0)" title="Deshabilitar" class="text-warning" onclick="deshabilitar('Módulo', <?php echo $id ?>, 0)"><i class="fa fa-ban"></i></a>
            <?php }
            else if ($estado==0){ ?>
                <a href="javascript:void(0)" title="Habilitar" class="text-success" onclick="deshabilitar('Módulo', <?php echo $id ?>, 1)"><i class="fa fa-check"></i></a>
            <?php } ?>
            <a href="javascript:void(0)" title="Eliminar" class="text-danger" onclick="deshabilitar('Módulo', <?php echo $id ?>, 2)"><i class="fa fa-trash-alt"></i></a>
        </td>
    </tr>
    <?php } ?>
    </tbody>
</table>
