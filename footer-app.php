<div class="container-fluid bg-light fixed-bottom p-2">
    <div class="container" id="bottomContainer">
        <div class="row">
            <div class="col mr-auto text-black-50">
                <i class="fa fa-user"></i> <?php echo $s_nombre_completo." [".$s_usuario."]" ?> <a href="?doLogout=true" title="Cerrar sesión" class="text-danger"><i class="fa fa-sign-out-alt fa-lg"></i></a>
            </div>
            <div class="col ml-auto text-right text-black-50">
                <i class="far fa-clock"></i> <div id="servertime" class="text-right d-inline"></div>
            </div>
        </div>
    </div>
</div>