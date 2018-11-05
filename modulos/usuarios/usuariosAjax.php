<?php
/**
 * Created by PhpStorm.
 * User: Carlos Sifuentes
 * Date: 30/10/2018
 * Time: 5:09 PM
 */

require_once '../../funciones/global.php';

$query_usuarios =
    'SELECT 
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
    e.foto,
    e.direccion,
    e.area,
    e.extension,
    e.sede,
    e.perfil,
    e.nivel,
    e.pausa,
    e.app,
    e.fecha_ingreso,
    e.fecha_cese,
    e.ult_accion,
    e.ult_pausa,
    e.estado,
    p.nombre pnombre,
    a.nombre anombre,
    s.nombre snombre
    FROM
    empleados e
    JOIN perfiles p ON e.perfil = p.id
    JOIN areas a on e.area = a.id
    JOIN sedes s on e.sede = s.id
    ORDER BY
    e.id';
$usuarios = $mysqli->query($query_usuarios) or die ($mysqli->error);
?>
<table class="table table-bordered table-striped table-sm table-responsive-lg">
    <thead>
    <tr class="th_all text-center">
        <th>ID</th>
        <th>Nombres</th>
        <th>DNI</th>
        <th>Usuario</th>
        <th>Contraseña</th>
        <th>Extensión</th>
        <th>Perfil</th>
        <th>Sede</th>
        <th>Area</th>
        <th>Estado</th>
        <th>Opción</th>
    </tr>
    </thead>
    <tbody>
    <?php
    while ($row_usuarios = $usuarios->fetch_row()){
        list(
            $id,
            $nombre_1,
            $nombre_2,
            $apellido_paterno,
            $apellido_materno,
            $dni,
            $fecha_nac,
            $usuario,
            $clave,
            $correo,
            $telf1,
            $telf2,
            $foto,
            $direccion,
            $area,
            $extension,
            $sede,
            $perfil,
            $nivel,
            $pausa,
            $app,
            $fecha_ingreso,
            $fecha_cese,
            $ult_accion,
            $ult_pausa,
            $estado,
            $pnombre,
            $anombre,
            $snombre
            ) = $row_usuarios;
    ?>
    <tr class="text-center">
        <td><?php echo $id ?></td>
        <td><?php echo elimina_espacios($nombre_1.' '.$nombre_2.' '.$apellido_paterno.' '.$apellido_materno) ?></td>
        <td><?php echo $dni ?></td>
        <td><?php echo $usuario ?></td>
        <td><?php echo $clave ?></td>
        <td><?php echo $extension ?></td>
        <td><?php echo $pnombre ?></td>
        <td><?php echo $snombre ?></td>
        <td><?php echo $anombre ?></td>
        <td><?php echo disponible($estado) ?></td>
        <td>
            <a href="javascript:void(0)" title="Ver datos" class="text-info" onclick="ver_usuario(<?php echo $id ?>)"><i class="fa fa-search"></i></a>
            <?php if ($estado==1){ ?>
                <a href="javascript:void(0)" title="Deshabilitar" class="text-warning" onclick="deshabilitar('Usuario', <?php echo $id ?>, 0)"><i class="fa fa-ban"></i></a>
                <a href="javascript:void(0)" title="Modificar datos" class="text-info" onclick="mod_usuario(<?php echo $id ?>)"><i class="far fa-edit"></i></a>
            <?php }
            else if ($estado==0){ ?>
                <a href="javascript:void(0)" title="Habilitar" class="text-success" onclick="deshabilitar('Usuario', <?php echo $id ?>, 1)"><i class="fa fa-check"></i></a>
            <?php } ?>
            <a href="javascript:void(0)" title="Eliminar" class="text-danger" onclick="deshabilitar('Usuario', <?php echo $id ?>, 2)"><i class="fa fa-trash-alt"></i></a>
        </td>
    </tr>
    <?php } ?>
    </tbody>
</table>
