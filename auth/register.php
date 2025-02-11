<?php
include "../config.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $full_name = $_POST['full_name'];
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $role = $_POST['role'];

    $query = "INSERT INTO users (full_name, username, password, role) VALUES ('$full_name', '$username', '$password', '$role')";

    if (mysqli_query($conn, $query)) {
        echo "Foydalanuvchi muvaffaqiyatli ro‘yxatdan o‘tkazildi!";
    } else {
        echo "Xatolik yuz berdi: " . mysqli_error($conn);
    }
}
?>
