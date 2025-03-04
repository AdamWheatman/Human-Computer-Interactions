<?php
    if (session_status() === PHP_SESSION_NONE) {session_start();};

    session_unset();
    $_SESSION['loggedin'] = 0;

    header("Location: index.php");