<?php 
    if (session_status() === PHP_SESSION_NONE) {session_start();};
    require_once("required/connections.php");
    require_once("required/functions.php");
    // set_session()
    set_session();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/base.css">
    <link rel="stylesheet" href="CSS/index.css">
    <title>92 Donner Kings</title>
</head>
<body>
    <?php require_once("required/header.php"); 
        if ($_SESSION['loggedin'] == 1){
            echo "<p class='welcome_message'>Welcome to 92 Donner Kings " .$_SESSION['name']. " </p>";
        }else{
            echo "<p class='welcome_message'>Welcome to 92 Donner Kings </p>";
        }

        if ( isset($_GET['error']) && $_GET['error'] == 1 ){ echo "You don't have permission to view admin pages";}
        
    ?>
</body>
</html>