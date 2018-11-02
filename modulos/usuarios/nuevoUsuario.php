<?php
/**
 * Created by PhpStorm.
 * User: carlo
 * Date: 28/10/2018
 * Time: 9:42 PM
 */
require_once '../../funciones/global.php';

if (isset($_POST['val'])){
    $usuario = "'".$_POST['usuario']."'";
    $query_val = 'SELECT id FROM empleados WHERE estado=1 AND usuario='.$usuario;
    $val = $mysqli->query($query_val);
    if ($val->num_rows>0){
        echo 1;
    } else {
        echo 0;
    }
    exit();
}

if (isset($_GET['new'])){
    $nombre_1 = $_POST['txt-nombre_1'];
    $nombre_2 = $_POST['txt-nombre_2'];
    $apellido_1 = $_POST['txt-apellido_paterno'];
    $apellido_2 = $_POST['txt-apellido_materno'];
    $dni = $_POST['txt-dni'];
    $fecha_nac = fecha_mysql($_POST['txt-fecha_nac']);
    $direccion = $_POST['txt-direccion'];
    $correo = $_POST['txt-correo'];
    $usuario = $_POST['txt-usuario'];
    $clave = $_POST['txt-clave'];
    $sede = $_POST['sel-sede'];
    $area = $_POST['sel-area'];
    $perfil = $_POST['sel-perfil'];
    $extension = $_POST['txt-extension'];
    $fecha_ingreso = fecha_mysql($_POST['txt-fecha_ingreso']);
    $foto = $_FILES['file-foto'];

    $filename_foto = $dni.'-'.$foto['name'];
    move_uploaded_file($foto['tmp_name'],'fotos/'.$filename_foto);

    $permisos = $_POST['sel-permisos'];
    $text_permisos = '';
    foreach ($_POST['sel-permisos'] as $selectedOption){
        $text_permisos .= $selectedOption.',';
    }

    $usuario_sql = "
    INSERT INTO
    empleados
    SET 
    nombre_1 = '$nombre_1',
    nombre_2 = '$nombre_2',
    apellido_paterno = '$apellido_1',
    apellido_materno = '$apellido_2',
    dni = '$dni',
    fecha_nac = '$fecha_nac',
    direccion = '$direccion',
    correo = '$correo',
    usuario = '$usuario',
    clave = '$clave',
    sede = $sede,
    area = $area,
    perfil = $perfil,
    extension = $extension,
    fecha_ingreso = '$fecha_ingreso',
    foto = '$filename_foto',
    app = '$text_permisos',
    estado = 1
    ";
    if (!$mysqli->query($usuario_sql)){
        printf("Error: %s\n", $mysqli->error);
    } else {
        echo 'Usuario agredado correctamente';
    }
    exit();
}

$query_sedes =
    'SELECT
    id,
    nombre
    FROM
    sedes
    WHERE
    estado = 1
    ORDER BY 
    nombre';
$sedes= $mysqli->query($query_sedes) or die ($mysqli->error);

$query_areas =
    'SELECT
    id,
    nombre
    FROM
    areas
    WHERE
    estado = 1
    ORDER BY 
    nombre';
$areas = $mysqli->query($query_areas) or die ($mysqli->error);

$query_perfiles =
    'SELECT
    id,
    nombre
    FROM
    perfiles
    WHERE
    estado = 1
    ORDER BY 
    nombre';
$perfiles = $mysqli->query($query_perfiles) or die ($mysqli->error);

$query_apps =
    'SELECT
    app
    FROM
    modulos
    WHERE
    estado = 1
    ORDER BY 
    app';
$apps = $mysqli->query($query_apps) or die ($mysqli->error);

