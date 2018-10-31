<?php

//include 'Connections/dbc.php';

$hostname_dbc = "localhost";
$database_dbc = "sicmol";
$username_dbc = "root";
$password_dbc = "C0l0mbi@";

$mysqli = new mysqli($hostname_dbc, $username_dbc, $password_dbc, $database_dbc);

if ($mysqli->connect_errno) {
    echo "Lo sentimos, este sitio web está experimentando problemas.";
    echo "Error: Fallo al conectarse a MySQL debido a: \n";
    echo "Errno: " . $mysqli->connect_errno . "\n";
    echo "Error: " . $mysqli->connect_error . "\n";
    exit;
}

$mysqli->set_charset("utf8");

if (!isset($_SESSION)) {
    session_start();
}

// ** Logout the current user. **
$logoutAction = $_SERVER['PHP_SELF']."?doLogout=true";
if ((isset($_SERVER['QUERY_STRING'])) && ($_SERVER['QUERY_STRING'] != "")){
    $logoutAction .="&". htmlentities($_SERVER['QUERY_STRING']);
}

if ((isset($_GET['doLogout'])) &&($_GET['doLogout']=="true")){
    mysqli_query($mysqli, "UPDATE empleados SET ult_pausa=NULL WHERE usuario='".$_SESSION['MM_Username']."' AND estado=1");
    //to fully log out a visitor we need to clear the session varialbles
    $_SESSION['MM_Username'] = NULL;
    $_SESSION['MM_UserGroup'] = NULL;
    $_SESSION['PrevUrl'] = NULL;
    unset($_SESSION['MM_Username']);
    unset($_SESSION['MM_UserGroup']);
    unset($_SESSION['PrevUrl']);

    $logoutGoTo = "login.php";
    if ($logoutGoTo) {
        header("Location: $logoutGoTo");
        exit;
    }
}

if (!isset($_SESSION)) {
    session_start();
}
$MM_authorizedUsers = "";
$MM_donotCheckaccess = "true";

// *** Restrict Access To Page: Grant or deny access to this page
function isAuthorized($strUsers, $strGroups, $UserName, $UserGroup) {
    // For security, start by assuming the visitor is NOT authorized.
    $isValid = False;

    // When a visitor has logged into this site, the Session variable MM_Username set equal to their username.
    // Therefore, we know that a user is NOT logged in if that Session variable is blank.
    if (!empty($UserName)) {
        // Besides being logged in, you may restrict access to only certain users based on an ID established when they login.
        // Parse the strings into arrays.
        $arrUsers = Explode(",", $strUsers);
        $arrGroups = Explode(",", $strGroups);
        if (in_array($UserName, $arrUsers)) {
            $isValid = true;
        }
        // Or, you may restrict access to only certain users based on their username.
        if (in_array($UserGroup, $arrGroups)) {
            $isValid = true;
        }
        if (($strUsers == "") && true) {
            $isValid = true;
        }
    }
    return $isValid;
}

    $MM_restrictGoTo = "http://".$_SERVER['HTTP_HOST']."/sicmol/login.php";

if (!((isset($_SESSION['MM_Username'])) && (isAuthorized("",$MM_authorizedUsers, $_SESSION['MM_Username'], $_SESSION['MM_UserGroup'])))) {
    $MM_qsChar = "?";
    $MM_referrer = $_SERVER['PHP_SELF'];
    if (strpos($MM_restrictGoTo, "?")) $MM_qsChar = "&";
    if (isset($_SERVER['QUERY_STRING']) && strlen($_SERVER['QUERY_STRING']) > 0)
        $MM_referrer .= "?" . $_SERVER['QUERY_STRING'];
    $MM_restrictGoTo = $MM_restrictGoTo. $MM_qsChar . "accesscheck=" . urlencode($MM_referrer);
    header("Location: ". $MM_restrictGoTo);
    exit;
}

setlocale(LC_ALL, 'es_PE');
$s_usuario = $_SESSION['MM_Username'];
$s_id = $_SESSION['id'];
$s_sede = $_SESSION['sede'];
$s_sede_nom = $_SESSION['sede_nom'];
$s_nombres = $_SESSION['nombres'];
$s_apellidos = $_SESSION['apellidos'];
$s_area = $_SESSION['area'];
$s_app = $_SESSION['app'];
$s_perfil = $_SESSION['perfil'];
$s_nivel = $_SESSION['nivel'];
$s_ext = $_SESSION['ext'];
$s_correo = $_SESSION['mail'];
$s_nombre_completo = $_SESSION['nombre_completo'];

