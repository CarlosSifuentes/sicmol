<?php
$query_perfil = "
SELECT
	e.fecha_ingreso,
	a.nombre area_nom,
	p.nombre perfil_nom 
FROM
	empleados e
	JOIN areas a ON e.area = a.id
	JOIN perfiles p ON e.perfil = p.id 
WHERE
	e.id =
".$s_id;
$perfil = $mysqli->query($query_perfil);
$rPe = $perfil->fetch_assoc();
$areaP = $rPe['area_nom'];
$cargoP = $rPe['perfil_nom'];
$ingresoP = formato_fecha($rPe['fecha_ingreso']);
?>
<div class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1" style="overflow: auto">
    <div id="accordion_menu">
        <h3>Mis datos</h3>
        <div>
            <div id="divMenu">
                <table width="100%" border="0" cellspacing="0" cellpadding="2">
                    <tbody>
                    <tr>
                        <td>Nombre</td>
                        <td>:</td>
                        <td><?php echo $s_nombre_completo ?></td>
                    </tr>
                    <tr>
                        <td>Usuario</td>
                        <td>:</td>
                        <td><?php echo $s_usuario ?></td>
                    </tr>
                    <tr>
                        <td>Anexo</td>
                        <td>:</td>
                        <td><?php echo $s_ext ?></td>
                    </tr>
                    <tr>
                        <td>Cargo</td>
                        <td>:</td>
                        <td><?php echo $cargoP ?></td>
                    </tr>
                    <tr>
                        <td>Area</td>
                        <td>:</td>
                        <td><?php echo $areaP ?></td>
                    </tr>
                    <tr>
                        <td>Ingreso</td>
                        <td>:</td>
                        <td><?php echo $ingresoP ?></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <h3>CRM</h3>
        <div>
            <div id="divMenu">
                <div style="text-align:center"><strong>Cencosud</strong></div>
                <hr style="border: 0; height: 1px; background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));" />

                <div class="css-treeview">
                    <ul>
                        <li style="border-bottom: 1px solid #EEE; padding-top: 5px"><input type="checkbox" id="item-0" /><label for="item-0"><i class="fa fa-hand-holding-usd fa-fw" data-fa-transform="up-3"></i> Super Avance Efectivo</label>
                            <ul>
                                <li><i class="fa fa-user fa-fw"></i> <a href="<?php echo "http://".$_SERVER['HTTP_HOST']."/intranet/telemarketing/clientes_mv.php" ?>">Lista de clientes</a></li>
                                <li><i class="far fa-id-card fa-fw"></i> <a href="<?php echo "http://".$_SERVER['HTTP_HOST']."/intranet/telemarketing/superavance/ventas.php" ?>">Ventas</a></li>
                                <li><i class="far fa-chart-bar fa-fw"></i>  <a href="<?php echo "http://".$_SERVER['HTTP_HOST']."/intranet/telemarketing/ranking.php" ?>">Ranking</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div>
            </div>
            <div>
            </div>
        </div>
        <h3>Central telefónica</h3>
        <div>
            <div id="divMenu">
                <div style="text-align:center"><strong>Elastix</strong></div>
                <hr style="border: 0; height: 1px; background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));" />
                <ul style="list-style:circle">
                    <li><a href="<?php echo "http://".$_SERVER['HTTP_HOST']."/intranet/recursos_humanos/llamadas.php" ?>">Buscar llamadas</a></li>
                </ul>
            </div>
        </div>
        <h3>Administración</h3>
        <div>
            <div id="divMenu">
                <div style="text-align:center"><strong>Asistencia</strong></div>
                <hr style="border: 0; height: 1px; background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));" />
                <ul style="list-style:circle">
                    <li><a href="<?php echo "http://".$_SERVER['HTTP_HOST']."/intranet/recursos_humanos/asistencia/control.php?t=".$s_sede ?>">Control</a></li>
                    <li><a href="<?php echo "http://".$_SERVER['HTTP_HOST']."/intranet/recursos_humanos/asistencia/usuarios.php" ?>">Usuarios</a></li>
                    <li><a href="<?php echo "http://".$_SERVER['HTTP_HOST']."/intranet/recursos_humanos/asistencia/reportes.php" ?>">Reporte</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div>

    </div>
    <div style="padding: 5px;">
        <?php
        echo "Estado: ";
        if ($s_pausa == 0){
            echo "<a href=\"http://".$_SERVER['HTTP_HOST']."/intranet/pausa.php?p=".$s_pausa."\" rel=\"modal:open\" title=\"Pausar gestión\">Disponible <i class=\"fa fa-pause\" aria-hidden=\"true\" style=\"color: red\"></i></a>";
        } else {
            echo "<a href=\"http://".$_SERVER['HTTP_HOST']."/intranet/pausa.php?p=".$s_pausa."\" title=\"Reanudar gestión\">En pausa <i class=\"fa fa-play\" aria-hidden=\"true\" style=\"color: green\"></i></a>";
        }
        ?> |
        <a href="<?php echo "http://".$_SERVER['HTTP_HOST']."/intranet/logout.php" ?>" rel="modal:open">Desconectarse</a></div>
</div>