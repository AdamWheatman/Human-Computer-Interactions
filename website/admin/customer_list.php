<?php 
    if (session_status() === PHP_SESSION_NONE) {session_start();};
    require_once "../required/connections.php";
    require_once "../required/functions.php";
    set_session();
    login_checker();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../CSS/base.css">
    <link rel="stylesheet" href="../CSS/index.css">
    <link rel="stylesheet" href="../CSS/table.css">
    <title>92 Donner Kings</title>
</head>
<body>
    <?php 
        require_once "../required/header.php";
        require_once "../required/admin_header.php";
        customer_table($conn);
    ?>
</body>
</html>