?>
<div class="row">
    <div class="col">
        <div class="row tiny-gutters">
            <div class="form-group col-6">
                <label for="txt-nombre_1">Nombre 1</label>
                <input type="text" class="form-control form-control-sm" id="txt-nombre_1" name="txt-nombre_1" onkeyup="mayuscula(this)">
            </div>
            <div class="form-group col">
                <label for="nombre_2">Nombre 2 *</label>
                <input type="text" class="form-control form-control-sm" id="txt-nombre_2" name="txt-nombre_2" onkeyup="mayuscula(this)">
            </div>
        </div>
        <div class="row tiny-gutters">
            <div class="form-group col-6">
                <label for="txt-apellido_paterno">Apellido paterno</label>
                <input type="text" class="form-control form-control-sm" id="txt-apellido_paterno" name="txt-apellido_paterno" onkeyup="mayuscula(this)">
            </div>
            <div class="form-group col">
                <label for="txt-apellido_materno">Apellido materno</label>
                <input type="text" class="form-control form-control-sm" id="txt-apellido_materno" name="txt-apellido_materno" onkeyup="mayuscula(this)">
            </div>
        </div>
        <div class="row tiny-gutters">
            <div class="form-group col-6">
                <label for="txt-dni">DNI</label>
                <input type="text" class="form-control form-control-sm" id="txt-dni" name="txt-dni" maxlength="8">
            </div>
            <div class="form-group col">
                <label for="txt-fecha_nac">Fecha nacimiento</label>
                <input type="text" class="form-control form-control-sm" id="txt-fecha_nac" name="txt-fecha_nac">
            </div>
        </div>
        <div class="row tiny-gutters">
            <div class="form-group col">
                <label for="txt-direccion">Dirección *</label>
                <input type="text" class="form-control form-control-sm" id="txt-direccion" name="txt-direccion" onkeyup="mayuscula(this)">
            </div>
        </div>
        <div class="row tiny-gutters">
            <div class="form-group col">
                <label for="txt-correo">Correo electrónico *</label>
                <input type="text" class="form-control form-control-sm" id="txt-correo" name="txt-correo" onkeyup="minuscula(this)">
            </div>
        </div>
    </div>
    <div class="col-6 border-left">
        <div class="row tiny-gutters">
            <div class="form-group col-6">
                <label for="txt-usuario">Usuario</label>
                <input type="text" class="form-control form-control-sm" id="txt-usuario" name="txt-usuario" onkeyup="minuscula(this)">
            </div>
            <div class="form-group col">
                <label for="txt-clave">Contraseña</label>
                <input type="password" class="form-control form-control-sm" id="txt-clave" name="txt-clave">
            </div>
        </div>
        <div class="row tiny-gutters">
            <div class="form-group col-6">
                <label for="sel-sede">Sede</label>
                <select id="sel-sede" name="sel-sede" data-placeholder="Elegir sede" class="form-control form-control-sm">
                    <option value=""></option>
                    <?php
                    while ($row_sedes = $sedes->fetch_row()){
                        $sede_id = $row_sedes[0];
                        $sede_nom = $row_sedes[1];
                        ?>
                        <option value="<?php echo $sede_id ?>"><?php echo $sede_nom ?></option>
                    <?php } ?>
                </select>
            </div>
            <div class="form-group col">
                <label for="sel-area">Area</label>
                <select id="sel-area" name="sel-area" data-placeholder="Elegir área" class="form-control form-control-sm">
                    <option value=""></option>
                    <?php
                    while ($row_areas = $areas->fetch_row()){
                        list ($area_id, $area_nom) = $row_areas;
                        ?>
                        <option value="<?php echo $area_id ?>"><?php echo $area_nom ?></option>
                    <?php } ?>
                </select>
            </div>
        </div>
        <div class="row tiny-gutters">
            <div class="form-group col-6">
                <label for="sel-perfil">Perfil</label>
                <select id="sel-perfil" name="sel-perfil" data-placeholder="Elegir perfil" class="form-control form-control-sm">
                    <option value=""></option>
                    <?php
                    while ($row_perfiles = $perfiles->fetch_row()){
                        list ($perfil_id, $perfil_nom) = $row_perfiles;
                        ?>
                        <option value="<?php echo $perfil_id ?>"><?php echo $perfil_nom ?></option>
                    <?php } ?>
                </select>
            </div>
            <div class="form-group col">
                <label for="txt-extension">Extensión</label>
                <input type="text" class="form-control form-control-sm" id="txt-extension" name="txt-extension" maxlength="6">
            </div>
        </div>
        <div class="row tiny-gutters pb-0">
            <div class="form-group col-6">
                <label for="txt-fecha_ingreso">Fecha ingreso</label>
                <input type="text" class="form-control form-control-sm" id="txt-fecha_ingreso" name="txt-fecha_ingreso">
            </div>
            <div class="form-group col mb-0">
                <label for="">Foto *</label>
                <div class="custom-file">
                    <input id="file-foto" name="file-foto" type="file" class="custom-file-input">
                    <label for="file-foto" class="custom-file-label text-truncate" style="height: 31px; padding: 3px !important;"></label>
                </div>
            </div>
        </div>
        <div class="row tiny-gutters">
            <div class="form-group col">
                <label for="sel-permisos">Permisos</label>
                <select id="sel-permisos" name="sel-permisos[]" data-placeholder="Elegir permisos..." class="form-control form-control-sm" multiple style="width:350px;">
                    <option value=""></option>
                    <?php
                    while ($row_apps = $apps->fetch_row()){
                        $app_name = $row_apps[0];
                    ?>
                    <option value="<?php echo $app_name ?>"><?php echo $app_name ?></option>
                    <?php } ?>
                </select>
            </div>
        </div>
    </div>
</div>
<div class="alert alert-info" role="alert">
    <i class="fa fa-bell"></i> Los campos con (*) son opcionales...
</div>
<script>
$('#sel-sede, #sel-area, #sel-perfil, #sel-permisos').chosen({width:'100%'});
campo_fecha('#txt-fecha_nac','-18Y', '-65Y');
campo_fecha('#txt-fecha_ingreso','+0D', '-5Y');
$('#txt-dni, #txt-extension').numeric({decimal:false,negative:false});

//generación automática de usuario y contraseña
$('#txt-dni').blur(function() {
    let dni = $('#txt-dni').val();
    $('#txt-clave').val(dni);
})

$('#txt-apellido_paterno').blur(function() {
    var nom = $('#txt-nombre_1').val();
    var ape = $('#txt-apellido_paterno').val();

    var username = nom.substr(0,1)+ape;
    //var username = ape.substr(1,2);
    $('#txt-usuario').val(texto_limpio(username).toLowerCase());
})

$('#txt-usuario').change(function () {
    validar_usuario();
})


$('.custom-file-input').on('change', function() {
    let fileName = $(this).val().split('\\').pop();
    $(this).next('.custom-file-label').addClass("selected").html(fileName);
});
</script>