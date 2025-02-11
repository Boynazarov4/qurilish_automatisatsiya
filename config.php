<?php
$host = "localhost";
$user = "root";
$pass = "";
$dbname = "qurilish_db";

$conn = mysqli_connect($host, $user, $pass, $dbname);

if (!$conn) {
    die("Ma’lumotlar bazasi ulanishi muvaffaqiyatsiz bo‘ldi: " . mysqli_connect_error());
}
?>
