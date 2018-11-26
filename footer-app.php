<?php
$query_motivos = 'SELECT id, nombre FROM emp_tipo_estado WHERE id > 2';
$motivos_estado = $mysqli->query($query_motivos);
?>
<div class="container-fluid bg-light fixed-bottom p-2">
    <div class="container" id="bottomContainer">
        <div class="row">
            <div class="col mr-auto text-black-50">
                <?php echo $saludo.', '.$s_nombre_1.' '.estado($s_pausa) ?>
                <?php if ($s_pausa==0){?>
                <a href="?doLogout=true" title="Cerrar sesión" class="text-danger"><i class="fa fa-sign-out-alt fa-lg"></i></a>
                <?php } ?>
            </div>
            <div class="col ml-auto text-right text-black-50">
                <i class="far fa-clock"></i> <div id="servertime" class="text-right d-inline"></div>
            </div>
        </div>
    </div>
</div>

<!--Modal Pausa-->
<input type="hidden" id="ruta_actual" value="<?php echo $ruta_actual ?>">
<div class="modal" tabindex="-1" role="dialog" id="modalPausa">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header pt-2 pb-2">
                <h5 class="modal-title">Desconectarse</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <label for="motivoPausa">Motivo</label>
                <select name="motivoPausa" id="motivoPausa" class="form-control">
                    <option value="0">Elegir...</option>
                    <?php while ($rM = $motivos_estado->fetch_assoc()) {
                        echo "<option value=\"".$rM['id']."\">".$rM['nombre']."</option>";
                    } ?>
                </select>
                <label for="obsPausa" class="mt-2">Observaciones</label>
                <textarea id="obsPausa" name="obsPausa" class="form-control form-control-sm"></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger btn-sm btn-close" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-success btn-sm btn-save" id="btn-savePausa">Guardar</button>
            </div>
        </div>
    </div>
</div>