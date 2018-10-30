<nav class="navbar navbar-expand-lg navbar-dark bg-light fixed-top">
    <div class="container" id="topContainer">
        <div class="mr-auto">
        <a class="navbar-brand toggle-menu menu-left" href="#" title="Mostrar menú" data-toggle="modal" data-target="#menu-lateral-Modal">
            <img src="<?php $_SERVER['HTTP_HOST'] ?>/sicmol/images/logo_microi.fw.png" alt="">
        </a>
        <span class="text-app font-wight-bold" style="font-size: 18px"><?php echo $nombre_app ?></span>
        </div>
        <div class="ml-auto text-right text-black-50">
            Identificado como: <?php echo $s_nombre_completo." [".$s_usuario."]" ?> <a href="?doLogout=true" title="Cerrar sesión" class="text-danger"><i class="fa fa-sign-out-alt fa-lg"></i></a>
            <br \>
            <i class="far fa-clock" data-fa-transform="up-2"></i> Hora del servidor: <div id="servertime" class="text-right d-inline"></div>
        </div>
    </div>
</nav>