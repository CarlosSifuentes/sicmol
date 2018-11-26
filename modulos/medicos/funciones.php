<?php
/**
 * Created by PhpStorm.
 * User: carlo
 * Date: 11/11/2018
 * Time: 9:08 AM
 */

function pausa_usuario($pausa, $uid){
    if ($pausa==0){
        $pausa_desc = '<a href="javascript:void(0)" class="text-success" title="Poner en pausa" onclick="pausar('.$uid.')"><i class="fa fa-user-check"></i></a>';
    } else if ($pausa==1) {
        $pausa_desc = '<a href="javascript:void(0)" class="text-danger" title="Reconectar usuario"><i class="fa fa-user-clock"></i></a>';
    }
    return $pausa_desc;
}