$s_pausa = 0;
if (isset($_SESSION['pausa'])&&$_SESSION['pausa']==1){
    $s_pausa = $_SESSION['pausa'];
} else {
    $result_pausa = mysqli_query($mysqli, "SELECT pausa=1 FROM empleados WHERE id=".$s_id);
    $s_pausa = $result_pausa->num_rows;
}

function formato_fecha($fecha){
    if (($fecha)&&($fecha!="0000-00-00")){
        return date('d/m/Y', strtotime($fecha));} else {
        return "";}
}

function sformato_fecha($fecha){
    if (($fecha)&&($fecha!="0000-00-00")){
        return date('d/m/y', strtotime($fecha));} else {
        return "";}
}

function fecha_hora ($fecha){
    if ($fecha){return date('d/m/Y h:ia', strtotime($fecha));}
    else {return "";}
}

function formato_hora ($hora){
    if ($hora){return date('h:ia', strtotime($hora));}
    else {return "";}
}

function formato_hhmmss ($hora){
    return date('h:i:sa', strtotime($hora));
}

function mil ($cifra){
    if ($cifra<10) {$zero = "000";}
    elseif ($cifra<100) {$zero = "00";}
    elseif ($cifra<1000) {$zero = "0";}
    return $zero.$cifra;
}

function cien ($cifra){
    if ($cifra<10) {$zero = "00";}
    elseif ($cifra<100) {$zero = "0";}
    return $zero.$cifra;
}

function si_no($value_sn){
    if ($value_sn == 0){$si_no = "";}
    elseif ($value_sn == 1) {$si_no = "Sí";}
    elseif ($value_sn == 2) {$si_no = "No";}
    return $si_no;
}

function extension ($fpath){
    $extension = substr(strrchr($fpath, "."),1);
    return $extension;
}
$ahora = date('Y-m-d H:i:s', time());
$hoy = date('Y-m-d', time());
$ayer = date('Y-m-d', strtotime('-1 days'));
$anteayer = date('Y-m-d', strtotime('-2 days'));
if (date('H', time())<12){$saludo = "Buenos días";} elseif ((date('H', time())>11) && (date('H', time())<19)){$saludo = "Buenas tardes";} elseif (date('H', time())>18) {$saludo = "Buenas noches";}

function conversor_segundos($seg_ini) {
    $horas = floor($seg_ini/3600);
    if ($horas<10){$horas = "0".$horas;}
    $minutos = floor(($seg_ini-($horas*3600))/60);
    if ($minutos<10){$minutos = "0".$minutos;}
    $segundos = $seg_ini-($horas*3600)-($minutos*60);
    if ($segundos<10){$segundos = "0".$segundos;}
    echo $horas.':'.$minutos.':'.$segundos;
}

function convertir_segundos($secdate, $o) {
    $horas = floor($secdate/3600);
//if ($horas<10){$horas = "0".$horas;}
    $minutos = floor(($secdate-($horas*3600))/60);
    if ($minutos<10){$minutos = "0".$minutos;}
    $segundos = $secdate-($horas*3600)-($minutos*60);
    if ($segundos<10){$segundos = "0".$segundos;}
    $second_hour = $horas.':'.$minutos.':'.$segundos;
    $second_minute = $minutos.':'.$segundos;
    if ($o=="h"){return $second_hour;}
    elseif ($o=="m"){return $second_minute;}
}

