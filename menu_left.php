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
                        <td valign="top">Nombre</td>
                        <td valign="top">:</td>
                        <td valign="top"><?php echo $s_nombre_completo ?></td>
                    </tr>
                    <tr>
                        <td valign="top">Usuario</td>
                        <td valign="top">:</td>
                        <td valign="top"><?php echo $s_usuario ?></td>
                    </tr>
                    <tr>
                        <td valign="top">Anexo</td>
                        <td valign="top">:</td>
                        <td valign="top"><?php echo $s_ext ?></td>
                    </tr>
                    <tr>
                        <td valign="top">Cargo</td>
                        <td valign="top">:</td>
                        <td valign="top"><?php echo $cargoP ?></td>
                    </tr>
                    <tr>
                        <td valign="top">Area</td>
                        <td valign="top">:</td>
                        <td valign="top"><?php echo $areaP ?></td>
                    </tr>
                    <tr>
                        <td valign="top">Ingreso</td>
                        <td valign="top">:</td>
                        <td valign="top"><?php echo $ingresoP ?></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <h3>CRM</h3>
        <div>
            <div id="divMenu">
                <div style="text-align:center"><strong>Cencosud</strong></div>
                <hr />

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
        <!--<h3>Central telefónica</h3>
        <div>
            <div id="divMenu">
                <div style="text-align:center"><strong>Elastix</strong></div>
                <hr style="border: 0; height: 1px; background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));" />
                <ul style="list-style:circle">
                    <li><a href="<?php /*echo "http://".$_SERVER['HTTP_HOST']."/intranet/recursos_humanos/llamadas.php" */?>">Buscar llamadas</a></li>
                </ul>
            </div>
        </div>-->
        <h3>Administración</h3>
        <div>
            <div id="divMenu">
                <div style="text-align:center; width: 100% !important;s"><strong>Asistencia</strong></div>
                <hr  />
                <i class="fa fa-user"></i> <a href="<?php echo 'http://'.$_SERVER['HTTP_HOST'].'/sicmol/modulos/usuarios/' ?>">Usuarios</a>
            </div>
        </div>
    </div>
    <div>

    </div>
</div>