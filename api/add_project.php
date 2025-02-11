<?php
include "../config.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $budget = $_POST['budget'];

    $query = "INSERT INTO projects (name, budget, start_date, end_date) 
              VALUES ('$name', '$budget', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 YEAR))";

    if (mysqli_query($conn, $query)) {
        echo "Loyiha muvaffaqiyatli qo‘shildi!";
    } else {
        echo "Xatolik yuz berdi: " . mysqli_error($conn);
    }
}
?>
