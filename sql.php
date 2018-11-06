<?php
/**
 * Created by PhpStorm.
 * User: carlo
 * Date: 5/11/2018
 * Time: 5:59 AM
 */
// Replace the value's of these variables with your own data:
$dsn = "mastermold"; // Data Source Name (DSN) from the file /usr/local/zend/etc/odbc.ini
$user = "sa"; // MSSQL database user
$password = "C0l0mbi@"; // MSSQL user password

$connect = odbc_connect($dsn, $user, $password);

//Verify connection
if ($connect) {
    //echo "Connection established.";
//    odbc_close($connect);
} else {
    die("Connection could not be established.");
}


$result=odbc_exec($connect,"select id, nombre from usuarios;");
/*
while(odbc_fetch_row($result)){
    for($i=1;$i<=odbc_num_fields($result);$i++){
        echo "Result is ".odbc_result($result,$i).'<br>';
    }
}*/
while ($row = odbc_fetch_array($result)) {
    echo $row['id'].' '.utf8_encode($row['nombre']).'<br>';
}