function clean_string($string) {
    $string = trim($string);

    $string = str_replace(
        array('á', 'à', 'ä', 'â', 'ª', 'Á', 'À', 'Â', 'Ä'),
        array('a', 'a', 'a', 'a', 'a', 'A', 'A', 'A', 'A'),
        $string
    );

    $string = str_replace(
        array('é', 'è', 'ë', 'ê', 'É', 'È', 'Ê', 'Ë'),
        array('e', 'e', 'e', 'e', 'E', 'E', 'E', 'E'),
        $string
    );

    $string = str_replace(
        array('í', 'ì', 'ï', 'î', 'Í', 'Ì', 'Ï', 'Î'),
        array('i', 'i', 'i', 'i', 'I', 'I', 'I', 'I'),
        $string
    );

    $string = str_replace(
        array('ó', 'ò', 'ö', 'ô', 'Ó', 'Ò', 'Ö', 'Ô'),
        array('o', 'o', 'o', 'o', 'O', 'O', 'O', 'O'),
        $string
    );

    $string = str_replace(
        array('ú', 'ù', 'ü', 'û', 'Ú', 'Ù', 'Û', 'Ü'),
        array('u', 'u', 'u', 'u', 'U', 'U', 'U', 'U'),
        $string
    );

    $string = str_replace(
        array('ñ', 'Ñ', 'ç', 'Ç'),
        array('n', 'N', 'c', 'C',),
        $string
    );

    //Esta parte se encarga de eliminar cualquier caracter extraño
    $string = str_replace(
        array("\\", "¨", "º", "-", "~",
            "#", "@", "|", "!", "\"",
            "·", "$", "%", "&", "/",
            "(", ")", "?", "'", "¡",
            "¿", "[", "^", "`", "]",
            "+", "}", "{", "¨", "´",
            ">", "<", ";", ",", ":", " "),
        '_',
        $string
    );


    return strtolower($string);
}

function clean_names($string){
    $string = str_replace(
        array("\\", "¨", "º", "-", "~",
            "#", "@", "|", "!", "\"",
            "·", "$", "%", "&", "/",
            "(", ")", "?", "'", "¡",
            "¿", "[", "^", "`", "]",
            "+", "}", "{", "¨", "´",
            ">", "<", ";", ",", ":"),
        '',
        $string
    );
    $string = preg_replace('/\s+/', ' ', $string);
    return strtoupper($string);
}

function file_ext($filename){
    return strtolower(substr(strrchr($filename, '.'), 1));
}

function hoy_dia(){
    return utf8_encode(ucfirst(strftime("%A, %d de %B del %Y", time())));
}

function hoy_fecha(){
    return utf8_encode(ucfirst(strftime("%d de %B del %Y", time())));
}

function hoy_hora(){
    return date('h:i:s a',time());
}

function hoy_anio(){
    return date('Y',time());
}

function fec_nac($f){
    if ($f!="0000-00-00"){
        return substr($f,6,2)."/".substr($f,4,2)."/".substr($f,0,4);}
}

function calculaedad($fechanacimiento){
    if ($fechanacimiento!=""){
        list($dia,$mes,$ano) = explode("/",$fechanacimiento);
        $ano_diferencia  = date("Y") - $ano;
        $mes_diferencia = date("m") - $mes;
        $dia_diferencia   = date("d") - $dia;
        if ($dia_diferencia < 0 || $mes_diferencia < 0)
        {$ano_diferencia--;}}
    else {$ano_diferencia="";}
    return $ano_diferencia;
}

function Edad( $fecha ) {
    list($Y,$m,$d) = explode("-",$fecha);
    return( date("md") < $m.$d ? date("Y")-$Y-1 : date("Y")-$Y );
}

function fecha_mysql($fecha){
    return implode("-",array_reverse(explode("/",$fecha)));
}

function fecha_jquery($fecha){
    $fecha_mysql = explode(" ",$fecha);
    return "'".fecha_mysql($fecha_mysql[0])." ".date('H:i:s',strtotime($fecha_mysql[1]." ".$fecha_mysql[2]))."'";
}

function fecha_jquery2($fecha){
    $fecha_mysql = explode(" ",$fecha);
    return fecha_mysql($fecha_mysql[0])." ".date('H:i:s',strtotime($fecha_mysql[1]." ".$fecha_mysql[2]));
}

function getBrowser()
{$u_agent = $_SERVER['HTTP_USER_AGENT'];
    $ub = '';
    if(preg_match('/MSIE/i',$u_agent))
    {$ub = "Internet Explorer";}
    elseif(preg_match('/Firefox/i',$u_agent))
    {$ub = "Mozilla Firefox";}
    elseif(preg_match('/Safari/i',$u_agent))
    {$ub = "Apple Safari";}
    elseif(preg_match('/Chrome/i',$u_agent))
    {$ub = "Google Chrome";}
    elseif(preg_match('/Flock/i',$u_agent))
    {$ub = "Flock";}
    elseif(preg_match('/Opera/i',$u_agent))
    {$ub = "Opera";}
    elseif(preg_match('/Netscape/i',$u_agent))
    {$ub = "Netscape";}
    return $ub;
}

