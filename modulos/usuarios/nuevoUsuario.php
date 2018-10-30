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
                <label for="nombre_1">Nombre 1</label>
                <input type="text" class="form-control form-control-sm" id="nombre_1" name="nombre_1">
            </div>
            <div class="form-group col">
                <label for="nombre_2">Nombre 2</label>
                <input type="text" class="form-control form-control-sm" id="nombre_2" name="nombre_2">
            </div>
        </div>
        <div class="row tiny-gutters">
            <div class="form-group col-6">
                <label for="apellido_paterno">Apellido paterno</label>
                <input type="text" class="form-control form-control-sm" id="apellido_paterno" name="apellido_paterno">
            </div>
            <div class="form-group col">
                <label for="apellido_materno">Apellido materno</label>
                <input type="text" class="form-control form-control-sm" id="apellido_materno" name="apellido_materno">
            </div>
        </div>
        <div class="row tiny-gutters">
            <div class="form-group col-6">
                <label for="dni">DNI</label>
                <input type="text" class="form-control form-control-sm" id="dni" name="dni">
            </div>
            <div class="form-group col">
                <label for="fecha_nac">Fecha nacimiento</label>
                <input type="text" class="form-control form-control-sm" id="fecha_nac" name="fecha_nac">
            </div>
        </div>
        <div class="row tiny-gutters">
            <div class="form-group col">
                <label for="direccion">Dirección</label>
                <input type="text" class="form-control form-control-sm" id="direccion" name="direccion">
            </div>
        </div>
        <div class="row tiny-gutters">
            <div class="form-group col">
                <label for="correo">Correo electrónico</label>
                <input type="text" class="form-control form-control-sm" id="correo" name="correo">
            </div>
        </div>
    </div>
    <div class="col-6 border-left">
        <div class="row tiny-gutters">
            <div class="form-group col-6">
                <label for="usuario">Nombre de usuario</label>
                <input type="text" class="form-control form-control-sm" id="usuario" name="usuario">
            </div>
            <div class="form-group col">
                <label for="clave">Contraseña</label>
                <input type="password" class="form-control form-control-sm" id="clave" name="clave">
            </div>
        </div>
        <div class="row tiny-gutters">
            <div class="form-group col-6">
                <label for="usuario">Sede</label>
                <select id="sede" name="sede" class="form-control form-control-sm">
                    <option value="0">Elegir...</option>
                </select>
            </div>
            <div class="form-group col">
                <label for="clave">Area</label>
                <select id="area" name="area" class="form-control form-control-sm">
                    <option value="0">Elegir...</option>
                </select>
            </div>
        </div>
        <div class="row tiny-gutters">
            <div class="form-group col-6">
                <label for="usuario">Perfil</label>
                <select id="perfil" name="perfil" class="form-control form-control-sm">
                    <option value="0">Elegir...</option>
                </select>
            </div>
            <div class="form-group col">
                <label for="extension">Extensión</label>
                <input type="text" class="form-control form-control-sm" id="extension" name="extension">
            </div>
        </div>
        <div class="row tiny-gutters">
            <div class="form-group col-6">
                <label for="fecha_ingreso">Fecha ingreso</label>
                <input type="text" class="form-control form-control-sm" id="fecha_ingreso" name="fecha_ingreso">
            </div>
            <div class="form-group col">
            </div>
        </div>
        <div class="row tiny-gutters">
            <div class="form-group col">
                <label for="permisos">Permisos</label>
                <select id="permisos" name="permisos" data-placeholder="Elegir permisos..." class="form-control form-control-sm" multiple style="width:350px;" tabindex="4">
                    <option value=""></option>
                    <option value="United States">United States</option>
                    <option value="United Kingdom">United Kingdom</option>
                    <option value="Afghanistan">Afghanistan</option>
                    <option value="Albania">Albania</option>
                    <option value="Algeria">Algeria</option>
                    <option value="American Samoa">American Samoa</option>
                    <option value="Andorra">Andorra</option>
                    <option value="Angola">Angola</option>
                    <option value="Anguilla">Anguilla</option>
                </select>
            </div>
        </div>
    </div>
</div>
<script>
$('#sede, #area, #perfil #permisos').chosen({width:'100%'});
</script>