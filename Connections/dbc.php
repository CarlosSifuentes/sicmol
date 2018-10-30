<?php
# FileName="Connection_php_mysql.htm"
# Type="MYSQL"
# HTTP="true"
//$hostname_dbc = "192.169.0.2";
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

$mysqli->set_charset('utf8');