function saludo(){
    if (date('H', time())<12){$saludo = "Buenos días ";}
    elseif (date('H', time())<19){$saludo = "Buenas tardes ";}
    elseif (date('H', time())<24){$saludo = "Buenas noches ";}
    return $saludo;
}

function utf ($texto){
    return utf8_encode(utf8_decode($texto));
}

function fexcel2unix($f){
    if ($f) {return date ("d/m/Y",($f-25568)*86400);} else {
        return "";
    }
}

function moneda($monto,$decimales=2){
    return number_format($monto, $decimales);
}

function meses_num($i){
    if ($i==""){$mes="00";}
    elseif ($i=="Enero"){$mes="01";}
    elseif ($i=="Febrero"){$mes="02";}
    elseif ($i=="Marzo"){$mes="03";}
    elseif ($i=="Abril"){$mes="04";}
    elseif ($i=="Mayo"){$mes="05";}
    elseif ($i=="Junio"){$mes="06";}
    elseif ($i=="Julio"){$mes="07";}
    elseif ($i=="Agosto"){$mes="08";}
    elseif ($i=="Septiembre"){$mes="09";}
    elseif ($i=="Octubre"){$mes="10";}
    elseif ($i=="Noviembre"){$mes="11";}
    elseif ($i=="Diciembre"){$mes="12";}
    return $mes;
}

/**
 * Downloader
 *
 * @param $archivo
 *  path al archivo
 * @param $downloadfilename
 *  (null|string) el nombre que queres usar para el archivo que se va a descargar.
 *  (si no lo especificas usa el nombre actual del archivo)
 *
 * @return file stream
 */
function download_file($archivo, $downloadfilename = null) {

    if (file_exists($archivo)) {
        $downloadfilename = $downloadfilename !== null ? $downloadfilename : basename($archivo);
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename="' . $downloadfilename.'"');
        header('Content-Transfer-Encoding: binary');
        header('Expires: 0');
        header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
        header('Pragma: public');
        header('Content-Length: ' . filesize($archivo));

        ob_clean();
        flush();
        readfile($archivo);
        exit;
    }

}

class OS_BR{

    private $agent = "";
    private $info = array();

    function __construct(){
        $this->agent = isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : NULL;
        $this->getBrowser();
        $this->getOS();
    }

    function getBrowser(){
        $browser = array("Navigator"            => "/Navigator(.*)/i",
            "Firefox"              => "/Firefox(.*)/i",
            "Internet Explorer"    => "/MSIE(.*)/i",
            "Google Chrome"        => "/chrome(.*)/i",
            "MAXTHON"              => "/MAXTHON(.*)/i",
            "Opera"                => "/Opera(.*)/i",
            "Android"				=> "/Linux; U/i",
            "IE Mobile"            => "/IEMobile(.*)/i",
            "Safari"               => "/safari(.*)/i",
            "Webkit"               => "/webkit(.*)/i",
            "Mobile"               => "/mobile(.*)/i"
        );
        foreach($browser as $key => $value){
            if(preg_match($value, $this->agent)){
                $this->info = array_merge($this->info,array("Browser" => $key));
                $this->info = array_merge($this->info,array(
                    "Version" => $this->getVersion($key, $value, $this->agent)));
                break;
            }else{
                $this->info = array_merge($this->info,array("Browser" => "UnKnown"));
                $this->info = array_merge($this->info,array("Version" => "UnKnown"));
            }
        }
        return $this->info['Browser'];
    }

