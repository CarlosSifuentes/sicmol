<?php
/**
 * Created by PhpStorm.
 * User: carlo
 * Date: 28/10/2018
 * Time: 9:42 PM
 */
?>
<div class="row">
    <div class="col">
        <div class="row tiny-gutters">
            <div class="form-group col-6">
                <label for="app">App</label>
                <input type="text" class="form-control form-control-sm" id="app" name="app" maxlength="4">
            </div>
            <div class="form-group col">
                <label for="tclientes">Tabla Clientes</label>
                <input type="text" class="form-control form-control-sm" id="tclientes" name="tclientes">
            </div>
        </div>
        <div class="row tiny-gutters">
            <div class="form-group col-6">
                <label for="tgestiones">Tabla Gestiones</label>
                <input type="text" class="form-control form-control-sm" id="tgestiones" name="tgestiones">
            </div>
            <div class="form-group col">
                <label for="tventas">Tabla Ventas</label>
                <input type="text" class="form-control form-control-sm" id="tventas" name="tventas">
            </div>
        </div>
    </div>
</div>
<script>
$('#app').keyup(function () {
    mayuscula('#app');
})
</script>