    function getOS(){
        $OS = array('/Windows NT 10.0/i'	=>  'Windows 10',
            '/Windows NT 6.3/i'		=>  'Windows 8.1',
            '/windows nt 6.2/i'    	=>  'Windows 8',
            '/windows nt 6.1/i'    	=>  'Windows 7',
            '/windows nt 6.0/i'    	=>  'Windows Vista',
            '/windows nt 5.2/i'     =>  'Windows Server 2003/XP x64',
            '/windows nt 5.1/i'     =>  'Windows XP',
            '/windows xp/i'         =>  'Windows XP',
            '/windows nt 5.0/i'     =>  'Windows 2000',
            '/windows me/i'         =>  'Windows ME',
            '/win98/i'              =>  'Windows 98',
            '/Windows Phone 8.1/i'  =>  'Windows Phone 8.1',
            '/win95/i'              =>  'Windows 95',
            '/win16/i'              =>  'Windows 3.11',
            '/iPhone/i'             =>  'iPhone',
            '/macintosh|mac os x/i' =>  'Mac OS X',
            '/mac_powerpc/i'        =>  'Mac OS 9',
            '/tablet/i'     		=>  'Android Tablet',
            '/mobile/i'     		=>  'Android Movil',
            '/linux/i'              =>  'Linux',
            '/ubuntu/i'             =>  'Ubuntu',
            '/ipod/i'               =>  'iPod',
            '/ipad/i'               =>  'iPad',
            '/blackberry/i'         =>  'BlackBerry',
            '/webos/i'              =>  'Mobile'
        );

        foreach($OS as $key => $value){
            if(preg_match($key, $this->agent)){
                $this->info = array_merge($this->info,array("Operating System" => $value));
                break;
            }
        }
        return $this->info['Operating System'];
    }

    function getVersion($browser, $search, $string){
        $browser = $this->info['Browser'];
        $version = "";
        $browser = strtolower($browser);
        preg_match_all($search,$string,$match);
        switch($browser){
            case "firefox": $version = str_replace("/","",$match[1][0]);
                break;

            case "internet explorer": $version = substr($match[1][0],0,4);
                break;

            case "opera": $version = str_replace("/","",substr($match[1][0],0,5));
                break;

            case "navigator": $version = substr($match[1][0],1,7);
                break;

            case "ie mobile": $version = str_replace("/","",substr($match[1][0],0,5));
                break;

            case "maxthon": $version = str_replace(")","",$match[1][0]);
                break;

            case "google chrome": $version = substr($match[1][0],1,12);
        }
        return $version;
    }

    function showInfo($switch){
        $switch = strtolower($switch);
        switch($switch){
            case "browser": return $this->info['Browser'];
                break;

            case "os": return $this->info['Operating System'];
                break;

            case "version": return $this->info['Version'];
                break;

            case "all" : return array($this->info["Version"],
                $this->info['Operating System'], $this->info['Browser']);
                break;

            default: return "Unkonw";
                break;

        }
    }
}

$ruta = $_SERVER['SCRIPT_NAME'];
$ip = $_SERVER['REMOTE_ADDR'];
$ruta_actual = $_SERVER['PHP_SELF'].'?'.$_SERVER['QUERY_STRING'];

$obj = new OS_BR();
// // if you want to show one by one information then try showInfo() function

// get browser
$browser = $obj->showInfo('browser');

// get browser version
$version = $obj->showInfo('version');

// get Operating system
$sistema = $obj->showInfo('os');
$agent = $_SERVER['HTTP_USER_AGENT'];
$uri = $_SERVER['REQUEST_URI'];

if (preg_match("/solicitudes_oficina_tabla.php|act_ult_accion.php|solicitudes_tienda_tabla.php|SMS.php|SMS2.php|autofill_dni.php|tcm.php|dashboard.php|dashboard2.php|notificaciones.php|sum.php|generador_combos.php/i", $uri)){
    $registrar_visita = 0;
} else {
    $registrar_visita = 1;
}

if ($registrar_visita==1){
    mysqli_query ($mysqli, "INSERT INTO registro_visitas SET v_ruta='$ruta', v_usuario=$s_id, v_hora=NOW(), v_fecha=NOW(), v_sede=$s_sede, v_ip=INET_ATON('$ip'), v_browser='$browser', v_version='$version', v_sistema='$sistema', v_agente='$agent', v_uri='$uri'") or die (mysqli_error($mysqli));
}


function error_mysql($e){
    return "<br>Algo salió mal, por favor informa al administrador del sistema.<br><div style=\"color:red; background-color:yellow; padding:5px; border: solid 1px red\">".$e."</div>";
}

function ago($time)
{
    $periodos = array("segundo", "minuto", "hora", "día", "semana", "mes", "año", "década");
    $duraciones = array("60","60","24","7","4.35","12","10");
    $now = time();
    $diferencia = $now - $time;

    for($j = 0; $diferencia >= $duraciones[$j] && $j < count($duraciones)-1; $j++) {
        $diferencia /= $duraciones[$j];
    }
    $diferencia = round($diferencia);

    if($diferencia != 1) {
        if($j != 5){
            $periodos[$j].= "s";
        }else{
            $periodos[$j].= "es";
        }
    }

    return "Hace $diferencia $periodos[$j]";
}

function time_diff($start, $end="NOW")
{
    $sdate = strtotime($start);
    $edate = strtotime($end);

    $time = $edate - $sdate;
    if($time>=0 && $time<=59) {
        // Seconds
        $timeshift = $time.' segundos';

    } elseif($time>=60 && $time<=3599) {
        // Minutes + Seconds
        $pmin = ($edate - $sdate) / 60;
        $premin = explode('.', $pmin);

        $presec = $pmin-$premin[0];
        $sec = $presec*60;

        $timeshift = round($premin[0],0).'m '.round($sec,0).'s';

    } elseif($time>=3600 && $time<=86399) {
        // Hours + Minutes
        $phour = ($edate - $sdate) / 3600;
        $prehour = explode('.',$phour);

        $premin = $phour-$prehour[0];
        $min = explode('.',$premin*60);

        $presec = '0.'.@$min[1];
        $sec = $presec*60;

        $timeshift = round($prehour[0],0).' horas '.round($min[0],0).'m';//.round($sec,0).' seg ';

    } elseif($time>=86400) {
        // Days + Hours + Minutes
        $pday = ($edate - $sdate) / 86400;
        $preday = explode('.',$pday);

        $phour = $pday-$preday[0];
        $prehour = explode('.',$phour*24);

        $premin = ($phour*24)-$prehour[0];
        $min = explode('.',$premin*60);

        $presec = '0.'.@$min[1];
        $sec = $presec*60;

        $timeshift = round($preday[0],0).'d '.round($prehour[0],0).'h '.round($min[0],0).'m';

    }
    return $timeshift;
}

function segundos($dt1,$dt2){
    $y1 = substr($dt1,0,4);
    $m1 = substr($dt1,5,2);
    $d1 = substr($dt1,8,2);
    $h1 = substr($dt1,11,2);
    $i1 = substr($dt1,14,2);
    $s1 = substr($dt1,17,2);

    $y2 = substr($dt2,0,4);
    $m2 = substr($dt2,5,2);
    $d2 = substr($dt2,8,2);
    $h2 = substr($dt2,11,2);
    $i2 = substr($dt2,14,2);
    $s2 = substr($dt2,17,2);

    $r1=date('U',mktime($h1,$i1,$s1,$m1,$d1,$y1));
    $r2=date('U',mktime($h2,$i2,$s2,$m2,$d2,$y2));
    return ($r1-$r2);

}

function UltimoDiaMes($elAnio,$elMes) {
    return date("d",(mktime(0,0,0,$elMes+1,1,$elAnio)-1));
}


/*// tomamos todos los usuarios en linea
$resp = mysql_query("select * from usuarios_online where usuario=$s_id", $dbc) ;
// Si son los mismo actualizamos la tabla usuarios_online
if(mysql_num_rows($resp) > 0) {
mysql_query("update usuarios_online set fecha=NOW(), ip='$ip' where usuario=$s_id", $dbc) ;
}
// de lo contrario insertamos los nuevos
else {
mysql_query("insert into usuarios_online (fecha,ip, usuario) values (NOW(),'$ip', $s_id)", $dbc) ;
}*/

$stop = 1;

if (in_array($_SERVER['REQUEST_URI'],array("index.php","pausa.php?p=1"))){
    $stop = 0;
}

//if (($s_pausa==1)&&($stop==1)){die("<script>alert('Debes estar en estado Disponible para acceder'); location.href='http://".$_SERVER['HTTP_HOST']."s_pausaindex.php'</script>");}

function acceso_denegado($path = '', $perm = ''){
    die (header("location:http://".$_SERVER['HTTP_HOST']."/sicmol/acceso_denegado.php?path=".$path."&auth=".$perm));
}

function acceso($app, $permisos, $ruta){
    $acceso = explode(',', $permisos);
    if (!in_array($app, $acceso)){
        return acceso_denegado($ruta, $app);
    }
}

function disponible($i){
    if ($i == 0){$disponible = 'No disponible';}
    else if ($i == 1){$disponible = 'Disponible';}
    return $disponible;
}